import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimelineWidget extends StatefulWidget {
  const TimelineWidget({super.key, required this.currentDate, required this.dataSource});
  final DateTime currentDate;
  final CalendarDataSource dataSource;

  @override
  State<TimelineWidget> createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  Appointment? selectedAppointment;

  @override
  void initState() {
    super.initState();
    if (widget.dataSource.appointments!.isNotEmpty) {
      selectedAppointment = widget.dataSource.appointments![0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat("d MMM").format(widget.currentDate),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: CustomColors.secondary,
          ),
        ).marginOnly(left: 20, bottom: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SfCalendar(
            view: CalendarView.day,
            dataSource: widget.dataSource,
            showNavigationArrow: false,
            initialSelectedDate: selectedAppointment?.startTime,
            showCurrentTimeIndicator: false,
            allowViewNavigation: false,
            showTodayButton: false,
            showDatePickerButton: false,
            showWeekNumber: false,
            selectionDecoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
            viewNavigationMode: ViewNavigationMode.none,
            headerHeight: 0,
            viewHeaderHeight: 0,
            onSelectionChanged: null,
            timeSlotViewSettings: const TimeSlotViewSettings(
              startHour: 9,
              endHour: 21,
              timeInterval: Duration(minutes: 30),
              timeFormat: 'h:mma',
            ),
            onTap: (CalendarTapDetails details) {
              if (details.appointments != null && details.appointments!.isNotEmpty) {
                setState(() {
                  selectedAppointment = details.appointments!.first;
                });
              }
            },
            appointmentBuilder: (context, details) {
              final Appointment appointment = details.appointments.first;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: appointment.color,
                  border: Border.all(
                    color: selectedAppointment!.startTime == appointment.startTime ? Colors.black : Colors.white,
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${DateFormat('h:mm a').format(appointment.startTime)} - ${DateFormat('h:mm a').format(appointment.endTime)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      appointment.subject,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      appointment.notes ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
