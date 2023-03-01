import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class BayarForm extends StatefulWidget {
  const BayarForm({super.key});

  @override
  State<BayarForm> createState() => _BayarFormState();
}

class _BayarFormState extends State<BayarForm> {
  final _formKey = GlobalKey<FormState>();
  var CatatanController = TextEditingController();

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
            _buildTextButton(
              "Pilih metode pembayaran",
              () {
                // Navigator.pushNamed(context, SellerAddressScreen.routeName);
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: KBgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: CatatanController,
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        contentPadding: EdgeInsets.only(
                          top: 10,
                          bottom: 70,
                        ),
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
                        hintText: 'Tambah Catatan',
                        filled: true,
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          textStyle: Theme.of(context).textTheme.titleSmall,
          backgroundColor: KBgColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(child: Text(text)),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
