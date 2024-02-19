import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:urdentist/presentation/chooseProfile/profile_controller.dart';
import 'package:urdentist/route/routes.dart';

class HealthTracker extends StatefulWidget {
  @override
  _HealthTrackerState createState() => _HealthTrackerState();
}

class _HealthTrackerState extends State<HealthTracker> {
  var profileController = Get.find<ProfileController>();

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
            'Health Tracker',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).go(Routes.HOMEPAGE_SCREEN);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hai, ${profileController.profile.value.namaLengkap}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: width * 0.05),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.004,
                  horizontal: width * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  '${profileController.tahun} and ${profileController.bulan}',
                  style: TextStyle(
                    fontSize: width * 0.03,
                  ),
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
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Caries Detector Result",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.045),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.blue.shade600,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "See",
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Health Track Recap",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.045),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.blue.shade600,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "See",
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
            ],
          ),
        )));
  }
}
