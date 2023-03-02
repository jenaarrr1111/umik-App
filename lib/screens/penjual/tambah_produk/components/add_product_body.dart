import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'package:umik/components/custom_text_input_field.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  final _formKey = GlobalKey<FormState>();
  List<String> _kategoriList = [];
  String kategoriVal = '';

  // Initialize form field controller
  var namaProdukController = TextEditingController();
  var deskripsiController = TextEditingController();
  var hargaController = TextEditingController();
  var stokController = TextEditingController();

  final nmProdukMaxLength = 255;
  final descMaxLength = 3000;
  final hargaMaxLength = 100;
  final stokMaxLength = 300;

  Future _getKategori() async {
    try {
      var url = '$kApiBaseUrl/categories';
      final response = await http.get(Uri.parse(url));

      print(jsonDecode(response.body));
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

  @override
  void initState() {
    super.initState();
    _getKategori();
  }

  Future _onSubmit() async {
    try {
      print('Nama produk ${namaProdukController.text}');
      print('Deskripsi produk ${deskripsiController.text}');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        '+ Tambah Foto',
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
                  onPressed: () {},
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
