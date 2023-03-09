import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'package:umik/screens/profile/components/profile_menu.dart';
import 'package:umik/screens/profile/components/profile_pic.dart';
import 'package:umik/screens/profile/nama/nama_form.dart';
import 'package:umik/screens/profile/no_handphone/hp_screen.dart';
import 'package:umik/screens/sign_out/sign_out.dart';
import 'package:umik/services/storage_service.dart';
import 'package:umik/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // initialize storage
  final StorageService storage = StorageService();
  String username = '';
  String nama = '';
  String noTelp = '';
  String email = '';
  String userId = '';
  String userToken = '';

  Future _readUserIdAndToken() async {
    try {
      final String usrId = await storage.readSecureData('user_id') ?? '';
      final String token = await storage.readSecureData('token') ?? '';
      setState(() {
        userId = usrId;
        userToken = token;
      });
      _getUserData();
    } catch (e) {
      print(e);
    }
  }

  Future _getUserData() async {
    try {
      var url = '$kApiBaseUrl/users/$userId';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        setState(() {
          username = data['username'];
          nama = data['nama'];
          noTelp = data['no_tlp'];
          email = data['email'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _readUserIdAndToken();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          // SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            "Profile Saya",
            style: heading1Style,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          const ProfilePic(),
          SizedBox(height: getProportionateScreenHeight(10)),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Edit Foto",
              style: TextStyle(
                // fontSize: getProportionateScreenWidth(15),
                color: kTextSecondColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Nama",
            fieldValue: nama,
            press: () => {
              Navigator.pushNamed(context, NamaFromScreen.routeName),
            },
          ),
          ProfileMenu2(
            text: "Username",
            fieldValue: username,
            press: () {},
          ),
          ProfileMenu(
            text: "Handphone",
            fieldValue: noTelp,
            press: () => {
              Navigator.pushNamed(context, HpScreen.routeName),
            },
          ),
          ProfileMenu2(
            text: "Email",
            fieldValue: email,
            press: () {},
          ),
          ProfileMenu(
            text: "Mulai Sebagai Penjual",
            press: () => {
              Navigator.pushNamed(context, SellerWelcomeScreen.routeName),
            },
          ),
          const SizedBox(height: 20),
          ProfileMenu3(
            text: "Logout",
            press: () => Navigator.pushNamedAndRemoveUntil(
                context, SignOut.routeName, (route) => false),
          ),
        ],
      ),
    );
  }
}
