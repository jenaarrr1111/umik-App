import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

import '../seller_profile_screen.dart';

class SellerHpScreen extends StatefulWidget {
  static String routeName = "/seller_profile_hp";
  const SellerHpScreen({super.key});

  @override
  State<SellerHpScreen> createState() => _SellerHpScreenState();
}

class _SellerHpScreenState extends State<SellerHpScreen> {
  final _formKey = GlobalKey<FormState>();

  // Initialize form field controller
  var HpController = TextEditingController();

  Future _onSubmit() async {
    try {
      print('Nama produk ${HpController.text}');
    } catch (e) {
      print(e);
    }
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
            onPressed: () => {
              Navigator.pushNamed(context, SellerProfileScreen.routeName),
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
