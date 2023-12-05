import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var primaryColor = Colors.green.shade900;

final myTheme = ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true),
    useMaterial3: true,
    textTheme: myTextTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff242424)));

final myTextTheme = TextTheme(
  bodyLarge: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
  bodyMedium: GoogleFonts.inter(fontSize: 18),
  bodySmall: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
  labelLarge: GoogleFonts.inter(fontSize: 16),
  labelMedium: GoogleFonts.inter(fontSize: 14),
);
