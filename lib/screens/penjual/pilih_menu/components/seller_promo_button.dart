import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

import '../../tambah_promo/add_promo_screen.dart';

class PromoButton extends StatelessWidget {
  const PromoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: SizedBox(
        width: double.infinity, // set width to match the parent
        child: ElevatedButton(
          onPressed: () => {
            Navigator.pushNamed(context, SellerAddPromoScreen.routeName),
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            'Lanjut',
            style:
                Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
