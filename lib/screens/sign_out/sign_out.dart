import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:umik/services/storage_service.dart';

class SignOut extends StatefulWidget {
  const SignOut({super.key});

  static String routeName = '/sign_out';

  @override
  State<SignOut> createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  final storage = StorageService();
  // var userToken = '';

  Future<void> getUserTokenAndLogout() async {
    try {
      final String token = await storage.readSecureData('token') ?? '';
      // setState(() => userToken = token);
      logout(token);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteData() async {
    try {
      await storage.deleteAll();
    } catch (e) {
      print(e);
    }
  }

  Future logout(String userToken) async {
    try {
      return await http.post(
        Uri.parse('http://umik.test/api/logout'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      ).then((value) {
        final data = jsonDecode(value.body);
        print('token: $userToken');
        print('data: $data');
        deleteData();
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign_in', (route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserTokenAndLogout();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
