import 'package:flutter/material.dart';

typedef JumlahProdukCallback = void Function(int jmlProduk);

class CustomStepper extends StatefulWidget {
  CustomStepper({
    super.key,
    required this.lowerLimit,
    required this.upperLimit,
    required this.stepValue,
    required this.iconSize,
    required this.value,
    required this.setJumlahProduk,
  });

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  final JumlahProdukCallback setJumlahProduk;
  int value;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RoundedIconButton(
          icon: Icons.remove,
          iconSize: widget.iconSize,
          onPress: () {
            setState(() {
              widget.value = widget.value == widget.lowerLimit
                  ? widget.lowerLimit
                  : widget.value -= widget.stepValue;
            });
            widget.setJumlahProduk(widget.value);
          },
        ),
        Text(
          '${widget.value}',
          style: TextStyle(
            fontSize: widget.iconSize * 0.8,
          ),
          textAlign: TextAlign.center,
        ),
        RoundedIconButton(
          icon: Icons.add,
          iconSize: widget.iconSize,
          onPress: () {
            setState(() {
              widget.value = widget.value == widget.upperLimit
                  ? widget.upperLimit
                  : widget.value += widget.stepValue;
            });
            widget.setJumlahProduk(widget.value);
          },
        ),
      ],
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onPress,
    required this.iconSize,
  });

  final IconData icon;
  final onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 6.0,
      onPressed: onPress,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(iconSize * 0.5)),
      fillColor: Colors.black,
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize * 0.8,
      ),
    );
  }
}
