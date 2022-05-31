import 'package:flutter/material.dart';

class GetText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  GetText({Key? key, required this.text, this.color = Colors.white, this.size=20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
