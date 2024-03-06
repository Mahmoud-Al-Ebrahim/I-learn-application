import 'package:flutter/material.dart';
import 'package:graduation_project/Helper/font_style.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../Helper/app_color.dart';
import '../pages/project_details.dart';

class MyCalendar extends StatefulWidget {
  final int newCurrentActive;

  MyCalendar({required this.newCurrentActive, Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  final CalendarController _controller = CalendarController();

  void changeView() {
    if (widget.newCurrentActive == 0) {
      _controller.view = CalendarView.week;
    } else if (widget.newCurrentActive == 1) {
      _controller.view = CalendarView.month;
    } else if (widget.newCurrentActive == 2) {
      _controller.view = CalendarView.day;
    } else {
      _controller.view = CalendarView.week;
    }
  }

  @override
  Widget build(BuildContext context) {
    changeView();
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: SfCalendar(
          controller: _controller,
          showCurrentTimeIndicator: false,
          todayHighlightColor: AppColors.primaryColor[50]!,
          headerStyle:  CalendarHeaderStyle(
              textAlign: TextAlign.center,
              backgroundColor: AppColors.primaryColor[50]!,
              textStyle: const  TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 5,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
               allowViewNavigation: false,
          viewNavigationMode: ViewNavigationMode.snap,
          cellBorderColor: Colors.transparent,
          selectionDecoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColors.primaryColor[50]!, width: 2),
            shape: BoxShape.rectangle,
          ),cellEndPadding: 0,
          appointmentBuilder: appointmentBuilder,
          dataSource: _getCalendarDataSource(),
          timeSlotViewSettings:  TimeSlotViewSettings(
              timeInterval: const Duration(hours: 1),
              startHour: 0,
              numberOfDaysInView: _controller.view==CalendarView.day?0:2,
              endHour: 24,
              timeIntervalHeight: 100,),
          backgroundColor: AppColors.scaffoldBackGroundColor,
          view: CalendarView.week),
    );
  }
}
Widget appointmentBuilder(BuildContext context,
    CalendarAppointmentDetails calendarAppointmentDetails) {
  final Appointment appointment =
      calendarAppointmentDetails.appointments.first;
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=> const ProjectDetails()));
    },
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: appointment.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.group,
            color: AppColors.scaffoldBackGroundColor,
          ),
          Text(
            appointment.subject,
            style: MyFontStyle.bookStyle(20, AppColors.scaffoldBackGroundColor)
          ),
        ],
      ),
    ),
  );
}
// _AppointmentDataSource _getCalendarDataSource() {
//   List<Appointment> appointments = <Appointment>[];
//   appointments.add(Appointment(
//
//     startTime: DateTime.now().subtract(Duration(minutes: DateTime.now().minute)).add(Duration(hours: 8)),
//     endTime: DateTime.now().subtract(Duration(minutes: DateTime.now().minute)).add(Duration(hours: 8)).add(Duration(hours: 1)),
//     subject: 'Meeting',
//     color: Colors.pink,
//   ));
//
//   return _AppointmentDataSource(appointments);
// }

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }

}
  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now().subtract(Duration(minutes: DateTime.now().minute , hours:-10 )),
      endTime:  DateTime.now().subtract(Duration(minutes: DateTime.now().minute , hours:-11 )),
      subject: 'Meeting',
      color: AppColors.primaryColor[50]!,
    ));

    appointments.add(Appointment(
      startTime: DateTime.now().subtract(Duration(minutes: DateTime.now().minute , hours:-9,days: -1 )),
      endTime: DateTime.now().subtract(Duration(minutes: DateTime.now().minute , hours:-10 ,days: -1)),
      subject: 'Planning',
      color: Colors.deepOrangeAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -9)),
      endTime: DateTime.now().add(Duration(days: -9)),
      subject: 'Consulting',
      color: Colors.pink,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -9, hours: 1)),
      endTime: DateTime.now().add(Duration(days: -9, hours: 1)),
      subject: 'Holiday support',
      color: Colors.pink,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -15)),
      endTime: DateTime.now().add(Duration(days: -15)),
      subject: 'Retrospective',
      color: Colors.purpleAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 5)),
      endTime: DateTime.now().add(Duration(days: 5)),
      subject: 'Sprint Plan',
      color: Colors.lightGreenAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 9)),
      endTime: DateTime.now().add(Duration(days: 9)),
      subject: 'Weekly Report',
      color: Colors.lime,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 3)),
      endTime: DateTime.now().add(Duration(days: 3)),
      subject: 'Meeting',
      color: Colors.cyan,
    ));

    return _AppointmentDataSource(appointments);
  }
// class _AppointmentDataSource extends CalendarDataSource {
//   _AppointmentDataSource(List<Appointment> source) {
//     appointments = source;
//   }
