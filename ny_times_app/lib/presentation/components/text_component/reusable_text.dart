import 'package:flutter/material.dart';

class ReusableTextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const ReusableTextWidget(
      {Key? key,
      required this.text,
      required this.textStyle,
      this.textAlign,
      this.overflow,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
