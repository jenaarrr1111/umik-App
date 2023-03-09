// import 'package:flutter/material.dart';
// import 'package:umik/constants.dart';
// // import 'package:umik/screens/profile/components/nama/components/body.dart';

// import '../../../components/custom_profile.dart';
// import '../../../components/custom_text_input_field.dart';
// import '../../../components/form_error.dart';
// import '../../../services/storage_service.dart';
// import '../../../size_config.dart';
// import '../profile_screen.dart';

// class NamaScreen extends StatelessWidget {
//   // static String routeName = "/profile_nama";

//   final _formKey = GlobalKey<FormState>();
//   var namaController = TextEditingController();
//   final StorageService storage = StorageService();
//   String userToken = '';
//   int userId = 0;

//   Future storeProfileUser(String nama) async {
//     try {
//       await storage.writeSecureData('nama', nama);
//     } catch (e) {
//       print(e);
//     }
//   }

//   NamaScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Ubah Nama",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//           ),
//         ),
//         shadowColor: Colors.black45,
//         elevation: 20,
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => {
//               if (_formKey.currentState!.validate())
//                 {
//                   storeProfileUser(
//                     namaController.text,
//                   ),
//                   Navigator.pushNamed(context, ProfileScreen.routeName),
//                 }
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 15,
//               ),
//               child: Text(
//                 "Simpan",
//                 style: TextStyle(
//                   color: Color(0xFF33691E),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: NamaFromScreen(),
//     );
//   }
// }

// class NamaFromScreen extends StatefulWidget {
//   static var routeName;

//   const NamaFromScreen({super.key});

//   @override
//   State<NamaFromScreen> createState() => _NamaFromScreenState();
// }

// class _NamaFromScreenState extends State<NamaFromScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final List<String?> errors = [];
//   var namaController = TextEditingController();

//   final nmMaxLength = 30;

//   final StorageService storage = StorageService();
//   String userToken = '';
//   int userId = 0;

//   void addError({String? error}) {
//     if (!errors.contains(error)) {
//       setState(() {
//         errors.add(error);
//       });
//     }
//   }

//   void removeError({String? error}) {
//     if (errors.contains(error)) {
//       setState(() {
//         errors.remove(error);
//       });
//     }
//   }

//   // Simpan dan baca supaya bisa prepopulate form field
//   Future storeProfileUser(String namaUser) async {
//     try {
//       await storage.writeSecureData('nama_user', namaUser);
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> readProfileNamaUser() async {
//     try {
//       final String token = await storage.readSecureData('token') ?? '';
//       final String usrId = await storage.readSecureData('user_id') ?? '';
//       final String nmusr = await storage.readSecureData('nama') ?? '';

//       setState(() {
//         userToken = token;
//         userId = int.parse(usrId);
//         namaController.text = nmusr;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     readProfileNamaUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
//           child: Column(
//             children: [
//               form(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget form() {
//     return Form(
//       key: _formKey,
//       child: Padding(
//         padding: const EdgeInsets.all(2),
//         child: Column(
//           children: [
//             // [ Nama UMKM ]
//             CustomTextInputField(
//               label: 'Nama UMKM',
//               needLabel: true,
//               hint: 'Maskkan nama umkm',
//               inputMaxLength: nmMaxLength,
//               fieldController: namaController,
//               isRequired: true,
//             ),
//             FormError(errors: errors),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }
