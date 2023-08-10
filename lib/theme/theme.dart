import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  primarySwatch: Colors.yellow,
  dividerColor: Colors.white24,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 31, 31, 31),
    elevation: 0,
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
    scrolledUnderElevation: 0,
  ),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
    labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontWeight: FontWeight.w700,
        fontSize: 14),
  ),
);
