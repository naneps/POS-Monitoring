import 'package:flutter/material.dart';
import 'package:mvvm_getx_pattern/app/commons/theme_manager.dart';

class SummaryText extends StatelessWidget {
  final String? title;
  final String? value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  const SummaryText({
    super.key,
    this.title,
    this.value,
    this.titleStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title ?? "Title",
            style: titleStyle ??
                TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ThemeManager().textColor)),
        Text(
          value ?? "Value",
          style: valueStyle ??
              TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: ThemeManager().textColor,
              ),
        ),
      ],
    );
  }
}
