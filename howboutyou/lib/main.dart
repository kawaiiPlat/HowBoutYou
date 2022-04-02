import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Test Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  //Function(String) callback;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}





class _MyHomePageState extends State<MyHomePage> {
  //Selects the given date programmatically in the SfCalendar by checking that the date falls in between the minimum and maximum date range
  CalendarController _calendarController = CalendarController(); 

  @override
  initState() {
    _calendarController.displayDate = DateTime(2021, 12, 08);
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
          view: CalendarView.week,
          //callback
           onViewChanged: (ViewChangedDetails details) {
            List<DateTime> dates = details.visibleDates;
          },
           controller: _calendarController,
           //calender date picker
           showDatePickerButton: true,
           //drag and drop
            allowDragAndDrop: true,
            onDragStart: dragStart,
            onDragUpdate: dragUpdate,
            dragAndDropSettings: DragAndDropSettings(showTimeIndicator: true),
           //schedule view setting 
           scheduleViewSettings: ScheduleViewSettings(
            dayHeaderSettings: DayHeaderSettings(
                dayFormat: 'EEEE',
                width: 70,
                dayTextStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.red,
                ),
                dateTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.red,
                ))),
                //allow to change from day, week month
           allowedViews: <CalendarView>[
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
              CalendarView.schedule
            ],
            
            monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
            //the minimal day that we can go back to
           minDate: DateTime(2021, 12, 31, 0 , 0, 0),

           //appointment text style
            appointmentTextStyle: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 6, 9, 185),
              letterSpacing: 1,
              fontWeight: FontWeight.bold),

          //data source
          dataSource: _getDataSource(), 
          
         
        )
        );
    }        
}


_AppointmentDataSource _getDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source){
   appointments = source; 
  }
}

class Meeting {
  Meeting(
      {this.eventName = '',
      required this.from,
      required this.to,
      required this.background,
      this.isAllDay = false,
      this.recurrenceRule,
      this.exceptionDates});

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String? recurrenceRule;
  List<DateTime>? exceptionDates;
}



void dragStart(AppointmentDragStartDetails appointmentDragStartDetails) {
  dynamic appointment = appointmentDragStartDetails.appointment;
  CalendarResource? resource = appointmentDragStartDetails.resource;
}

void dragUpdate(AppointmentDragUpdateDetails appointmentDragUpdateDetails) {
  dynamic appointment = appointmentDragUpdateDetails.appointment;
  DateTime? draggingTime = appointmentDragUpdateDetails.draggingTime;
  Offset? draggingOffset = appointmentDragUpdateDetails.draggingPosition;
  CalendarResource? sourceResource = appointmentDragUpdateDetails.sourceResource;
  CalendarResource? targetResource = appointmentDragUpdateDetails.targetResource;
}