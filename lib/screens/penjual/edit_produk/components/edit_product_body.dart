// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:umik/constants.dart';
import 'package:umik/components/custom_text_input_field.dart';
import 'package:umik/screens/penjual/home/home_screen.dart';
import 'package:umik/services/storage_service.dart';

class EditProductBody extends StatefulWidget {
  const EditProductBody({super.key});

  @override
  State<EditProductBody> createState() => _EditProductBodyState();
}

class _EditProductBodyState extends State<EditProductBody> {
  final _formKey = GlobalKey<FormState>();

  final StorageService storage = StorageService();
  String? _produkId;
  String? _umkmId;
  String? _token;

  /* === Form fields === */
  XFile? imageFile;
  String imageName = '';
  var namaProdukController = TextEditingController();
  var deskripsiController = TextEditingController();
  String kategoriVal = '';
  var hargaController = TextEditingController();
  var stokController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  final nmProdukMaxLength = 255;
  final descMaxLength = 3000;
  final hargaMaxLength = 100;
  final stokMaxLength = 300;

  List<String> _kategoriList = [];
  final List<String?> errors = [];

  void _setProdukId(String id) {
    _produkId = id;
  }

  // Err related
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future _showImagePicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image;
      imageName = image!.name;
    });
  }

  /* === SECURE STORAGE === */
  Future _readUserAndUmkmData() async {
    try {
      final token = await storage.readSecureData('token') ?? '';
      final umkmId = await storage.readSecureData('umkm_id') ?? '';
      setState(() {
        _token = token;
        _umkmId = umkmId;
      });
      _getKategori();
    } catch (e) {
      print(e);
    }
  }

  /* === API Calls === */
  Future _getKategori() async {
    try {
      var url = '$kApiBaseUrl/categories';
      final response = await http.get(Uri.parse(url));

      // print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['data'];
        setState(() {
          _kategoriList = data.map((item) => item.toString()).toList();
          kategoriVal = _kategoriList.first;
        });
        _getFormValue();
      }
    } catch (e) {
      print(e);
    }
  }

  Future _getFormValue() async {
    try {
      var url = Uri.parse('$kApiBaseUrl/product/$_produkId');

      return await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      ).then((value) {
        final data = jsonDecode(value.body)['data'];
        print(data);
        if (value.statusCode == 200) {
          print('hello, success');
          setState(() {
            namaProdukController.text = data['nama_produk'];
            deskripsiController.text = data['deskripsi'];
            kategoriVal = data['kategori'];
            hargaController.text = data['harga'].toString();
            stokController.text = data['stok'].toString();
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future _onSubmit() async {
    try {
      var uri = Uri.parse('$kApiBaseUrl/product/$_produkId');
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll({
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token',
      });

      request.fields['_method'] = 'PUT';
      request.fields['umkm_id'] = _umkmId ?? '';
      request.fields['nama_produk'] = namaProdukController.text;
      request.fields['deskripsi'] = deskripsiController.text;
      request.fields['kategori'] = kategoriVal;
      request.fields['harga'] = hargaController.text;
      request.fields['stok'] = stokController.text;

      if (imageFile != null) {
        var stream = http.ByteStream(imageFile!.openRead());
        var length = await imageFile!.length();
        var multipartFile = http.MultipartFile(
          'gbr_produk',
          stream,
          length,
          filename: path.basename(imageFile!.path),
        );
        request.files.add(multipartFile);
      }
      final streamedResponse = await request.send();
      final response =
          await http.Response.fromStream(streamedResponse).then((value) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            SellerHomeScreen.routeName, (Route<dynamic> route) => false);
      });
      return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _readUserAndUmkmData();
  }

  @override
  Widget build(BuildContext context) {
    // Ekstrak argumen dari pushedNamed navigotor
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    final String produkId = args.isNotEmpty ? args['idProduk'] : '';
    _setProdukId(produkId);

    /* === FORM === */
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.only(bottom: 3),
        child: Column(
          children: [
            // [ Upload Gambar ]
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: KBgColor,
                      shape: const ContinuousRectangleBorder(),
                    ),
                    onPressed: _showImagePicker,
                    child: Center(
                      child: imageName.isEmpty
                          ? Text(
                              'Edit Foto',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 13),
                            )
                          : Text(
                              imageName,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 13),
                            ),
                    ),
                  ),
                ),
              ),
            ),

            // [ Nama Produk ]
            CustomTextInputField(
              label: 'Nama Produk',
              needLabel: true,
              hint: 'Masukkan nama produk',
              inputMaxLength: nmProdukMaxLength,
              fieldController: namaProdukController,
              isRequired: true,
              horizontalPadding: 20,
            ),

            // [ Deskripsi Produk ]
            CustomTextInputField(
              label: 'Deskripsi Produk',
              needLabel: true,
              hint: 'Masukkan deskripsi produk',
              inputMaxLength: descMaxLength,
              fieldController: deskripsiController,
              isRequired: true,
              horizontalPadding: 20,
            ),

            // [ Kategori ]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: KBgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Kategori',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: kategoriVal.isEmpty
                          ? const SizedBox(height: 60)
                          : DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                itemHeight: 60,
                                value: kategoriVal,
                                isExpanded: true,
                                style: Theme.of(context).textTheme.labelMedium,
                                items: _kategoriList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() => kategoriVal = value!);
                                },
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),

            // [ Harga Produk ]
            CustomTextInputField(
              label: 'Harga',
              needLabel: true,
              hint: 'Masukkan harga',
              inputMaxLength: hargaMaxLength,
              fieldController: hargaController,
              isRequired: true,
              horizontalPadding: 20,
            ),

            // [ Stok Produk ]
            CustomTextInputField(
              label: 'Stok',
              needLabel: true,
              hint: 'Masukkan Stok',
              inputMaxLength: stokMaxLength,
              fieldController: stokController,
              isRequired: true,
              horizontalPadding: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SizedBox(
                width: double.infinity, // set width to match the parent
                child: ElevatedButton(
                  onPressed: () {
                    _onSubmit();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Simpan',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
