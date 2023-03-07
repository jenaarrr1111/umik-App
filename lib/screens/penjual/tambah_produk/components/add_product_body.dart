// import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:umik/components/custom_text_input_field.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/home/home_screen.dart';
import 'package:umik/services/storage_service.dart';
// import 'package:http_parser/http_parser.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  final _formKey = GlobalKey<FormState>();

  final StorageService storage = StorageService();
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

  /* === SECURE STORAGE === */
  Future _showImagePicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image;
      imageName = image!.name;
    });
  }

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
      // if response successful
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['data'];
        // print(data);
        setState(() {
          _kategoriList = data.map((item) => item.toString()).toList();
          kategoriVal = _kategoriList.first;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  // https://sahasuthpala.medium.com/image-upload-request-using-http-package-in-flutter-77faa467e215
  // https://stackoverflow.com/questions/51161862/how-to-send-an-image-to-an-api-in-dart-flutter
  // https://stackoverflow.com/questions/51075166/trying-to-upload-the-image-to-server-in-the-flutter-using-dart
  Future _onSubmit() async {
    try {
      // to byte stream
      var stream = http.ByteStream(imageFile!.openRead());
      // get length for http post
      var length = await imageFile!.length();
      // string to uri
      var uri = Uri.parse('$kApiBaseUrl/product');
      // new multipart request
      var request = http.MultipartRequest('POST', uri);
      // add headers
      request.headers.addAll({
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token',
      });
      var multipartFile = http.MultipartFile(
        'gbr_produk',
        stream,
        length,
        filename: path.basename(imageFile!.path),
        // filename: basename(imageFile!.path),
        // contentType: MediaType('image', 'png'),
      );

      request.fields['umkm_id'] = _umkmId ?? '';
      request.fields['nama_produk'] = namaProdukController.text;
      request.fields['deskripsi'] = deskripsiController.text;
      request.fields['kategori'] = kategoriVal;
      request.fields['harga'] = hargaController.text;
      request.fields['stok'] = stokController.text;

      // add multipart form to request
      request.files.add(multipartFile);
      // send request
      final streamedResponse = await request.send();
      // get response
      final response =
          await http.Response.fromStream(streamedResponse).then((value) {
        // final data = jsonDecode(value.body);
        // Navigator.of(this.context)
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
                              '+ Tambah Foto',
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
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        imageFile != null) {
                      _onSubmit();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
