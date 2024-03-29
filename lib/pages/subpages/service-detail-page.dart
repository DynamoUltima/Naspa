// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:naspa/pages/subpages/payment.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class ServiceDetailPage extends StatefulWidget {
  const ServiceDetailPage({Key? key, required this.pageTitle})
      : super(key: key);
  final String pageTitle;

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    List cars = ["BMW", "Toyota", "Mercedes"];
    List serviceType = [
      "deluxe(full package with interior and exterior engine)",
      "standard(interior & exterior detailing)"
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.teal),
        elevation: 10,
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        title: Text(
          widget.pageTitle,
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
                FormBuilderDropdown(
                  name: 'car',
                  decoration: InputDecoration(
                      // labelText: 'Car',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 48),
                      prefixIcon: Icon(Icons.car_rental)),
                  // initialValue: 'Male',
                  allowClear: true,
                  hint: Text('Select Car'),
                  // validator: FormBuilderValidators.compose(
                  //     [FormBuilderValidators.required(context)]),
                  items: cars
                      .map((car) => DropdownMenuItem(
                            value: car,
                            child: Text('$car'),
                          ))
                      .toList(),
                ),
                Divider(),
                FormBuilderDropdown(
                  name: 'service type',
                  //menuMaxHeight: 100,
                  decoration: InputDecoration(
                    // labelText: 'Car',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 48),
                    prefixIcon: Icon(Icons.account_balance_wallet),
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  hint: Text('Select Service Type'),
                  // validator: FormBuilderValidators.compose(
                  //     [FormBuilderValidators.required(context)]),
                  items: serviceType
                      .map((service) => DropdownMenuItem(
                            value: service,
                            child: Text('$service'),
                          ))
                      .toList(),
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
                  
                  name: 'time',
                  initialDate: DateTime.now(),
                  fieldHintText: 'Add Time',
                  inputType: InputType.time,
                  //format: DateFormat('EEEE, dd MMMM, yyyy'),
                  decoration: InputDecoration(
                    hintText: 'Time',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.timer),
                  ),
                ),
                Divider(),
                bookAppointmentButton(),
                SizedBox(
                  height: 15,
                )
              ],
            ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Colors.teal,
      //   child: Icon(Icons.add),
      // ),
    );
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

  RaisedButton bookAppointmentButton() {
    return RaisedButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(25.0),
      ),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Payment()));
        // if (_formkey.currentState!.validate()) {
        //   setState(() => loading = true);
        //   //NewsFeedPage()//PostProfile()
        // }
      },
      color: Colors.teal[400],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Book Apppointment',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
