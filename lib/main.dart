import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:personal_expense_tracker_app/datas/expanse_datas.dart';
import 'package:personal_expense_tracker_app/pages/expense_page.dart';
import 'package:personal_expense_tracker_app/pages/login_page.dart';
import 'package:personal_expense_tracker_app/pages/signup_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox("expense_database");
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
      debugShowCheckedModeBanner: false,
      //theme: Provider.of<ThemeProvider>(context).themeData,
      // home: const IntroPage(),
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => LoginPage(),
        // '/intro_page': (context) => const IntroPage(),
        '/home_page': (context) => const HomePage(),
        '/signup_page': (context) => SignUpPage(),
      },
    );
  }
}
