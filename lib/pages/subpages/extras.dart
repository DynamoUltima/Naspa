import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Extras extends StatefulWidget {
  const Extras({ Key? key,required this.pageTitle}) : super(key: key);

  final String pageTitle;

  @override
  _ExtrasState createState() => _ExtrasState();
}

class _ExtrasState extends State<Extras> {

  List services = ["commercial cleaninng",];


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
          widget.pageTitle,
          style: TextStyle(color: Colors.teal),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              FormBuilderDropdown(
                    name: 'car',
                    decoration: InputDecoration(
                      // labelText: 'Car',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 48)
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: Text('Select Service'),
                    // validator: FormBuilderValidators.compose(
                    //     [FormBuilderValidators.required(context)]),
                    items: services
                        .map((car) => DropdownMenuItem(
                              value: car,
                              child: Text('$car'),
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
                  SizedBox(height: 20,),
    
                  servicesButton()
            ],
          ),
          
        ),
      ),
    );
  }

  RaisedButton servicesButton() {
    return RaisedButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(25.0),
      ),
      onPressed: () async {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => Payment()));
        // if (_formkey.currentState!.validate()) {
        //   setState(() => loading = true);
        //   //NewsFeedPage()//PostProfile()
        // }
      },
      color: Colors.teal[400],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'select',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}