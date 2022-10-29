import 'package:flutter/material.dart';
import 'package:wms_project/pages/default_page.dart';
import 'package:wms_project/pages/map_page.dart';
import 'package:wms_project/pages/profile_page.dart';
import 'package:wms_project/pages/report_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> bottomNavigationPages = const [
    DefaultPage(),
    ReportPage(),
    ProfilePage(),
  ];

  int appIndex = 0;

  void onTapEvent(int index) {
    setState(() {
      appIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: appIndex,
        children: bottomNavigationPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapEvent,
        currentIndex: appIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black12.withOpacity(0.5),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: "Report",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
