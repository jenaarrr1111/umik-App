import 'package:flutter/material.dart';
import 'lokasi_screen.dart';

import '../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text('ssaoeuhsa'),
              Row(
                children: [
                  // TextField(
                  //   decoration: const InputDecoration(hintText: 'aseunh'),
                  //   onChanged: (value) => {},
                  // ),
                  TextField(
                    onChanged: (value) => print(value),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(15),
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Mau makan apa hari ini?",
                        prefixIcon: Icon(Icons.search)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
