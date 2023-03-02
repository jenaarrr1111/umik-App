import 'package:flutter/material.dart';

class ProsesScreen extends StatefulWidget {
  const ProsesScreen({super.key});

  @override
  State<ProsesScreen> createState() => _ProsesScreenState();
}

class _ProsesScreenState extends State<ProsesScreen> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
              left: 20,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/bakmie_ayam_madu.png',
                  width: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bakmie Hokki, Soehat',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '24 Mei 2022, 21.05',
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '2 Bakmie Ayam Madu',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Sedang Di Proses',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
