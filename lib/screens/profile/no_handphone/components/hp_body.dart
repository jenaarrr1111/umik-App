import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

class HpBody extends StatefulWidget {
  const HpBody({super.key});

  @override
  State<HpBody> createState() => _HpBodyState();
}

class _HpBodyState extends State<HpBody> {
  final _formKey = GlobalKey<FormState>();

  // Initialize form field controller
  var HpController = TextEditingController();

  Future _onSubmit() async {
    try {
      print('No Handphone ${HpController.text}');
    } catch (e) {
      print('Fuck, gagal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }
}
