// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductText extends StatelessWidget {
  final TextStyle? style;
  final String text;
  const ProductText({
    Key? key,
    this.style,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: style ?? context.textTheme.titleLarge);
  }
}
