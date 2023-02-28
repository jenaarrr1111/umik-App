// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:umik/components/custom_text_field.dart';
import 'package:umik/components/default_button.dart';
import 'package:umik/components/second_button.dart';
import 'package:umik/screens/penjual/seller_address/seller_address_screen.dart';
import 'package:umik/screens/penjual/seller_email/seller_email_screen.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';
import 'package:umik/size_config.dart';

import '../../../../constants.dart';

class SellerAddressForm extends StatefulWidget {
  const SellerAddressForm({super.key});

  @override
  State<SellerAddressForm> createState() => _SellerAddressFormState();
}

class _SellerAddressFormState extends State<SellerAddressForm> {
  final _formKey = GlobalKey<FormState>();
  var ProvinsiController = TextEditingController();
  var KotaController = TextEditingController();
  var KecamatanController = TextEditingController();
  var KodePosController = TextEditingController();
  var JalanController = TextEditingController();
  var DetailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                // padding: const EdgeInsets.all(10),
                padding: EdgeInsets.only(bottom: 10, left: 14),
                child: Text(
                  "Alamat Toko",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
          form(),
        ],
      ),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //[Provinsi]
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: KBgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: ProvinsiController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.all(5),
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
                      hintText: 'Provinsi',
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) =>
                        value!.isEmpty ? 'Provinsi tidak boleh kososng!' : null,
                  ),
                ),
              ],
            ),
          ),
          // [ Kota ]
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: KBgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: KotaController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.all(5),
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
                      hintText: 'Kota',
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) =>
                        value!.isEmpty ? 'Kota tidak boleh kososng!' : null,
                  ),
                ),
              ],
            ),
          ),
          // [ Kecamatan ]
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: KBgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: KecamatanController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.all(5),
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
                      hintText: 'Kecamatan',
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) => value!.isEmpty
                        ? 'Kecamatan tidak boleh kososng!'
                        : null,
                  ),
                ),
              ],
            ),
          ),
          // [ Kode Pos ]
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: KBgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: KodePosController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.all(5),
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
                      hintText: 'Kode Pos',
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) =>
                        value!.isEmpty ? 'Kode Pos tidak boleh kososng!' : null,
                  ),
                ),
              ],
            ),
          ),
          // [ Nama Jalan ]
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: KBgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: JalanController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.all(5),
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
                      hintText: 'Nama Jalan/Gedung/No.Rumah',
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) => value!.isEmpty
                        ? 'Nama Jalan/Gedung/No.Rumah tidak boleh kososng!'
                        : null,
                  ),
                ),
              ],
            ),
          ),
          // [ Detail ]
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: KBgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: KecamatanController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.all(5),
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
                      hintText: 'Detail Lainnya (Cnt: Blok/Unit No. Patokan)',
                      filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) => value!.isEmpty
                        ? 'Detail Lainnya tidak boleh kososng!'
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
