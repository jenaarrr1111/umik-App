import 'package:flutter/material.dart';

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
      ),
      body: Column(
        children: <Widget>[
          const Text('ssaoeuhsa'),
          Row(
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'aseunh'),
                onChanged: (value) => {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
