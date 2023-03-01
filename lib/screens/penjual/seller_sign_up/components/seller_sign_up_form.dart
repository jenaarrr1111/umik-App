import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:umik/components/custom_text_input_field.dart';
import 'package:umik/components/form_error.dart';
import 'package:umik/components/rectangle_bottom_first.dart';
import 'package:umik/components/rectangle_bottom_second.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/seller_address/seller_address_screen.dart';
import 'package:umik/screens/penjual/seller_profile/seller_profile_screen.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';
import 'package:umik/services/storage_service.dart';
import 'package:umik/size_config.dart';

// Store idumkm ke storage
class SellerSignUpForm extends StatefulWidget {
  const SellerSignUpForm({super.key});

  @override
  State<SellerSignUpForm> createState() => _SellerSignUpFormState();
}

// Mohon maaf yg sebesar"nya krn sangat repetitif, TT
class _SellerSignUpFormState extends State<SellerSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];

  var namaUMKMController = TextEditingController();
  var namaController = TextEditingController();
  var estimasiController = TextEditingController();
  var noTlpController = TextEditingController();
  var plat1Controller = TextEditingController();
  var plat2Controller = TextEditingController();
  var emailController = TextEditingController();

  String? provinsi;
  String? kota;
  String? kecamatan;
  String? kodePos;
  String? namaJln;
  String? detail;

  String addressErrMsg = '';

  final nmUmkmMaxLength = 100;
  final nmMaxLength = 100;
  final plat1MaxLength = 100;
  final plat2MaxLength = 100;

  // initialize storage
  final StorageService storage = StorageService();
  String userToken = '';
  int userId = 0;

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

  // Simpan dan baca supaya bisa prepopulate form field
  Future storeUmkmData(String namaUmkm, String namaLengkap, String email,
      String noTlp, String estimasi, String plat1, String plat2) async {
    try {
      await storage.writeSecureData('nama_umkm', namaUmkm);
      await storage.writeSecureData('nama_lengkap', namaLengkap);
      await storage.writeSecureData('email_umkm', email);
      await storage.writeSecureData('no_tlp_umkm', noTlp);
      await storage.writeSecureData('estimasi', estimasi);
      await storage.writeSecureData('plat1', plat1);
      await storage.writeSecureData('plat1', plat1);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserAndUmkmDatas() async {
    try {
      final String token = await storage.readSecureData('token') ?? '';
      final String usrId = await storage.readSecureData('user_id') ?? '';

      // data umkm
      final String nmUmkm = await storage.readSecureData('nama_umkm') ?? '';
      final String nmLengkap =
          await storage.readSecureData('nama_lengkap') ?? '';
      final String emailUmkm = await storage.readSecureData('email_umkm') ?? '';
      final String noTlp = await storage.readSecureData('no_tlp_umkm') ?? '';
      final String estimasi = await storage.readSecureData('estimasi') ?? '';
      final String plat1 = await storage.readSecureData('plat1') ?? '';
      final String plat2 = await storage.readSecureData('plat2') ?? '';

      // alamat
      final String? provinsi = await storage.readSecureData('provinsi');
      final String? kota = await storage.readSecureData('kota');
      final String? kecamatan = await storage.readSecureData('kecamatan');
      final String? kodePos = await storage.readSecureData('kode_pos');
      final String? namaJln = await storage.readSecureData('nama_jln');
      final String? detail = await storage.readSecureData('detail');

      setState(() {
        userToken = token;
        userId = int.parse(usrId);

        namaUMKMController.text = nmUmkm;
        namaController.text = nmLengkap;
        emailController.text = emailUmkm;
        noTlpController.text = noTlp;
        estimasiController.text = estimasi;
        plat1Controller.text = plat1;
        plat2Controller.text = plat2;

        this.provinsi = provinsi;
        this.kota = kota;
        this.kecamatan = kecamatan;
        this.kodePos = kodePos;
        this.namaJln = namaJln;
        this.detail = detail;
      });
    } catch (e) {
      print(e);
    }
  }

  Future _storeIdUmkm(int id) async {
    try {
      await storage.writeSecureData('umkm_id', id.toString());
    } catch (e) {
      print(e);
    }
  }

  Future _onSubmit() async {
    try {
      var url = '$kApiBaseUrl/register/umkm';
      return await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: {
          'user_id': userId.toString(),
          'nama_umkm': namaUMKMController.text,
          'nama_lengkap': namaController.text,
          'provinsi': provinsi,
          'kota': kota,
          'kecamatan': kecamatan,
          'kode_pos': kodePos,
          'nama_jln': namaJln,
          'detail': detail,
          'no_tlp': noTlpController.text,
          'email_umkm': emailController.text,
          'plat_1': plat1Controller.text,
          'plat_2': plat2Controller.text,
          'estimasi_wkt_pekerjaan': estimasiController.text,
        },
      ).then((value) {
        final res = jsonDecode(value.body);
        final resMsg = res['message'];

        if (value.statusCode != 201) {
          if (resMsg.runtimeType.toString() == '_JsonMap') {
            for (var item in resMsg.values) {
              addError(error: item[0]);
            }
          }
          return;
        }

        final data = res['data'];
        final idUmkm = data['data_umkm']['id'];
        print('data: {$res["data"]}');
        print('idumkm: $idUmkm');
        // Store id umkm
        _storeIdUmkm(idUmkm);
        Navigator.pushNamed(context, SellerProfileScreen.routeName);
        storeUmkmData(
          namaUMKMController.text,
          namaController.text,
          emailController.text,
          noTlpController.text,
          estimasiController.text,
          plat1Controller.text,
          plat2Controller.text,
        );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserAndUmkmDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
          child: Column(
            children: [
              form(),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: RectangleSecond(
                  text: "Kembali",
                  press: () {
                    Navigator.pushNamed(context, SellerWelcomeScreen.routeName);
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(5),
                child: RectangleFirst(
                  text: "Kirim",
                  press: () {
                    // remove err msg
                    setState(() {
                      addressErrMsg = '';
                    });

                    if (!_formKey.currentState!.validate()) {
                      if ([provinsi, kota, kecamatan, kodePos, namaJln]
                          .contains(null)) {
                        print([provinsi, kota, kecamatan, kodePos, namaJln]);
                        setState(() {
                          addressErrMsg = 'Data alamat harus terisi lengkap';
                        });
                      }
                      return;
                    }

                    // klo semua baik" saja
                    _onSubmit();
                  },
                ),
              ),
            )
          ],
        ),
      ],
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
            CustomTextInputField(
              label: 'Nama UMKM',
              needLabel: true,
              hint: 'Maskkan nama umkm',
              inputMaxLength: nmUmkmMaxLength,
              fieldController: namaUMKMController,
              isRequired: true,
            ),

            // [ Nama Lengkap ]
            CustomTextInputField(
              label: 'Nama Lengkap',
              needLabel: true,
              hint: 'Maskkan nama lengkap',
              inputMaxLength: nmMaxLength,
              fieldController: namaController,
              isRequired: true,
            ),

            _buildTextButton(
              "Alamat",
              () {
                storeUmkmData(
                  namaUMKMController.text,
                  namaController.text,
                  emailController.text,
                  noTlpController.text,
                  estimasiController.text,
                  plat1Controller.text,
                  plat2Controller.text,
                );
                Navigator.pushNamed(context, SellerAddressScreen.routeName);
              },
              addressErrMsg,
            ),

            CustomTextInputField(
              label: 'Email',
              needLabel: true,
              hint: 'Masukkan email',
              fieldController: emailController,
              isRequired: true,
            ),

            // [ No Telp ]
            CustomTextInputField(
              label: 'No. Telp',
              needLabel: true,
              hint: 'Maskkan no. telp',
              fieldController: noTlpController,
              isRequired: true,
            ),

            // TODO: ubah input nya jadi input waktu
            // [ Estimasi Pengerjaan]
            CustomTextInputField(
              label: 'Estimasi waktu pengerjaan',
              needLabel: true,
              hint: 'Masukkan estimasi waktu',
              fieldController: estimasiController,
              isRequired: true,
            ),

            // [ Plat 1 ]
            CustomTextInputField(
              label: 'Plat Nomor Kendaraan 1',
              needLabel: true,
              hint: 'Masukkan plat nomor kendaraan',
              inputMaxLength: plat1MaxLength,
              fieldController: plat1Controller,
              isRequired: true,
            ),

            // [ Plat 2 ]
            CustomTextInputField(
              label: 'Plat Nomor Kendaraan 2',
              needLabel: true,
              hint: 'Masukkan plat nomor kendaraan',
              inputMaxLength: plat2MaxLength,
              fieldController: plat2Controller,
              isRequired: false,
            ),

            FormError(errors: errors),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTextButton(String text, VoidCallback? press, String errMsg) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kTextColor,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          shape: const ContinuousRectangleBorder(),
          backgroundColor: KBgColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 10),
                  errMsg.isNotEmpty
                      ? Text(
                          errMsg,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: Colors.red),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
