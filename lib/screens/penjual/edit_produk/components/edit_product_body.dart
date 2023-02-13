import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

class EditProductBody extends StatefulWidget {
  const EditProductBody({super.key});

  @override
  State<EditProductBody> createState() => _EditProductBodyState();
}

class _EditProductBodyState extends State<EditProductBody> {
  final _formKey = GlobalKey<FormState>();

  // Initialize form field controller
  var namaProdukController = TextEditingController();
  var deskripsiController = TextEditingController();
  var hargaController = TextEditingController();
  var stokController = TextEditingController();

  static const List<String> kategoriList = [
    'Kategori 1',
    'Kategori 2',
    'Kategori 3',
    'Kategori 4',
    'Kategori 5',
    'Kategori 6',
    'Kategori 7',
    'Kategori 8',
    'Kategori 9',
    'Kategori 10',
    'Kategori 11',
    'Kategori 12 super duper absolutely massively long category',
    'Kategori 13 super duper absolutely massively long category',
    'Kategori 14 super duper absolutely massively long category',
    'Kategori 15 super duper absolutely massively long category',
    'Kategori 16 super duper absolutely massively long category',
    'Kategori 17 super duper absolutely massively long category',
  ];

  String kategoriVal = kategoriList.first;

  Future _onSubmit() async {
    try {
      print('Nama produk ${namaProdukController.text}');
      print('Deskripsi produk ${deskripsiController.text}');
    } catch (e) {
      print('Fuck, gagal');
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
                      backgroundColor: const Color(0xFFF5F6F9),
                      shape: const ContinuousRectangleBorder(),
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Text('+ Tambah Foto',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 13)),
                    ),
                  ),
                ),
              ),
            ),

            // [ Nama Produk ]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: const Color(0xFFF5F6F9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text('Nama Produk',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: namaProdukController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 0.5,
                          )),
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: 'Masukkan nama produk',
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) => value!.isEmpty
                        ? 'Nama produk tidak boleh kososng!'
                        : null,
                  ),
                ],
              ),
            ),

            // [ Deskripsi Produk ]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: const Color(0xFFF5F6F9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text('Deskripsi Produk',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: deskripsiController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 0.5,
                          )),
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: 'Masukkan deskripsi produk',
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) => value!.isEmpty
                        ? 'Deskripsi produk tidak boleh kososng!'
                        : null,
                  ),
                ],
              ),
            ),

            // [ Kategori ]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: const Color(0xFFF5F6F9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, right: 10, left: 20),
                    child: Text('Kategori',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          itemHeight: 60,
                          value: kategoriVal,
                          isExpanded: true,
                          style: Theme.of(context).textTheme.titleMedium,
                          items: kategoriList.map((String value) {
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: const Color(0xFFF5F6F9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text('Harga',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: hargaController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 0.5,
                          )),
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: 'Masukkan harga',
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) =>
                        value!.isEmpty ? 'Harga tidak boleh kososng!' : null,
                  ),
                ],
              ),
            ),

            // [ Stok Produk ]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: const Color(0xFFF5F6F9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text('Stok',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: stokController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 0.5,
                          )),
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: 'Masukkan jumlah stok',
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) =>
                        value!.isEmpty ? 'Stok boleh kososng!' : null,
                  ),
                ],
              ),
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

