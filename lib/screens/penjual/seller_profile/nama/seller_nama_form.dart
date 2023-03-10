import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../components/custom_text_input_field.dart';
import '../../../../components/form_error.dart';
import '../../../../constants.dart';
import '../../../../services/storage_service.dart';
import '../../../../size_config.dart';
import '../seller_profile_screen.dart';

// import 'package:umik/screens/profile/components/nama/components/body.dart';

class SellerNamaFromScreen extends StatefulWidget {
  static String routeName = "/seller_profile_nama";
  const SellerNamaFromScreen({super.key});

  @override
  State<SellerNamaFromScreen> createState() => _SellerNamaFromScreenState();
}

class _SellerNamaFromScreenState extends State<SellerNamaFromScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  var namaController = TextEditingController();

  String? nama;
  String namaErrMsg = '';

  final nmMaxLength = 30;

  final StorageService storage = StorageService();
  String? _userId;
  String? _Token;

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

  Future _storeIdAndLevel(int id, String levelUser) async {
    try {
      await storage.writeSecureData('user_id', id.toString());
      await storage.writeSecureData('level_user', levelUser);
    } catch (e) {
      print(e);
    }
  }

  // Simpan dan baca supaya bisa prepopulate form field
  Future storeProfileUser(String nama) async {
    try {
      await storage.writeSecureData('nama', nama);
    } catch (e) {
      print(e);
    }
  }

  Future<void> readProfileNamaUser() async {
    try {
      final String token = await storage.readSecureData('token') ?? '';
      final String usrId = await storage.readSecureData('user_id') ?? '';
      final String nmusr = await storage.readSecureData('nama') ?? '';

      setState(() {
        _Token = token;
        _userId = usrId;
        namaController.text = nmusr;
      });
      _getFormValue();
    } catch (e) {
      print(e);
    }
  }

  Future _getFormValue() async {
    try {
      var url = Uri.parse('$kApiBaseUrl/users/$_userId');
      return await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_Token',
        },
      ).then((value) {
        final data = jsonDecode(value.body)['data'];
        print(data);
        if (value.statusCode == 200) {
          print('hello, success');
          setState(() {
            namaController.text = data['nama'];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future _onSubmit() async {
    try {
      var url = '$kApiBaseUrl/users/$_userId';
      return await http.put(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_Token',
        },
        body: {
          'nama': namaController.text,
        },
      ).then((value) {
        final res = jsonDecode(value.body);
        final resMsg = res['message'];

        if (value.statusCode != 200) {
          if (resMsg.runtimeType.toString() == '_JsonMap') {
            for (var item in resMsg.values) {
              addError(error: item[0]);
            }
          }
          return;
        }

        final data = res['data'];
        final idUser = data['id'];
        final lvlUser = data['level_user'];
        _storeIdAndLevel(idUser, lvlUser);
        Navigator.pushNamedAndRemoveUntil(
            context, SellerProfileScreen.routeName, (route) => false);
        storeProfileUser(
          namaController.text,
        );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    readProfileNamaUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ubah Nama",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        shadowColor: Colors.black45,
        elevation: 20,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // remove err msg
              setState(() {
                namaErrMsg = '';
              });

              if (!_formKey.currentState!.validate()) {
                if ([nama].contains(null)) {
                  print([nama]);
                  setState(() {
                    namaErrMsg = 'Nama harus terisi!';
                  });
                }
                return;
              }
              // klo semua baik" saja
              _onSubmit();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Text(
                "Simpan",
                style: TextStyle(
                  color: Color(0xFF33691E),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
            child: Column(
              children: [
                form(),
              ],
            ),
          ),
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
            // [ Nama ]
            CustomTextInputField(
              label: 'Nama UMKM',
              needLabel: true,
              hint: 'Maskkan nama umkm',
              inputMaxLength: nmMaxLength,
              fieldController: namaController,
              isRequired: true,
            ),
            FormError(errors: errors),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
