import 'package:flutter/material.dart';
import 'package:personal_expense_tracker_app/datas/expanse_datas.dart';
import 'package:personal_expense_tracker_app/pages/home_page.dart';
import 'package:personal_expense_tracker_app/pages/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ExpanseDatasProvider(),
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: Provider.of<ThemeProvider>(context).themeData,
      // home: const IntroPage(),
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => LoginPage(),
        // '/intro_page': (context) => const IntroPage(),
        '/home_page': (context) => const HomePage(),
        // '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
