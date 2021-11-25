// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class ServiceDetailPage extends StatefulWidget {
  const ServiceDetailPage({Key? key}) : super(key: key);

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  //CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.teal),
          elevation: 10,
          backgroundColor: Colors.white,
          // ignore: prefer_const_constructors
          title: Text(
            "Car Wash",
            style: TextStyle(color: Colors.teal),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              calendarWidget(),
              FormBuilder(
                  child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'notes',
                    // autofillHints: ['Add short notes'],
                    decoration: InputDecoration(
                      hintText: 'Add Title',
                      contentPadding: EdgeInsets.only(left: 48),
                      border: InputBorder.none,
                    ),
                  ),
                  Divider(),
                  FormBuilderTextField(
                    name: 'notes',
                    maxLines: 5,
                    minLines: 1,
                    // autofillHints: ['Add short notes'],
                    decoration: InputDecoration(
                      hintText: 'Add short notes',
                      // contentPadding: EdgeInsets.only(left: 48),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.short_text),
                    ),
                  ),
                  Divider(),
                  FormBuilderDateTimePicker(
                    name: 'date',
                    initialDate: DateTime.now(),
                    fieldHintText: 'Add Date',
                    inputType: InputType.date,
                    format: DateFormat('EEEE, dd MMMM, yyyy'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.calendar_today_sharp),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.teal,
          child: Icon(Icons.add),
        ));
  }

  Widget calendarWidget() {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(8.0),
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        headerStyle: HeaderStyle(
            decoration: BoxDecoration(color: Colors.teal[300]),
            headerMargin: EdgeInsets.all(8.0),
            titleTextStyle: TextStyle(color: Colors.white),
            formatButtonDecoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8)),
            formatButtonTextStyle: TextStyle(color: Colors.white),
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: Colors.white,
            )),
      ),
    );
  }
}
