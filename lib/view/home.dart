import 'package:flutter/material.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The hove page which hosts the calendar
class HomeView extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Schedule',
              style: TextStyle(fontSize: 18),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CustomColors.primary,

              ),
              child: const Center(
                child: Text(
                  'Today',
                  style: TextStyle(fontSize: 14,color: Colors.white),
                ),
              ),
            ),
            const Text(
              'Week',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      body: SfCalendar(
        showCurrentTimeIndicator: true,
          view: CalendarView.month, // Set to month view
          cellBorderColor: Colors.white,
          dataSource: _getCalendarData(),
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            dayFormat: 'EEE',
            showTrailingAndLeadingDates: false,
            appointmentDisplayMode: MonthAppointmentDisplayMode.none,
          )),
    );
  }

  // Correctly creating the data source
  CalendarDataSource _getCalendarData() {
    List<Appointment> appointments = <Appointment>[];

    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(const Duration(days: 1));

    appointments.add(Appointment(
      startTime: today,
      endTime: today.add(const Duration(hours: 2)),
      subject: 'Sample Event',
      color: Colors.blue,
    ));

    appointments.add(Appointment(
      startTime: tomorrow,
      endTime: tomorrow.add(const Duration(hours: 1)),
      subject: 'Another Event',
      color: Colors.green,
    ));

    return AppointmentDataSource(appointments);
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
