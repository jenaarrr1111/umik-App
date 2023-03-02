import 'package:flutter/material.dart';
import 'package:umik/screens/rating/components/body.dart';

class RatingScreen extends StatelessWidget {
  static String routeName = "/rating";

  const RatingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bakmie Hokki, Soehat",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Inter",
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 75,
                ),
                child: Text(
                  "24 Mei 2022, 21.05",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            preferredSize: Size.zero),
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: const Body(),
    );
  }
}
