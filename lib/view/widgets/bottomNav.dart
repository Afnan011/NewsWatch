import 'package:flutter/material.dart';

import '../home.dart';
import '../selectCategoryScreen.dart';
import '../sourceSreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int myIndex = 0;

  List<Widget> screensList = [
    HomeScreen(),
    SourceScreen(),
    SelectCategoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: myIndex,
        children: screensList,
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: Colors.blue[50],
        onTap: (index) {
          setState(() {
            myIndex = index;
            // Navigator.push(context, MaterialPageRoute(builder: (context) => screensList[myIndex] ));
          });
        },

        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              tooltip: "Home"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.source),
            label: "Sources",
            tooltip: "Sources",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
            tooltip: "Categories",
          ),
        ],

      ),
    );
  }
}
