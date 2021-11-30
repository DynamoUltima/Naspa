import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
          "Payment",
          style: TextStyle(color: Colors.teal),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("PAYMENT"),
        ),
      ),
    );
  }
}
