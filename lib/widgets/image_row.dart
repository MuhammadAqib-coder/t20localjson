import 'package:flutter/material.dart';
import 'package:t_twenty/utils/dimension.dart';

import '../utils/schedule_model.dart';

class ImageRow extends StatelessWidget {
  ImageRow({
    Key? key,
    required this.address,
    required this.width,
    required this.height, 
  }) : super(key: key);
  final String address;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimension.height10),
      child: Image.asset(
        address,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
