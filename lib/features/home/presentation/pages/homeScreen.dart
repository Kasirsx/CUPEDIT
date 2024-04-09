import 'package:cupcat/features/home/presentation/pages/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../Inbox/presentation/pages/inbox.dart';
import '../../../profile/presentation/pages/Profile.dart';

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
        showUnselectedLabels: true,
        // Display unselected labels
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.grey,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 24,
              width: 24,
              padding: EdgeInsets.all(3),
              child: CustomImage.rectangle(
                color: _currentIndex == 0 ? AppColors.black : AppColors.grey,
                image: AppAssets.cutIcon,
                isNetworkImage: false,
                svg: true,
              ),
            ),
            label: 'edit'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'templates'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'inbox'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'me'.tr(),
          ),
        ],
      ),
    );
  }
}


