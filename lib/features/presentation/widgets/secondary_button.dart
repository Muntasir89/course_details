import 'package:course_details/core/theme/app_color.dart';
import 'package:course_details/core/values/text_styles.dart';
import 'package:course_details/core/values/values.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final title;
  SecondaryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.circular(r10),
          border: Border.all(width: 1, color: primaryColor),
        ),
        child: Text(
          title,
          style: style_primary_w400_12,
        ),
      ),
    );
  }
}
