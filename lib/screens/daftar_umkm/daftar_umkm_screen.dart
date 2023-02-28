import 'package:flutter/material.dart';
import 'package:umik/screens/daftar_umkm/components/umkm_card.dart';

class DaftarUmkmScreen extends StatelessWidget {
  const DaftarUmkmScreen({super.key});
  static String routeName = '/daftar_umkm';

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, String>> kategoriHeader = {
      'Aneka Nasi': {
        'desc': 'Gak kenyang kalau belum makan nasi.',
        'banner_path': 'assets/images/daftar_umkm_banner/aneka_nasi.png',
      },
      'Seafood': {
        'desc': 'Bermacam-macam olahan laut ada disini.',
        'banner_path': 'assets/images/daftar_umkm_banner/seafood.png',
      },
      'Roti': {
        'desc': 'Digoreng, dibakar, dikukus, macam-macam.',
        'banner_path': 'assets/images/daftar_umkm_banner/roti.png',
      },
      'Minuman': {
        'desc': 'Minuman segar pelepas dahaga.',
        'banner_path': 'assets/images/daftar_umkm_banner/minuman.png',
      },
      'Jajanan': {
        'desc': 'Buat kamu yang doyan ngemil.',
        'banner_path': 'assets/images/daftar_umkm_banner/jajanan.png',
      },
      'Kopi': {
        'desc': 'Minumannya anti ngantuk ngantuk club! ',
        'banner_path': 'assets/images/daftar_umkm_banner/kopi.png',
      },
      'Bakmie': {
        'desc': 'Gak hepi kalau belum nge-mie.',
        'banner_path': 'assets/images/daftar_umkm_banner/bakmie.png',
      },
      'Cepat Saji': {
        'desc': 'Disiapin gak pake lama.',
        'banner_path': 'assets/images/daftar_umkm_banner/cepat_saji.png',
      },
    };

    // Ekstrak argumen dari pushedNamed navigotor
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    final String kategori = args.isNotEmpty ? args['title'] : '';

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (kategori.isEmpty) ...[
                  /* Klo ga ada kategori dlm request */
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kategori',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          'Deskripsi kategori',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Maaf terjadi kesalahan. Mohon coba beberapa saat lagi.',
                    ),
                  ),
                ] else ...[
                  /* Klo ada kategori di dlm request */
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      kategoriHeader[kategori]!['banner_path'].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kategori,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          kategoriHeader[kategori]!['desc'].toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: UmkmCard(kategori: kategori),
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: const Text(''),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
