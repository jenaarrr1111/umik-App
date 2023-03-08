import 'package:flutter/material.dart';
import 'package:umik/routes.dart';
import 'package:umik/screens/splash/splash_screen.dart';
import 'package:umik/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usaha Mikro Kecil',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
      /* onGenerateRoute: (settings) {
        print('build route for  ${settings.name}');
        // WidgetBuilder builder = routes
        /* if (settings.name == '') {
          print('build route for  ${settings.name}');
          re
        } */
      }, */
    );
  }
}
