import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

import '../../../../../components/custom_text_input_field.dart';
import '../../../../../components/form_error.dart';
import '../../../../../services/storage_service.dart';
import '../../../../../size_config.dart';

// import 'package:umik/screens/profile/components/nama/components/body.dart';

class SellerNamaFromScreen extends StatefulWidget {
  const SellerNamaFromScreen({super.key});

  @override
  State<SellerNamaFromScreen> createState() => _SellerNamaFromScreenState();
}

class _SellerNamaFromScreenState extends State<SellerNamaFromScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  var namaController = TextEditingController();

  final nmMaxLength = 30;

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
