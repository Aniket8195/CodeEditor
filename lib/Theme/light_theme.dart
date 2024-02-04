import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: kColorScheme,
  appBarTheme: ThemeData().appBarTheme.copyWith(
    foregroundColor: kColorScheme.onPrimaryContainer,
    backgroundColor: kColorScheme.primaryContainer,
  ),
  cardTheme: ThemeData().cardTheme.copyWith(
    color: kColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
  ),
  iconTheme: ThemeData().iconTheme.copyWith(
    color: kColorScheme.onPrimaryContainer,
  ),
  dropdownMenuTheme: ThemeData().dropdownMenuTheme.copyWith(
    textStyle: ThemeData().textTheme.bodyMedium,
  ),
  textTheme: ThemeData().textTheme.copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),

);

