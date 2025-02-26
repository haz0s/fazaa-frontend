import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import '../../features/home/presentation/views/home_page.dart';
import '../utils/colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
  });
  static const String routeName = "/nav";
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  MotionTabBarController? _motionTabBarController;
  late PageController _pageController;

  @override
  void initState() {
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          //_motionTabBarController!.index = index;
        },
        children: [
          HomePage(),
          HomePage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8.0,
              spreadRadius: 2.0,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: MotionTabBar(
          controller: _motionTabBarController,
          initialSelectedTab: "الرئيسية",
          labels: ["الرئيسية", "الاشعارات", "الطلبات"],
          icons: const [
            Icons.home_outlined,
            Icons.notifications_outlined,
            Icons.list_alt_outlined,
          ],
          useSafeArea: true,
          tabIconColor: AppColors.primary,
          tabIconSize: 30.0,
          tabIconSelectedSize: 30.0,
          tabSelectedColor: AppColors.primary,
          tabIconSelectedColor: AppColors.background,
          tabBarColor: AppColors.background,
          tabSize: 50,
          tabBarHeight: 60,
          textStyle: const TextStyle(
            fontSize: 15,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
          onTabItemSelected: (index) {
            // _pageController.animateToPage(
            //   index,
            //   duration: const Duration(milliseconds: 200),
            //   curve: Curves.ease,
            // );
          },
        ),
      ),
    );
  }
}
