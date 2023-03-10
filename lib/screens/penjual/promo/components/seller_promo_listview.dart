import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
// import 'package:umik/screens/penjual/edit_produk/seller_edit_product.dart';

class SellerPromoListView extends StatefulWidget {
  final String namaMenu, thumbnail, harga, status, keterangan;

  const SellerPromoListView({
    Key? key,
    required this.namaMenu,
    required this.thumbnail,
    required this.harga,
    required this.status,
    required this.keterangan,
  }) : super(key: key);

  @override
  State<SellerPromoListView> createState() => _SellerMenuListViewState();
}

class _SellerMenuListViewState extends State<SellerPromoListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(217, 217, 217, 217),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 110.0,
                    height: 100.0,
                    child: FadeInImage(
                      image:
                          NetworkImage('$kPublicStorage/${widget.thumbnail}'),
                      placeholder: const AssetImage(''),
                      // ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.namaMenu,
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 9),
                      Text(widget.harga,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 9),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.status,
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color:
                                        const Color.fromARGB(255, 19, 110, 22),
                                    fontSize: 15,
                                  ),
                            ),
                          ),
                          (widget.status == 'Selesai')
                              ? ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    backgroundColor: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Text(
                                    'Ulangi',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(fontSize: 12),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  child: IconButton(
                    iconSize: 15.0,
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {
                      // TODO: Nanti diubah ke edit promo (bukan add promo)
                      Navigator.pushNamed(context, '/add_promo');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
