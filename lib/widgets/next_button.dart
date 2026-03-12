import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets? padding;

  const NextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor, 
    this.textColor,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppTheme.primary,
          minimumSize: const Size(double.infinity, 60),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: context.textTheme.bodyLarge?.copyWith(
            color: textColor ?? AppTheme.background,
          ),
        ),
      ),
    );
  }
}