import 'package:app_name/screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screen/home_screen.dart';

bool show = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onboarding',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: show ? IntroScreen() : const HomeScreen(), // Conditional navigation
    );
  }
}