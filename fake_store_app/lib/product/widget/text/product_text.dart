import '../../../packages_shelf.dart';
import 'package:flutter/material.dart';

class ProductText extends StatelessWidget {
  final TextStyle? style;
  final int? maxLine;
  final Color? color;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  final String text;
  const ProductText({
    Key? key,
    this.style,
    this.overflow,
    this.maxLine,
    required this.text,
    this.color,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLine ?? 15,
      style: style ?? context.textTheme.titleLarge?.copyWith(color: color),
      overflow: overflow ?? TextOverflow.visible,
    );
  }
}
