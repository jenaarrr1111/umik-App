import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/pilih_menu/components/widget_item_produk.dart';

class SellerPromo extends StatefulWidget {
  const SellerPromo({super.key});

  @override
  State<SellerPromo> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<SellerPromo> {
  final _formKey = GlobalKey<FormState>();

  // Initialize form field controller
  var namaProdukController = TextEditingController();
  var deskripsiController = TextEditingController();
  var hargaController = TextEditingController();
  var stokController = TextEditingController();
  Future _onSubmit() async {
    try {
      print('Nama produk ${namaProdukController.text}');
      print('Deskripsi produk ${deskripsiController.text}');
    } catch (e) {
      print('Yeah, gagal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(shrinkWrap: true, children: <Widget>[
        Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 2.0, color: Color.fromARGB(115, 158, 158, 158)),
                    bottom: BorderSide(
                        width: 4.0, color: Color.fromARGB(115, 158, 158, 158)),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Tampilkan promo',
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, bottom: 30, top: 20),
                          child: const item_produk()),
                    ),
                  ],
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
                      child: Text('Harga sebelum diskon',
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
                        hintText: 'Rp Masukkan harga awal',
                        filled: true,
                      ),
                      style: Theme.of(context).textTheme.titleMedium,
                      validator: (value) => value!.isEmpty
                          ? 'harga awal tidak boleh kososng!'
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
                      child: Text('Persentase diskon',
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
                        hintText: 'Masukkan persentase',
                        filled: true,
                      ),
                      style: Theme.of(context).textTheme.titleMedium,
                      validator: (value) => value!.isEmpty
                          ? 'persentase tidak boleh kososng!'
                          : null,
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
                      child: Text('Harga setelah diskon',
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
                        hintText: 'Masukkan Harga setelah diskon',
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
                      child: Text('Durasi promo',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Dari',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: stokController,
                                decoration: const InputDecoration(
                                  fillColor: Colors.transparent,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.start,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                        color: Colors.black38,
                                        width: 0.5,
                                      )),
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: 'Dari',
                                  filled: true,
                                ),
                                style: Theme.of(context).textTheme.titleMedium,
                                validator: (value) => value!.isEmpty
                                    ? 'Tidak boleh kososng!'
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Hingga ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: stokController,
                                decoration: const InputDecoration(
                                  fillColor: Colors.transparent,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.start,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                        color: Colors.black38,
                                        width: 0.5,
                                      )),
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: 'Hingga',
                                  filled: true,
                                ),
                                style: Theme.of(context).textTheme.titleMedium,
                                validator: (value) => value!.isEmpty
                                    ? 'Tidak boleh kososng!'
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
