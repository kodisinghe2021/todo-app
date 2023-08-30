import 'package:flutter/material.dart';
import 'package:student_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.textEditingController,
    this.width,
    this.maxLine,
    super.key,
  });

  final String hintText;
  final int? maxLine;
  final TextEditingController textEditingController;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? getScreenSize(context).width * .8,
      height: getScreenSize(context).height * .1,
      child: TextFormField(
        controller: textEditingController,
        maxLines: maxLine,
        decoration: InputDecoration(
          hintText: hintText,
          labelStyle: const TextStyle(
            color: Color(0xFF6200EE),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF6200EE)),
          ),
        ),
      ),
    );
  }
}
