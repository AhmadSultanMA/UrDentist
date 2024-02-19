import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:urdentist/route/routes.dart';

class Question2 extends StatefulWidget {
  @override
  _Question2State createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Question 2',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go(Routes.HEALTHTRACKET_SCREEN);
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Look at the following picture before answering the question'),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Image.asset(
              'assets/images/question2.jpg',
              width: width * 0.9,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "If it is already. Look at the picture, is the child's teeth growing in a normal number [maximum 20 teeth at the age of 3 years]?",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: width * 0.045),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue.shade600, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                "Yes",
                style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade600),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue.shade600, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                "No",
                style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: Container(
        width: 120,
        child: FloatingActionButton(
          onPressed: () {
            // Implement your submit functionality here
          },
          backgroundColor: Colors.blue.shade600,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
