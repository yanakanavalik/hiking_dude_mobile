// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import '../../common/assets.dart';
import '../../common/colors.dart';
import '../../common/text_styles.dart';
import '../home/home_page.dart';

enum AppTabs { home, explore, myTrips }

Map<AppTabs, int> tabToIndex = {
  AppTabs.home: 0,
  AppTabs.explore: 1,
  AppTabs.myTrips: 2,
};

Map<int, AppTabs> indexToTab = {
  0: AppTabs.home,
  1: AppTabs.explore,
  2: AppTabs.myTrips,
};

class MainTabs extends StatefulWidget {
  MainTabs();

  @override
  MainTabsState createState() => MainTabsState();
}

class MainTabsState extends State<MainTabs> {
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildTabs(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget buildTabs() {
    switch (_currentTabIndex) {
      case 0:
        return Home();
      case 1:
      case 2:
      default:
        return SizedBox();
    }
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentTabIndex,
      onTap: _handleChangeTab,
      iconSize: 40.0,
      items: _buildBottomNavigationItems(),
      selectedLabelStyle: paragraphTS(weight: FontWeight.w600),
      unselectedLabelStyle: paragraphTS(weight: FontWeight.w600),
      selectedItemColor: AppColors.pink,
      unselectedItemColor: AppColors.darkGray,
    );
  }

  void _handleChangeTab(int newIndex) {
    setState(() => _currentTabIndex = newIndex);
  }

  List<BottomNavigationBarItem> _buildBottomNavigationItems() {
    return indexToTab.values
        .map((e) => _buildBottomNavigationBarItem(e))
        .toList();
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(AppTabs tab) {
    String imageAsset;
    String label;

    switch (tab) {
      case AppTabs.home:
        imageAsset = ImageAssets.travelBag;
        label = 'Home';
        break;
      case AppTabs.explore:
        imageAsset = ImageAssets.camp;
        label = 'Explore';
        break;
      case AppTabs.myTrips:
        imageAsset = ImageAssets.traveller;
        label = 'My trips';
        break;
      default:
        break;
    }

    return BottomNavigationBarItem(
        icon: Image.asset(imageAsset, width: 40), label: label);
  }
}
