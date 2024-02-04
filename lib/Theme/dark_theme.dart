import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

final ThemeData darkTheme= ThemeData(
  colorScheme: kDarkColorScheme,
  appBarTheme: ThemeData.dark().appBarTheme.copyWith(
    foregroundColor: kDarkColorScheme.onPrimaryContainer,
    backgroundColor: kDarkColorScheme.primaryContainer,
  ),
  cardTheme: ThemeData.dark().cardTheme.copyWith(
    color: kDarkColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
  ),
  iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: kDarkColorScheme.onPrimaryContainer,
  ),
  textTheme: ThemeData.dark().textTheme.copyWith(
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
  dropdownMenuTheme: ThemeData.dark().dropdownMenuTheme.copyWith(
    textStyle: ThemeData.dark().textTheme.bodyMedium,
  ),

);

