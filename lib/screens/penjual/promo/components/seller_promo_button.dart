import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

class PromoButton extends StatelessWidget {
  const PromoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        'Buat Promo',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.yellow),
      ),
    );
  }
}
