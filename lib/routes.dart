import 'package:flutter/widgets.dart';
import 'package:umik/screens/cart/cart_screen.dart';
import 'package:umik/screens/struk/struk_screen.dart';
import 'package:umik/screens/penjual/seller_struk/seller_struk_screen.dart';
import 'package:umik/screens/complete_profile/complete_profile_screen.dart';
import 'package:umik/screens/daftar_produk/daftar_produk_screen.dart';
import 'package:umik/screens/daftar_umkm/daftar_umkm_screen.dart';
import 'package:umik/screens/details/details_screen.dart';
import 'package:umik/screens/forgot_password/forgot_password_screen.dart';
import 'package:umik/screens/home/home_screen.dart';
import 'package:umik/screens/keranjang/keranjang_screen.dart';
import 'package:umik/screens/lokasi/lokasi_screen.dart';
import 'package:umik/screens/penjual/promo/promo_screen.dart';
import 'package:umik/screens/penjual/seller_profile/nama/seller_nama_screen.dart';
import 'package:umik/screens/penjual/seller_profile/no_handphone/hp_screen.dart';
import 'package:umik/screens/penjual/seller_profile/seller_profile_screen.dart';
import 'package:umik/screens/pilih_lokasi/pilih_lokasi_screen.dart';
import 'package:umik/screens/promo/promo_screen.dart';
import 'package:umik/screens/penjual/pilih_menu/pilih_menu_screen.dart';
import 'package:umik/screens/penjual/tambah_promo/add_promo_screen.dart';
import 'package:umik/screens/otp/otp_screen.dart';
import 'package:umik/screens/penjual/seller_address/seller_address_screen.dart';
import 'package:umik/screens/penjual/edit_produk/seller_edit_product.dart';
import 'package:umik/screens/penjual/home/home_screen.dart';
import 'package:umik/screens/penjual/seller_rute/seller_rute.dart';
import 'package:umik/screens/penjual/seller_sign_up/seller_sign_up_screen.dart';
import 'package:umik/screens/penjual/tambah_produk/seller_add_product.dart';
import 'package:umik/screens/profile/nama/nama_screen.dart';
import 'package:umik/screens/profile/no_handphone/hp_screen.dart';
import 'package:umik/screens/profile/profile_screen.dart';
import 'package:umik/screens/rating/rating_screen.dart';
import 'package:umik/screens/riwayat/riwayat_screen.dart';
import 'package:umik/screens/rute/rute.dart';
import 'package:umik/screens/sign_in/sign_in_screen.dart';
import 'package:umik/screens/sign_out/sign_out.dart';
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
  StrukScreen.routeName: (context) => StrukScreen(),
  SellerStrukScreen.routeName: (context) => SellerStrukScreen(),
  KeranjangScreen.routeName: (context) => KeranjangScreen(),
  UserRute.routeName: (context) => UserRute(),
  DaftarUmkmScreen.routeName: (context) => DaftarUmkmScreen(),
  DaftarProdukScreen.routeName: (context) => DaftarProdukScreen(),
  LokasiScrees.routeName: (context) => LokasiScrees(),
  PilihLokasiScreen.routeName: (context) => PilihLokasiScreen(),
  RatingScreen.routeName: (context) => RatingScreen(),
  RiwayatScreen.routeName: (context) => RiwayatScreen(),

  //profile
  ProfileScreen.routeName: (context) => ProfileScreen(),
  NamaScreen.routeName: (context) => NamaScreen(),
  HpScreen.routeName: (context) => HpScreen(),
  SignOut.routeName: (context) => SignOut(),

  //penjual
  SellerWelcomeScreen.routeName: (context) => SellerWelcomeScreen(),
  SellerSignUpScreen.routeName: (context) => SellerSignUpScreen(),
  SellerAddressScreen.routeName: (context) => SellerAddressScreen(),
  SellerHomeScreen.routeName: (context) => SellerHomeScreen(),
  SellerPromoScreen.routeName: (context) => SellerPromoScreen(),
  SellerAddPromoScreen.routeName: (context) => SellerAddPromoScreen(
        arguments: ModalRoute.of(context)!.settings.arguments as Map,
      ),
  SellerPilihMenuScreen.routeName: (context) => SellerPilihMenuScreen(),
  SellerAddProductScreen.routeName: (context) => SellerAddProductScreen(),
  SellerEditProductScreen.routeName: (context) => SellerEditProductScreen(),
  SellerPromoScreenUser.routeName: (context) => SellerPromoScreenUser(),
  SellerRute.routeName: (context) => SellerRute(),
  SellerProfileScreen.routeName: (context) => SellerProfileScreen(),
  SellerNamaScreen.routeName: (context) => SellerNamaScreen(),
  SellerHpScreen.routeName: (context) => SellerHpScreen(),
};
