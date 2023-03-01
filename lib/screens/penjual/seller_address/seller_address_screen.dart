import 'package:flutter/material.dart';
import 'package:umik/components/custom_text_input_field.dart';
import 'package:umik/components/rectangle_bottom_first.dart';
import 'package:umik/screens/penjual/seller_sign_up/seller_sign_up_screen.dart';
import 'package:umik/services/storage_service.dart';
import 'package:umik/size_config.dart';

// import '../seller_sign_up/seller_sign_up_screen.dart';

class SellerAddressScreen extends StatefulWidget {
  static String routeName = "/seller_address";

  const SellerAddressScreen({super.key});

  @override
  State<SellerAddressScreen> createState() => _SellerAddressScreenState();
}

class _SellerAddressScreenState extends State<SellerAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final provinsiController = TextEditingController();
  final kotaController = TextEditingController();
  final kecamatanController = TextEditingController();
  final kodePosController = TextEditingController();
  final nmJalanController = TextEditingController();
  final detailController = TextEditingController();

  // initialize storage
  final StorageService storage = StorageService();
  String userToken = '';

  // Simpan dan baca supaya bisa prepopulate form field
  Future<void> storeUmkmAdress(
    String provinsi,
    String kota,
    String kecamatan,
    String kodePos,
    String nmJln,
    String detail,
  ) async {
    try {
      await storage.writeSecureData('provinsi', provinsi);
      await storage.writeSecureData('kota', kota);
      await storage.writeSecureData('kecamatan', kecamatan);
      await storage.writeSecureData('kode_pos', kodePos);
      await storage.writeSecureData('nama_jln', nmJln);
      await storage.writeSecureData('detail', detail);
    } catch (e) {
      print(e);
    }
  }

  Future getUmkmAdress() async {
    try {
      final provinsi = await storage.readSecureData('provinsi') ?? '';
      final kota = await storage.readSecureData('kota') ?? '';
      final kecamatan = await storage.readSecureData('kecamatan') ?? '';
      final kdPos = await storage.readSecureData('kode_pos') ?? '';
      final nmJln = await storage.readSecureData('nama_jln') ?? '';
      final detail = await storage.readSecureData('detail') ?? '';

      setState(() {
        provinsiController.text = provinsi;
        kotaController.text = kota;
        kecamatanController.text = kecamatan;
        kodePosController.text = kdPos;
        nmJalanController.text = nmJln;
        detailController.text = detail;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUmkmAdress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alamat Baru",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Alamat Toko",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            form(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(18),
          right: getProportionateScreenWidth(18),
          bottom: getProportionateScreenHeight(23),
        ),
        child: RectangleFirst(
            text: "Lanjut",
            press: () {
              if (_formKey.currentState!.validate()) {
                storeUmkmAdress(
                  provinsiController.text,
                  kotaController.text,
                  kecamatanController.text,
                  kodePosController.text,
                  nmJalanController.text,
                  detailController.text,
                );
                Navigator.pop(context);
              }
            }),
      ),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextInputField(
            label: 'Provinsi',
            needLabel: false,
            hint: 'Provinsi',
            fieldController: provinsiController,
            isRequired: true,
          ),
          CustomTextInputField(
            label: 'Kota',
            needLabel: false,
            hint: 'Kota',
            fieldController: kotaController,
            isRequired: true,
          ),
          CustomTextInputField(
            label: 'Kecamatan',
            needLabel: false,
            hint: 'Kecamatan',
            fieldController: kecamatanController,
            isRequired: true,
          ),
          CustomTextInputField(
            label: 'Kode Pos',
            needLabel: false,
            hint: 'Kode Pos',
            fieldController: kodePosController,
            isRequired: true,
          ),
          CustomTextInputField(
            label: 'Nama Jalan',
            needLabel: false,
            hint: 'Nama Jalan / Gedung / Rumah',
            fieldController: nmJalanController,
            isRequired: true,
          ),
          CustomTextInputField(
            label: '',
            needLabel: false,
            hint: 'Detail Lainnya(Cnt: Blok / Unit No, Patokan)',
            fieldController: detailController,
            isRequired: false,
          ),
        ],
      ),
    );
  }
}
