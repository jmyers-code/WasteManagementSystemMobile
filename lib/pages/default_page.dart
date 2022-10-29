import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:wms_project/services/api_service.dart';

import '../models/get_collection_data.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  late Future<GetCollectionResponseData> collectionData;

  @override
  void initState() {
    super.initState();
    collectionData = ApiService.getCollectionData();
    print(collectionData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendar")),
      body: SafeArea(
        child: SfCalendar(
          view: CalendarView.month,
          dataSource: _getCalendarDataSource(),
          monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        backgroundColor: HexColor("#283B71"),
        onPressed: () {
          setState(() {});
          Navigator.pushNamed(context, '/request_form');
        },
        // isExtended: true,
        child: const Icon(Icons.add),
      ),
    );
  }

  AppointmentDataSource _getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(minutes: 10)),
      subject: 'Collection Day',
      color: Colors.green,
      startTimeZone: '',
      endTimeZone: '',
      recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,WED,FRI;UNTIL=20201225',
    ));

    return AppointmentDataSource(appointments);
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
