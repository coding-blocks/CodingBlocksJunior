import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/bookmarks/dashboard_bookmarks_view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/home/dashboard_home_view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/notes/dashboard_notes_view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/profile/dashboard_profile_view.dart';
import 'package:coding_blocks_junior/ui/widgets/BottomBar/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

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
              curve: Curves.easeOut
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
                  icon: SvgPicture.asset('assets/bookmark-blue.svg'),
                  title: NavLabelText('Bookmarks')
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/home-blue.svg'),
                  title: NavLabelText('Home')
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/notes-blue.svg'),
                  title: NavLabelText('Notes')
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/profile-blue.svg'),
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
