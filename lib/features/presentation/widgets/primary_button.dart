import 'package:course_details/core/theme/app_color.dart';
import 'package:course_details/core/values/text_styles.dart';
import 'package:course_details/core/values/values.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final title;

  PrimaryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size40,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(r10),
      ),
      child: Text(
        title,
        style: style_white_w500_16,
      ),
    );
  }
}
