import 'package:flutter/material.dart';

import '../../const/const_shelf.dart';
import '../../theme/colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key, required this.onChange, this.controller, this.icon});
  final void Function(String)? onChange;
  final TextEditingController? controller;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      cursorColor: AppColors.button,
      decoration: SearchTextFieldDecoration(context, icon),
    );
  }
}
