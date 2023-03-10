import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:http/http.dart' as http;

import '../../../../services/storage_service.dart';
import '../seller_profile_screen.dart';

class SellerHpScreen extends StatefulWidget {
  static String routeName = "/seller_profile_hp";
  const SellerHpScreen({super.key});

  @override
  State<SellerHpScreen> createState() => _SellerHpScreenState();
}

class _SellerHpScreenState extends State<SellerHpScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];

  // Initialize form field controller
  var HpController = TextEditingController();

  String? no_tlp;
  String noErrMsg = '';

  final StorageService storage = StorageService();
  String? _UmkmId;
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

  Future _storeIdAndLevel(String no_tlp) async {
    try {
      await storage.writeSecureData('no_tlp', no_tlp);
    } catch (e) {
      print(e);
    }
  }

  // Simpan dan baca supaya bisa prepopulate form field
  Future storeProfileUser(String no_tlp) async {
    try {
      await storage.writeSecureData('no_tlp', no_tlp);
    } catch (e) {
      print(e);
    }
  }

  /* === SECURE STORAGE === */
  Future _readProfileUmkmData() async {
    try {
      final String token = await storage.readSecureData('token') ?? '';
      final String umkmId = await storage.readSecureData('umkm_id') ?? '';
      final String noumkm = await storage.readSecureData('no_tlp') ?? '';

      setState(() {
        _Token = token;
        _UmkmId = umkmId;
        HpController.text = noumkm;
      });
      _getFormValue();
    } catch (e) {
      print(e);
    }
  }

  Future _getFormValue() async {
    try {
      var url = Uri.parse('$kApiBaseUrl/umkm/$_UmkmId');
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
            HpController.text = data['no_tlp'];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future _onSubmit() async {
    try {
      var url = '$kApiBaseUrl/umkm/$_UmkmId';
      return await http.put(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_Token',
        },
        body: {
          'no_tlp': HpController.text,
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
        final no_tlp = data['no_tlp'];
        _storeIdAndLevel(no_tlp);
        Navigator.pushNamedAndRemoveUntil(
            context, SellerProfileScreen.routeName, (route) => false);
        storeProfileUser(
          HpController.text,
        );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _readProfileUmkmData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ubah No.Handphone",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        shadowColor: Colors.black45,
        elevation: 20,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // remove err msg
              setState(() {
                noErrMsg = '';
              });

              if (!_formKey.currentState!.validate()) {
                if ([no_tlp].contains(null)) {
                  print([no_tlp]);
                  setState(() {
                    noErrMsg = 'No Handphone harus terisi!';
                  });
                }
                return;
              }
              // klo semua baik" saja
              _onSubmit();
            },
            child: Text(
              "Simpan",
              style: TextStyle(
                color: Color(0xFF33691E),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              // [ No Handphone ]
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                color: KBgColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: HpController,
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
                        icon: Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Icon(Icons.call),
                        ),
                        hintText: 'No Handphone Baru',
                        filled: true,
                      ),
                      style: Theme.of(context).textTheme.titleMedium,
                      validator: (value) => value!.isEmpty
                          ? 'No Handphone tidak boleh kososng!'
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
