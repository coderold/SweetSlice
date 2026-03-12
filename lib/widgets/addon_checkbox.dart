import 'package:advmobprog_midterms_tp03_molina/core/responsive.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';
import 'package:flutter/material.dart';

class AddonCheckbox extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final bool isSelected;               // Added: tracks the check state
  final ValueChanged<bool?> onChanged; // Added: the callback function

  const AddonCheckbox({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.isSelected,          // Required in constructor
    required this.onChanged,           // Required in constructor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screensize.height(context) * 0.2, 
      child: Row(
        children: [

          Checkbox(
            activeColor: AppTheme.primary, 
            value: isSelected,           
            onChanged: onChanged,          
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "P ${price.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: AppTheme.primary, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}