import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/bookmarks/view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/home/view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/notes/view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/profile/view.dart';
import 'package:coding_blocks_junior/ui/widgets/BottomBar/label_text.dart';
import 'package:coding_blocks_junior/ui/widgets/Dashboard/bottom_bar_nav_icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'viewmodel.dart';

class DashboardView extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease
            );
            model.onItemClick(index);
          },
          children: <Widget>[
            DashboardBookmarksView(),
            DashboardHomeView(),
            DashboardNotesView(),
            DashboardProfileView(),
          ],
        ),
        bottomNavigationBar: Container(
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
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut
                );
                model.onItemClick(index);
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
        ),
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}
