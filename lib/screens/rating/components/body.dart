import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:umik/screens/penjual/seller_sign_up/components/seller_sign_up_form.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

// This is the best practice

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _myColorOne = Colors.grey;
  final _myColorTwo = Colors.grey;
  final _myColorThree = Colors.grey;
  final _myColorFour = Colors.grey;
  final _myColorFive = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  "Gimana Makanannya?",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              const Text(
                "Apa yang kamu suka dari makanannya?",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: KBgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Kesegaran",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: KBgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Rasa",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: KBgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Kebersihan",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: KBgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Porsi",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: KBgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Kemasan",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: KBgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Kemasan",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(100),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 160,
                      right: 160,
                    ),
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Kirim",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
