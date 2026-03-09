import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // --- Colors (Same as your inspo) ---
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
      // --- Typography Logic ---
      // We use a base size of 16px and scale up/down
      textTheme: TextTheme(
        // Massive titles (e.g., Splash screen)
        displayLarge: GoogleFonts.poppins(
          fontSize: 48, 
          fontWeight: FontWeight.w900, 
          color: textMain,
          letterSpacing: -1.0,
        ),

        // Screen titles (e.g., "Customize Your Cake")
        headlineLarge: GoogleFonts.poppins(
          fontSize: 32, // Base * 2
          fontWeight: FontWeight.bold,
          color: textMain,
        ),

        // Section headers (e.g., "Choose Toppings")
        headlineMedium: GoogleFonts.poppins(
          fontSize: 24, // Base * 1.5
          fontWeight: FontWeight.w700,
          color: textMain,
        ),

        // Small headers or Card titles (e.g., "Strawberry Shortcake")
        headlineSmall: GoogleFonts.poppins(
          fontSize: 20, // Base * 1.25
          fontWeight: FontWeight.w600,
          color: textMain,
        ),

        // Standard readable body text
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16, // The "Base" size
          color: textMain,
        ),

        // Captions, Muted descriptions, or Price tags
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14, 
          color: textMuted,
        ),

        // Smallest text (e.g., timestamps, tiny tags)
        labelSmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textMuted,
        ),
      ),
    );
  }
}