import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/home_page.dart';
import 'package:adcondo_app/features/notices/view/notices_page.dart';
import 'package:adcondo_app/features/notifications/view/notification_view.dart';
import 'package:adcondo_app/features/voting/view/list_voting_page.dart';
import 'package:flutter/material.dart';

class NavBarComponent extends StatefulWidget {
  const NavBarComponent({super.key});

  @override
  State<NavBarComponent> createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const NoticesPage(),
    const ListVotingPage(),
    const NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        animationDuration: const Duration(seconds: 1),
        height: 70,
        indicatorColor: AppColors.accentColor,
        elevation: 5,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: AppColors.textColorPrimaryBlue,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: AppColors.textColorPrimaryBlue,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.newspaper_outlined,
              color: AppColors.textColorPrimaryBlue,
            ),
            icon: Icon(
              Icons.newspaper_rounded,
              color: AppColors.textColorPrimaryBlue,
            ),
            label: 'Mural de avisos',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.how_to_vote,
              color: AppColors.textColorPrimaryBlue,
            ),
            icon: Icon(
              Icons.how_to_vote_outlined,
              color: AppColors.textColorPrimaryBlue,
            ),
            label: 'Votação',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.notifications,
              color: AppColors.textColorPrimaryBlue,
            ),
            icon: Icon(
              Icons.notifications_outlined,
              color: AppColors.textColorPrimaryBlue,
            ),
            label: 'Notificação',
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
