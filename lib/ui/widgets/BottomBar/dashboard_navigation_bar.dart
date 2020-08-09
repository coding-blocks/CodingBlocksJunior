import 'package:auto_route/auto_route.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Dashboard/bottom_bar_nav_icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'label_text.dart';

class DashboardNavigationBar extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel model) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12)
        ),
        boxShadow: [                                                               
          BoxShadow(
            color: Colors.black38, 
            spreadRadius: 0, 
            blurRadius: 2
          ),
        ], 
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(                                           
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ), 
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: model.selectedIndex,
          onTap: (int index) {
            print(ExtendedNavigator.of(context).routerName);
            ExtendedNavigator.of(context).replace(Routes.dashboardView + model.dashboardView[index]);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: BottomBarNavIcon('assets/bookmark-white.png'),
              activeIcon: BottomBarNavIcon('assets/bookmark-blue.png'),
              title: NavLabelText('Bookmarks')
            ),
            BottomNavigationBarItem(
              icon: BottomBarNavIcon('assets/home-white.png'),
              activeIcon: BottomBarNavIcon('assets/home-blue.png'),
              title: NavLabelText('Home')
            ),
            BottomNavigationBarItem(
              icon: BottomBarNavIcon('assets/notes-white.png'),
              activeIcon: BottomBarNavIcon('assets/notes-blue.png'),
              title: NavLabelText('Notes')
            ),
            BottomNavigationBarItem(
              icon: BottomBarNavIcon('assets/profile-white.png'),
              activeIcon: BottomBarNavIcon('assets/profile-blue.png'),
              title: NavLabelText('Profile')
            ),
          ],
        ),
      )
    );
  }
}
