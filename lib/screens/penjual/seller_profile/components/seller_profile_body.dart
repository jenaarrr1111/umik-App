import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'package:umik/screens/home/home_screen.dart';
import 'package:umik/screens/penjual/home/home_screen.dart';
import 'package:umik/screens/penjual/seller_profile/nama/seller_nama_form.dart';

import 'package:umik/screens/sign_out/sign_out.dart';
import 'package:umik/services/storage_service.dart';
import 'package:umik/size_config.dart';

import '../no_handphone/Seller_hp_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class SellerProfileBody extends StatefulWidget {
  const SellerProfileBody({super.key});

  @override
  State<SellerProfileBody> createState() => _SellerProfileBodyState();
}

class _SellerProfileBodyState extends State<SellerProfileBody> {
  // initialize storage
  final StorageService storage = StorageService();
  String nama_umkm = '';
  String nama = '';
  String noTelp = '';
  String email_umkm = '';
  String userId = '';
  String umkmId = '';
  String userToken = '';

  Future _readUserIdAndToken() async {
    try {
      final String usrId = await storage.readSecureData('user_id') ?? '';
      final String umkId = await storage.readSecureData('umkm_id') ?? '';
      final String token = await storage.readSecureData('token') ?? '';
      setState(() {
        userId = usrId;
        umkmId = umkId;
        userToken = token;
      });
      print('read success: $userId, $userToken, $umkmId, $umkId');
      _getUserData().then(
        (value) => _getUmkmData(),
      );
    } catch (e) {
      print(e);
    }
  }

  Future _getUmkmData() async {
    try {
      var url = '$kApiBaseUrl/umkm/$umkmId';
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
          nama_umkm = data['nama_umkm'];
          noTelp = data['no_tlp'];
          email_umkm = data['email_umkm'];
        });
        print('fetch umkm success: $nama_umkm, $noTelp, $email_umkm, $umkmId');
      }
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
          nama = data['nama'];
          umkmId = data['umkm_id'].toString();
        });
        print('fetch success: $nama');
        await storage.writeSecureData('umkm_id', umkmId);
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
            "Profile Kamu",
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
              Navigator.pushNamed(context, SellerNamaFromScreen.routeName),
            },
          ),
          ProfileMenu2(
            text: "Nama UMKM",
            fieldValue: nama_umkm,
            press: () {},
          ),
          ProfileMenu(
            text: "Handphone",
            fieldValue: noTelp,
            press: () => {
              Navigator.pushNamed(context, SellerHpScreen.routeName),
            },
          ),
          ProfileMenu2(
            text: "Email",
            fieldValue: email_umkm,
            press: () {},
          ),

          const SizedBox(height: 20),
          ProfileMenu3(
            text: "Lihat Toko Saya",
            press: () => {
              Navigator.pushNamed(context, SellerHomeScreen.routeName),
            },
          ),
          ProfileMenu3(
            text: "Rekap Penjualan",
            press: () => {
              // Navigator.pushNamed(context, SellerHomeScreen.routeName),
            },
          ),
          const SizedBox(height: 20),
          ProfileMenu3(
            text: "Beranda User",
            press: () => {Navigator.pushNamed(context, HomeScreen.routeName)},
          ),
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
