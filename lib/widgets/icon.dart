import 'package:flutter/material.dart';

class GetIcon extends StatelessWidget {
  final IconData icon;
  double size;
  Color color;
  GetIcon({Key? key, required this.icon, this.size=80, this.color=Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
