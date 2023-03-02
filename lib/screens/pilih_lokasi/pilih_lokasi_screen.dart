import 'package:flutter/material.dart';

import '../../size_config.dart';

class PilihLokasiScreen extends StatefulWidget {
  const PilihLokasiScreen({super.key});

  static String routeName = '/pilih_lokasi';

  @override
  State<PilihLokasiScreen> createState() => _PilihLokasiScreenState();
}

class _PilihLokasiScreenState extends State<PilihLokasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            left: 57,
            top: 26,
            child: Text(
              "Pilih lokasi",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Poppins",
                letterSpacing: 0,
              ),
            ),
          ),
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
          Positioned(
            left: 44,
            top: 69,
            child: Container(
              child: Container(
                key: Key(
                  "Rectangle 83 (72:219)",
                ),
                width: 326,
                height: 43,
                decoration: BoxDecoration(
                  color: Color(
                    0xffd9d9d9,
                  ),
                ),
              ),
              width: 326,
              height: 43,
              decoration: BoxDecoration(
                color: Color(
                  0xffd9d9d9,
                ),
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
            ),
          ),
          Positioned(
            left: 67,
            top: 79,
            child: Text(
              "Cari alamat",
              key: Key(
                "Cari alamat (72:220)",
              ),
              style: TextStyle(
                color: Color(
                  0xff525252,
                ),
                fontSize: 15,
                fontFamily: "Poppins",
                letterSpacing: 0,
              ),
            ),
          ),
          Positioned(
            left: 331,
            top: 82,
            right: 64,
            bottom: 636,
            child: Image.network(
              "grida://assets-reservation/images/72:221",
              width: 19,
              height: 18,
              key: Key(
                "Vector (72:221)",
              ),
            ),
          ),
          Positioned(
            left: 83,
            top: 134,
            child: Text(
              "Lokasimu saat ini",
              key: Key(
                "Lokasimu saat ini (72:223)",
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Poppins",
                letterSpacing: 0,
              ),
            ),
          ),
          Positioned(
            left: 83,
            top: 157,
            child: SizedBox(
              child: Text(
                "Jl. Bridjen Soeharjo, Sawojajar, Kec. Klojen, Kota Malang, Jawa Timur 65134, Indonesia",
                key: Key(
                  "Jl. Bridjen Soeharjo, Sawojajar, Kec. Klojen, Kota Malang, Jawa Timur 65134, Indonesia (72:224)",
                ),
                style: TextStyle(
                  color: Color(
                    0xff525252,
                  ),
                  fontSize: 10,
                  fontFamily: "Poppins",
                  letterSpacing: 0,
                ),
              ),
              width: 279,
            ),
          ),
          Positioned(
            left: 83,
            top: 222,
            child: SizedBox(
              child: Text(
                "Jl. Bridjen Soeharjo, Sawojajar, Kec. Klojen, Kota Malang, Jawa Timur 65134, Indonesia",
                key: Key(
                  "Jl. Bridjen Soeharjo, Sawojajar, Kec. Klojen, Kota Malang, Jawa Timur 65134, Indonesia (72:228)",
                ),
                style: TextStyle(
                  color: Color(
                    0xff525252,
                  ),
                  fontSize: 10,
                  fontFamily: "Poppins",
                  letterSpacing: 0,
                ),
              ),
              width: 279,
            ),
          ),
          Positioned(
            left: 83,
            top: 200,
            child: Text(
              "Rumah",
              key: Key(
                "Rumah (72:229)",
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Poppins",
                letterSpacing: 0,
              ),
            ),
          ),
          Positioned(
            left: 44,
            top: 136,
            child: Image.network(
              "grida://assets-reservation/images/72:226",
              width: 20,
              height: 19,
              key: Key(
                "My Location (72:226)",
              ),
            ),
          ),
          Positioned(
            left: 44,
            top: 203,
            child: Image.network(
              "grida://assets-reservation/images/72:225",
              width: 20,
              height: 19,
              key: Key(
                "Clock (72:225)",
              ),
            ),
          ),

          /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
          Container(),
        ],
      ),
      padding: EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
