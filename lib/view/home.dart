import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/controllers/home_controller.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../widgets/timeline_widget.dart';

/// The hove page which hosts the calendar
class HomeView extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (ctrl) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 1,
                        color: Color(0xFFDDDDDD),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Schedule',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ctrl.currentDate = DateTime.now();
                          ctrl.update();
                        },
                        child: Container(
                          height: 30,
                          width: 62,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: CustomColors.primary,
                          ),
                          child: const Center(
                            child: Text(
                              'Today',
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Month',
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: MediaQuery.of(context).size.height * .33,
                        child: SfCalendar(
                          view: CalendarView.month,
                          dataSource: ctrl.getCalendarData(),
                          showNavigationArrow: true,
                          headerStyle: const CalendarHeaderStyle(
                            textAlign: TextAlign.center,
                            textStyle: TextStyle(
                              color: CustomColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onSelectionChanged: (CalendarSelectionDetails details) {
                            ctrl.currentDate = details.date!;
                            ctrl.update();
                          },
                          showCurrentTimeIndicator: false,
                          cellBorderColor: Colors.white,
                          monthViewSettings: const MonthViewSettings(
                            showAgenda: false,
                            appointmentDisplayCount: 0,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 5, bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TimelineWidget(
                          key: ValueKey(ctrl.currentDate),
                          currentDate: ctrl.currentDate,
                          dataSource: ctrl.getCalendarData(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
