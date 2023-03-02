import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umik/constants.dart';
import 'package:umik/models/Cart.dart';
import 'package:umik/screens/struk/components/widget_item_struk.dart';

import '../../../size_config.dart';
import 'struk_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              height: 100,
              color: kPrimaryColor,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bakmie Hokki, Soehat',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: const item_produk()),
                  ),
                  Text(
                    'DETAIL TRANSAKSI',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Color.fromARGB(255, 129, 128, 128),
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text('Waktu',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ),
                              Text('21:22',
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('No Pesanan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                                ),
                                Text('21',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text('Tanggal',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ),
                              Text('24 Mei 2022',
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('Nama Restoran',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                                ),
                                Text('Bakmie Hokki, Soehat',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'DETAIL PEMBAYARAN',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Color.fromARGB(255, 129, 128, 128),
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text('Sub Total',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ),
                              Text('Rp 38. 000',
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('Pajak',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                                ),
                                Text('Rp 7.600',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('Total Tagihan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                                ),
                                Text('Rp 45.600',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Positioned(
            top: 50,
            left: 50,
            right: 50,
            child: Container(
              width: 230,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 7,
                    blurRadius: 9,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: new EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 80,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: kPrimaryColor,
                          size: 22.0,
                        ),
                        Text(
                          'Berhasil',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: kPrimaryColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Waktu Selesai : 24 Mei 2022, 21.05',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
