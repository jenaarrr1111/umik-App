import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';
import 'package:umik/screens/sign_in/sign_in_screen.dart';
import 'package:umik/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Umik, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(100)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          "CHOOSE \nBEST FOOD",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(25),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ""
                          "For Healthy Life!",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: kTextSecondColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    DefaultButton(
                      text: "Get Started",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                        // Navigator.pushNamed(
                        //     context, SellerWelcomeScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
