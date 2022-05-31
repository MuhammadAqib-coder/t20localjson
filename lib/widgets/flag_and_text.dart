import 'package:flutter/material.dart';
import 'package:t_twenty/utils/dimension.dart';

import 'image_row.dart';
import 'text.dart';

class FlagAndText extends StatelessWidget {
  final String flagOne;
  final String teamOne;
  final String flagTwo;
  final String teamTwo;

  double? size;
  FlagAndText(
      {Key? key,
      required this.flagOne,
      required this.teamOne,
      required this.flagTwo,
      required this.teamTwo,
      this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              ImageRow(
                address: flagOne,
                width: Dimension.width70,
                height: Dimension.height50,
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              GetText(
                text: teamOne,
                size: size,
              ),
            ],
          ),

          // SizedBox(
          //   //width: Dimension.width60,
          //   width: Dimension.width12,
          // ),
          GetText(
            text: 'VS',
            size: size,
          ),
          // SizedBox(
          //     //width: Dimension.width60,
          //     width: Dimension.width12),
          Row(
            children: [
              GetText(
                text: teamTwo,
                size: size,
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              ImageRow(
                address: flagTwo,
                width: Dimension.width70,
                height: Dimension.height50,
              )
            ],
          )
        ],
      ),
    );
  }
}
