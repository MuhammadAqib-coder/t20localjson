import 'package:flutter/material.dart';
import 'package:t_twenty/widgets/icon.dart';
import 'package:t_twenty/widgets/text.dart';

class SmallContainer extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final String text;
  //final double screenHeight;
  const SmallContainer(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetIcon(icon: icon),
            GetText(
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
