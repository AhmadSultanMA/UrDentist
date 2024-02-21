import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:urdentist/presentation/homepage/recapController.dart';
import 'package:urdentist/route/routes.dart';

class RecapDetail extends StatefulWidget {
  @override
  _RecapDetailState createState() => _RecapDetailState();
}

class _RecapDetailState extends State<RecapDetail> {
  RecapController recapController = Get.find<RecapController>();

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
          title: Obx(() {
            return Text(
              recapController.detailRecap.value.periode,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            );
          }),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).go(Routes.HABIT_SCREEN);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/recap.png',
                width: width * 0.6,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Master',
                style: TextStyle(
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800),
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "You're a true master of oral health. Your commitment to good oral hygiene is inspiring.",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade50.withOpacity(0.4),
                    ),
                    margin: EdgeInsets.only(right: width * 0.03),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/target.png',
                            width: width * 0.2,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Obx(() {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(
                              recapController.detailRecap.value.dayCompleted
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05),
                            ),
                          );
                        }),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "The day you completed the mission",
                            style: TextStyle(
                                fontSize: width * 0.032,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown.shade700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade50.withOpacity(0.4),
                    ),
                    margin: EdgeInsets.only(left: width * 0.03),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/icon_trophy.png',
                            width: width * 0.2,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Obx(() {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(
                              '${recapController.data.value.data.first.completedTasks * 2}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05),
                            ),
                          );
                        }),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "The point you have earned",
                            style: TextStyle(
                                fontSize: width * 0.032,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown.shade700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Transform your smile with a dental scaling experience!',
                style: TextStyle(
                    fontSize: width * 0.045, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            GestureDetector(
                onTap: () {
                  GoRouter.of(context).go(Routes.CONSULTATION_SCREEN);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade600),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Make a Scaling Appointment',
                        style: TextStyle(
                            fontSize: width * 0.052,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade600),
                      ),
                      Icon(Icons.add, color: Colors.blue.shade600),
                    ],
                  ),
                ))
          ]),
        )));
  }
}
