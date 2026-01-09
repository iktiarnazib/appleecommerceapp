import 'package:flutter/material.dart';
import 'package:ncommerce/pages/about_page.dart';
import 'package:ncommerce/widget_tree.dart';
import 'package:ncommerce/pages/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //declaration of shared preference
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  //store
  final bool shown = prefs.getBool('shown') ?? false;

  runApp(MyApp(shown: shown));
}

class MyApp extends StatelessWidget {
  final bool shown;
  const MyApp({super.key, required this.shown});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) {
          return const WidgetTree();
        },
        'aboutpage': (context) {
          return const AboutPage();
        },
        'intropage': (context) {
          return const IntroPage();
        },
      },
      home: shown ? WidgetTree() : IntroPage(),
    );
  }
}
