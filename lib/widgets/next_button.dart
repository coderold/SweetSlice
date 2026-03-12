import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const NextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return

    Padding(
      padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            minimumSize: const Size(double.infinity, 60),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: context.textTheme.bodyLarge?.copyWith(color: AppTheme.background),
          ),
        ),
    );
  }
  
}