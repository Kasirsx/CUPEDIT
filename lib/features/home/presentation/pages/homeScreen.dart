import 'package:cupcat/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import 'Profile.dart';
import 'inbox.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),

    Profile(),
    Inbox(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true, // Display unselected labels
backgroundColor: AppColors.white,
        selectedItemColor: Colors.black, // Set active icon color to black
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Templates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Inbox',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}

