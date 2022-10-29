// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:wms_project/pages/default_page.dart';
import 'package:wms_project/pages/profile_page.dart';
import 'package:wms_project/pages/report_page.dart';
import 'package:wms_project/pages/request_form.dart';
import 'package:wms_project/services/shared_service.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedService.isLoggedIn();

  if (_result) {
    _defaultHome = const HomePage();
  }

  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const DefaultPage(),
      routes: {
        '/': (context) => _defaultHome,
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/report': (context) => const ReportPage(),
        '/profile': (context) => const ProfilePage(),
        '/default_page': (context) => const DefaultPage(),
        '/register': (context) => const RegisterPage(),
        '/request_form': (context) => const RequestForm()
      },
    );
  }
}
