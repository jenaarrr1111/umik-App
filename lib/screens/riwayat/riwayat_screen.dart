import 'package:flutter/material.dart';
import 'package:umik/screens/rating/components/body.dart';

import 'components/proses.dart';
import 'components/riwayat.dart';

class RiwayatScreen extends StatelessWidget {
  static String routeName = "/riwayat";
  TabBar get _tabBar => TabBar(
        labelColor: Colors.black,
        tabs: [
          Tab(
            child: Text(
              "Sedang di Proses",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Riwayat",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );

  const RiwayatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Pesanan Saya",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Inter",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              child: _tabBar,
            ),
          ),
          shadowColor: Colors.black45,
          elevation: 20,
        ),
        body: TabBarView(
          children: [
            ProsesScreen(),
            RiwayatPesanScreen(),
          ],
        ),
      ),
    );
  }
}
