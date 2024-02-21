import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';
import 'package:urdentist/route/routes.dart';

class DetailDentist extends StatefulWidget {
  @override
  _DetailDentistState createState() => _DetailDentistState();
}

class _DetailDentistState extends State<DetailDentist> {
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
          title: const Text(
            'Dentist',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).go(Routes.CONSULTATION_SCREEN);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset(
              'assets/images/detailDentist.png',
              width: width,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Dr Luna Claw',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.058),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Text(
                              'Paediatric',
                              style: TextStyle(
                                  fontSize: width * 0.03,
                                  color: Colors.blue.shade600,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: width * 0.055,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            '4.9 (100 Review)',
                            style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'About Me',
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'I am a dentist at Saiful Anwar Hospital in Malang, Indonesia. I have been working here for three years, and I have treated hundreds of patients. I am passionate about dentistry, and I believe that everyone deserves to have healthy, beautiful teeth.',
                          style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Online Consultation Schedule',
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/icon_calendar.svg'),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Wednesday'),
                                  Text('09.00 - 15.00')
                                ],
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Friday'),
                                  Text('09.00 - 15.00')
                                ],
                              )
                            ],
                          ))
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Online Consultation Schedule',
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(children: [
                        SvgPicture.asset('assets/images/icon_calendar.svg'),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Text('Dr. Saiful Anwar General Hospital'),
                      ]),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/icon_calendar.svg'),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Monday'),
                                  Text('09.00 - 12.00')
                                ],
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tuesday'),
                                  Text('12.00 - 15.00')
                                ],
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Thursday'),
                                  Text('09.00 - 12.00')
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Choose The Service You Want',
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(height * 0.018),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius:
                                BorderRadius.all(Radius.circular(width * 0.03)),
                          ),
                          child: const Text(
                            'Book Online Consultation',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        onTap: () {
                          GoRouter.of(context).go(Routes.BOOKING_SCREEN);
                        },
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go(Routes.COMINGSOON_SCREEN);
                        },
                        child: Container(
                          padding: EdgeInsets.all(height * 0.018),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue.shade700),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(width * 0.03)),
                          ),
                          child: Text(
                            'Book Offline Consultation',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        )));
  }
}
