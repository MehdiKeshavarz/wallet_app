import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/core/styles.dart';
import 'package:flutter_wallet_app/on-boarding/on_boarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wallet App',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.darkTheme,
        themeMode: ThemeMode.dark,
        home: const OnBoardingPage());
  }
}
