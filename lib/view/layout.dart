import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/view/feed.dart';
import 'package:oak_haven_massage_app/view/home.dart';
import 'package:oak_haven_massage_app/view/profile.dart';

import '../controllers/layout_controller.dart';
import '../utils/app_assets.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  _LayoutViewState createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final bool _isMenuOpen = true; // Track the state of the menu

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        init: LayoutController(),
        builder: (ctrl) {
          return PopScope(
            canPop: false,
            child: Scaffold(
              body: LazyIndexedStack(
                index: ctrl.currentPageIndex,
                children: [
                  const HomeView(),
                  const FeedView(),
                  const ProfileView(),
                  moreMenu(context),
                ],
              ),
              bottomNavigationBar: BottomAppBar(
                clipBehavior: Clip.antiAlias,
                elevation: 100,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 65,
                shape: const CircularNotchedRectangle(),
                notchMargin: 12,
                color: CustomColors.background,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    navBarItem(AppAssets.calendar, "Schedule", 0, ctrl, context),
                    navBarItem(AppAssets.message, "Feed", 1, ctrl, context),
                    navBarItem(AppAssets.profile, "Profile", 2, ctrl, context),
                    navBarItem(AppAssets.moreSquare, "More", 3, ctrl, context),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget navBarItem(String image, String label, int index, LayoutController ctrl, context) {
    Color color = ctrl.currentPageIndex == index ? CustomColors.primary : CustomColors.border;
    return GestureDetector(
      onTap: () => {
        ctrl.updatePageIndex(index, context),
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            image,
            color: color,
          ).paddingOnly(bottom: 5),
          Text(
            label,
            style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget moreMenu(context) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: AnimatedOpacity(
        opacity: _isMenuOpen ? 1.0 : 0.0, // Control opacity based on menu state
        duration: const Duration(milliseconds: 300),
        child: AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: _isMenuOpen ? 10 : -150, // Adjust position to make it appear/disappear
          right: 10,
          child: Container(
            width: 120, // Menu width
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), // Transparent black background
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Menu items
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: const Text('Settings', style: TextStyle(color: Colors.black)),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.help, color: Colors.white),
                  title: const Text('Help', style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text('Logout', style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
