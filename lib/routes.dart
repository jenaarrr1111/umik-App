import 'package:flutter/widgets.dart';
import 'package:umik/screens/cart/cart_screen.dart';
import 'package:umik/screens/complete_profile/complete_profile_screen.dart';
import 'package:umik/screens/details/details_screen.dart';
import 'package:umik/screens/forgot_password/forgot_password_screen.dart';
import 'package:umik/screens/home/home_screen.dart';
import 'package:umik/screens/penjual/promo/promo_screen.dart';
import 'package:umik/screens/promo/promo_screen.dart';
import 'package:umik/screens/penjual/tambah_promo/add_promo_screen.dart';
import 'package:umik/screens/penjual/buat_promo/create_promo_screen.dart';
import 'package:umik/screens/otp/otp_screen.dart';
import 'package:umik/screens/penjual/seller_address/seller_address_screen.dart';
import 'package:umik/screens/penjual/seller_email/seller_email_screen.dart';
import 'package:umik/screens/penjual/edit_produk/seller_edit_product.dart';
import 'package:umik/screens/penjual/home/home_screen.dart';
import 'package:umik/screens/penjual/seller_sign_up/seller_sign_up_screen.dart';
import 'package:umik/screens/penjual/tambah_produk/seller_add_product.dart';
import 'package:umik/screens/profile/nama/nama_screen.dart';
import 'package:umik/screens/profile/no_handphone/hp_screen.dart';
import 'package:umik/screens/profile/profile_screen.dart';
import 'package:umik/screens/sign_in/sign_in_screen.dart';
import 'package:umik/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),

  //profile
  ProfileScreen.routeName: (context) => ProfileScreen(),
  NamaScreen.routeName: (context) => NamaScreen(),
  HpScreen.routeName: (context) => HpScreen(),

  //penjual
  SellerWelcomeScreen.routeName: (context) => SellerWelcomeScreen(),
  SellerSignUpScreen.routeName: (context) => SellerSignUpScreen(),
  SellerAddressScreen.routeName: (context) => SellerAddressScreen(),
  SellerEmailScreen.routeName: (context) => SellerEmailScreen(),
  SellerHomeScreen.routeName: (context) => SellerHomeScreen(),
  SellerPromoScreen.routeName: (context) => SellerPromoScreen(),
  SellerAddPromoScreen.routeName: (context) => SellerAddPromoScreen(),
  SellerCreatePromoScreen.routeName: (context) => SellerCreatePromoScreen(),
  SellerAddProductScreen.routeName: (context) => SellerAddProductScreen(),
  SellerEditProductScreen.routeName: (context) => SellerEditProductScreen(),
  SellerPromoScreenUser.routeName: (context) => SellerPromoScreenUser(),
};
