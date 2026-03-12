import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFFC06C6C);
  static const Color background = Color(0xFFF8EFEF);
  static const Color textMain = Color(0xFF2D2D2D);
  static const Color textMuted = Color(0xFF757575);
  static const Color success = Color(0xFF81C784);
  static const Color danger = Color(0xFFE57373);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      textTheme: TextTheme(

        displayLarge: GoogleFonts.poppins(
          fontSize: 48, 
          fontWeight: FontWeight.w900, 
          color: textMain,
          letterSpacing: -1.0,
        ),

        headlineLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textMain,
        ),

        headlineMedium: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: textMain,
        ),

        headlineSmall: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textMain,
        ),

        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          color: textMain,
        ),

        bodyMedium: GoogleFonts.poppins(
          fontSize: 14, 
          color: textMuted,
        ),

        labelSmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textMuted,
        ),
      ),
    );
  }
}