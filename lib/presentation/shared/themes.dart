import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.purple,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.purpleAccent),
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Colors.purple),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  //useMaterial3: true,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.purple,
    unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.purple,
  scaffoldBackgroundColor: HexColor('333739'),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.grey),
  appBarTheme: AppBarTheme(
    backgroundColor: HexColor('333739'),
    elevation: 20,
    titleTextStyle: const TextStyle(
        color: Colors.white, fontSize: 0.0, fontWeight: FontWeight.bold),
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarBrightness: Brightness.light,

      // statusBarIconBrightness: Brightness.dark
    ),
  ),
  //useMaterial3: true,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.purple,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333736'),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);
