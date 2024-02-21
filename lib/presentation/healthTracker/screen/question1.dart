import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:urdentist/route/routes.dart';

class Question1 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  String jawab = "";
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
          'Question 1',
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
              'assets/images/question1.jpg',
              width: width * 0.9,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Have the milk teeth grown?',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: width * 0.045),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  jawab = "yes";
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: jawab == "yes" ? Colors.blue.shade600 : Colors.white,
                    border: Border.all(color: Colors.blue.shade600, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  "Already",
                  style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color:
                          jawab == "yes" ? Colors.white : Colors.blue.shade600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  jawab = "no";
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: jawab == "no" ? Colors.blue.shade600 : Colors.white,
                    border: Border.all(color: Colors.blue.shade600, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  "Not yet",
                  style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color:
                          jawab == "no" ? Colors.white : Colors.blue.shade600),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      )),
      floatingActionButton: Container(
        width: 120,
        child: FloatingActionButton(
          onPressed: () {
            jawab != "" ? GoRouter.of(context).go(Routes.QUESTION2_SCREEN) : "";
          },
          backgroundColor: jawab != "" ? Colors.blue.shade600 : Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Next',
              style: TextStyle(
                  color: jawab != "" ? Colors.white : Colors.grey.shade600,
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
