import 'package:flutter/widgets.dart';
import 'package:umik/screens/cart/cart_screen.dart';
import 'package:umik/screens/penjual/seller_profile/nama/seller_nama_form.dart';
import 'package:umik/screens/penjual/seller_profile/no_handphone/Seller_hp_screen.dart';
import 'package:umik/screens/profile/no_handphone/hp_body.dart';
import 'package:umik/screens/profile/nama/nama_form.dart';
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
import 'package:umik/screens/penjual/seller_profile/seller_profile_screen.dart';
import 'package:umik/screens/pilih_lokasi/pilih_lokasi_screen.dart';
import 'package:umik/screens/promo/promo_screen.dart';
import 'package:umik/screens/penjual/pilih_menu/pilih_menu_screen.dart';
import 'package:umik/screens/penjual/tambah_promo/add_promo_screenA.dart';
import 'package:umik/screens/otp/otp_screen.dart';
import 'package:umik/screens/penjual/seller_address/seller_address_screen.dart';
import 'package:umik/screens/penjual/edit_produk/seller_edit_product.dart';
import 'package:umik/screens/penjual/home/home_screen.dart';
import 'package:umik/screens/penjual/seller_rute/seller_rute.dart';
import 'package:umik/screens/penjual/seller_sign_up/seller_sign_up_screen.dart';
import 'package:umik/screens/penjual/tambah_produk/seller_add_product.dart';
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
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  StrukScreen.routeName: (context) => StrukScreen(),
  SellerStrukScreen.routeName: (context) => SellerStrukScreen(),
  KeranjangScreen.routeName: (context) => KeranjangScreen(
        arguments: ModalRoute.of(context)!.settings.arguments as Map,
      ),
  UserRute.routeName: (context) => const UserRute(),
  DaftarUmkmScreen.routeName: (context) => const DaftarUmkmScreen(),
  DaftarProdukScreen.routeName: (context) => const DaftarProdukScreen(),
  LokasiScrees.routeName: (context) => const LokasiScrees(),
  PilihLokasiScreen.routeName: (context) => const PilihLokasiScreen(),
  RatingScreen.routeName: (context) => const RatingScreen(),
  RiwayatScreen.routeName: (context) => const RiwayatScreen(),

  //profile
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  NamaFromScreen.routeName: (context) => const NamaFromScreen(),
  HpBodyScreen.routeName: (context) => const HpBodyScreen(),
  SignOut.routeName: (context) => const SignOut(),

  //penjual
  SellerWelcomeScreen.routeName: (context) => const SellerWelcomeScreen(),
  SellerSignUpScreen.routeName: (context) => const SellerSignUpScreen(),
  SellerAddressScreen.routeName: (context) => const SellerAddressScreen(),
  SellerHomeScreen.routeName: (context) => const SellerHomeScreen(),
  SellerPromoScreen.routeName: (context) => const SellerPromoScreen(),
  SellerAddPromoScreen.routeName: (context) => const SellerAddPromoScreen(),
  SellerPilihMenuScreen.routeName: (context) => const SellerPilihMenuScreen(),
  SellerAddProductScreen.routeName: (context) => const SellerAddProductScreen(),
  SellerEditProductScreen.routeName: (context) =>
      const SellerEditProductScreen(),
  SellerPromoScreenUser.routeName: (context) => const SellerPromoScreenUser(),
  SellerRute.routeName: (context) => const SellerRute(),
  SellerProfileScreen.routeName: (context) => const SellerProfileScreen(),
  SellerNamaFromScreen.routeName: (context) => const SellerNamaFromScreen(),
  SellerHpScreen.routeName: (context) => const SellerHpScreen(),
};
