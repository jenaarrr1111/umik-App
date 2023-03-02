import 'package:flutter/material.dart';
import 'package:umik/screens/lokasi/body.dart';

import '../../size_config.dart';

class LokasiScrees extends StatefulWidget {
  const LokasiScrees({super.key});

  static String routeName = '/lokasi_user';

  @override
  State<LokasiScrees> createState() => _LokasiScreesState();
}

class _LokasiScreesState extends State<LokasiScrees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Lokasi'),
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: Body(),
    );
  }
}
