import 'package:flutter/material.dart';
import 'package:lachochant_app/common/widgets/appstyle.dart';
import 'package:lachochant_app/common/widgets/reusable_text.dart';

class CustomOTLNBTN extends StatelessWidget {
  const CustomOTLNBTN({super.key, this.onTap, required this.widht, required this.height, this.color2, required this.color, required this.text});

  final void Function()? onTap;
  final double widht;
  final double height;
  final Color? color2;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: widht,
        height: height,
        decoration: BoxDecoration(
          color: color2,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: color)
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appstyle(18, color, FontWeight.bold),
          ),
        ),
      ),
    );
  }
}