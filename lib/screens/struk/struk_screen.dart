import 'package:flutter/material.dart';
import 'package:umik/models/Cart.dart';

import 'components/body.dart';
import 'components/struk.dart';

class StrukScreen extends StatelessWidget {
  static String routeName = "/struk";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
