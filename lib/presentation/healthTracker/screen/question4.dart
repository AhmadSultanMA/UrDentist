import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:urdentist/route/routes.dart';

class Question4 extends StatefulWidget {
  @override
  _Question4State createState() => _Question4State();
}

class _Question4State extends State<Question4> {
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
          'Question 4',
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
                "Add Complaints",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: width * 0.045),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  hintText:
                      'please inform us of any other symptoms you may be experiencing...',
                  hintMaxLines: 2,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
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
              'Submit',
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
