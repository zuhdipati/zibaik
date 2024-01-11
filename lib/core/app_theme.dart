import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myTheme = ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true),
    useMaterial3: true,
    textTheme: myTextTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber));

final myTextTheme = TextTheme(
  bodyLarge:
      GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold),
  bodyMedium: GoogleFonts.plusJakartaSans(fontSize: 18),
  bodySmall:
      GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.bold),
  labelLarge: GoogleFonts.plusJakartaSans(fontSize: 16),
  labelMedium: GoogleFonts.plusJakartaSans(fontSize: 14),
);
