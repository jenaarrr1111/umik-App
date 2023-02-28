import 'package:flutter/material.dart';
import 'package:umik/components/custom_text_field.dart';
import 'package:umik/components/default_button.dart';
import 'package:umik/components/second_button.dart';
import 'package:umik/screens/penjual/seller_address/seller_address_screen.dart';
import 'package:umik/screens/penjual/seller_email/seller_email_screen.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';
import 'package:umik/size_config.dart';

import '../../../../constants.dart';

class SellerSignUpForm extends StatefulWidget {
  const SellerSignUpForm({super.key});

  @override
  State<SellerSignUpForm> createState() => _SellerSignUpFormState();
}

class _SellerSignUpFormState extends State<SellerSignUpForm> {
  final _formKey = GlobalKey<FormState>();

  var namaUMKMController = TextEditingController();
  var namaController = TextEditingController();
  var estimasiController = TextEditingController();
  var noTlpController = TextEditingController();
  var plat1Controller = TextEditingController();
  var plat2Controller = TextEditingController();

  var textNamaUMKMLength = 0;
  var textNamaLength = 0;
  var textPlat1Length = 0;
  var textPlat2Length = 0;

  final namaUMKMLength = 100;
  final namaLength = 100;
  final plat1Length = 100;
  final plat2Length = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      child: Column(
        children: [
          form(),
        ],
      ),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            // [ Nama UMKM ]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: KBgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Nama UMKM',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          '${textNamaUMKMLength.toString()}/${namaUMKMLength.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: kTextSecondColor,
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: namaUMKMController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      hintText: 'Masukkan Nama UMKM',
                      filled: true,
                      counterText: '',
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLength: namaUMKMLength,
                    onChanged: (value) {
                      setState(() {
                        textNamaUMKMLength = value.length;
                      });
                    },
                    validator: (value) => value!.isEmpty
                        ? 'Nama UMKM tidak boleh kososng!'
                        : null,
                  ),
                ],
              ),
            ),

            // [ Nama Lengkap ]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: KBgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Nama Lengkap',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          '${textNamaLength.toString()}/${namaLength.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: kTextSecondColor,
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: namaController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      hintText: 'Masukkan Nama Lengkap',
                      filled: true,
                      counterText: '',
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLength: namaLength,
                    onChanged: (value) {
                      setState(() {
                        textNamaLength = value.length;
                      });
                    },
                    validator: (value) => value!.isEmpty
                        ? 'Nama Lengkap tidak boleh kososng!'
                        : null,
                  ),
                ],
              ),
            ),

            _buildTextButton(
              "Alamat",
              () {
                Navigator.pushNamed(context, SellerAddressScreen.routeName);
              },
            ),
            _buildTextButton(
              "Email",
              () {
                Navigator.pushNamed(context, SellerEmailScreen.routeName);
              },
            ),

            // [ No Telp ]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: KBgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Nomor Telepon',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: noTlpController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      hintText: 'Masukkan nomor telepon',
                      filled: true,
                      counterText: '',
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    // maxLength: estimasiLength,
                    onChanged: (value) {
                      setState(() {
                        // textEstimasiLength = value.length;
                      });
                    },
                    validator: (value) => value!.isEmpty
                        ? 'Nomor Telepon tidak boleh kososng!'
                        : null,
                  ),
                ],
              ),
            ),

            // [ Estimasi Pengerjaan]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: KBgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Estimasi Pengerjaan',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: estimasiController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      hintText: 'Masukkan Estimasi Pengerjaan',
                      filled: true,
                      counterText: '',
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    // maxLength: estimasiLength,
                    onChanged: (value) {
                      setState(() {
                        // textEstimasiLength = value.length;
                      });
                    },
                    validator: (value) => value!.isEmpty
                        ? 'Estimasi Pengerjaan tidak boleh kososng!'
                        : null,
                  ),
                ],
              ),
            ),

            // [ Plat 1 ]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: KBgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Plat Nomor kendaraan 1',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          '${textPlat1Length.toString()}/${plat1Length.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: kTextSecondColor,
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: plat1Controller,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      hintText: 'Masukkan Plat Nomor Kendaraan 1',
                      filled: true,
                      counterText: '',
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLength: plat1Length,
                    onChanged: (value) {
                      setState(() {
                        textPlat1Length = value.length;
                      });
                    },
                    validator: (value) => value!.isEmpty
                        ? 'Plat Nomor Kendaraan 1 tidak boleh kososng!'
                        : null,
                  ),
                ],
              ),
            ),

            // [ Plat 2 ]
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: KBgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Plat Nomor kendaraan 2',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          '${textPlat2Length.toString()}/${plat2Length.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: kTextSecondColor,
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: plat2Controller,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      hintText: 'Masukkan Plat Nomor Kendaraan 2',
                      filled: true,
                      counterText: '',
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLength: plat2Length,
                    onChanged: (value) {
                      setState(() {
                        textPlat2Length = value.length;
                      });
                    },
                    validator: (value) => value!.isEmpty
                        ? 'Plat Nomor Kendaraan 2 tidak boleh kososng!'
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextButton(String text, VoidCallback? press) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kTextColor,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          shape: const ContinuousRectangleBorder(),
          // shape:
          // RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: KBgColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
