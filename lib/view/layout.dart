import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/routes/route_name.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/view/feed.dart';
import 'package:oak_haven_massage_app/view/home.dart';
import 'package:oak_haven_massage_app/view/profile.dart';
import 'package:oak_haven_massage_app/widgets/dashed_divider.dart';

import '../controllers/layout_controller.dart';
import '../utils/app_assets.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      init: LayoutController(),
      builder: (ctrl) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            body: Stack(
              children: [
                LazyIndexedStack(
                  index: ctrl.currentPageIndex,
                  children: const [
                    HomeView(),
                    FeedView(),
                    ProfileView(),
                  ],
                ),

                //Show Menu on Toggle More Button
                if (ctrl.isMenuOpen)
                  ModalBarrier(
                    dismissible: true,
                    color: Colors.black.withOpacity(0.5),
                    onDismiss: (){
                      ctrl.isMenuOpen = false;
                      ctrl.update();
                    },
                  ),
                if (ctrl.isMenuOpen)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(left: 80),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                        color: CustomColors.link, // Semi-transparent background
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: const Text(
                              'Feedback',
                              style: TextStyle(
                                color: CustomColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                            onTap: () {
                              // Handle settings action
                              Get.toNamed(RouteNames.feedback);
                            },
                          ),
                          const DashedDivider(color: CustomColors.white),
                          ListTile(
                            title: const Text(
                              'Maintenance/Equipment Request',
                              style: TextStyle(
                                color: CustomColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                            onTap: () {
                              // Handle help action
                            },
                          ),
                          const DashedDivider(color: CustomColors.white),
                          ListTile(
                            title: const Text(
                              'PTO Request',
                              style: TextStyle(
                                color: CustomColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                            onTap: () {
                              // Handle logout action
                            },
                          ),
                          const DashedDivider(color: CustomColors.white),
                          ListTile(
                            title: const Text(
                              'Loan/Payroll Advance Request',
                              style: TextStyle(
                                color: CustomColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                            onTap: () {
                              // Handle logout action
                            },
                          ),
                          const DashedDivider(color: CustomColors.white),
                          ListTile(
                            title: const Text(
                              'Payroll & Benefits Questions',
                              style: TextStyle(
                                color: CustomColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                            onTap: () {
                              // Handle logout action
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
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
      },
    );
  }

  Widget navBarItem(String image, String label, int index, LayoutController ctrl, context) {
    Color color = ctrl.currentPageIndex == index ? CustomColors.primary : CustomColors.border;
    return GestureDetector(
      onTap: () {
        // Only update if the index is within valid bounds
        if (index >= 0 && index <= 2) {
          ctrl.updatePageIndex(index);
        } else {
          ctrl.isMenuOpen = !ctrl.isMenuOpen;
          ctrl.update();
        }
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
}
