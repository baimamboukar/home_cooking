import 'package:flutter/material.dart';
import 'package:home_cooking/utils/palette.dart';

class SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const SocialButton(
      {Key? key, required this.label, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35.0, bottom: 18.0),
      child: Container(
          child: Row(
            children: [
              const SizedBox(width: 20.0),
              Icon(icon, color: Palette.light),
              const SizedBox(width: 20.0),
              Text(label)
            ],
          ),
          height: 50.0,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(24.0))),
    );
  }
}
