import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:urdentist/presentation/authentication/screen/register.dart';
import 'package:urdentist/presentation/chooseProfile/profile_controller.dart';
import 'package:urdentist/presentation/consultation/booking_controller.dart';
import 'package:urdentist/route/routes.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    GoRouter _goRouter;
    _goRouter = GoRouter.of(context);

    var profileController = Get.find<ProfileController>();
    var bookingController = Get.put(BookingController());

    void _showPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: height * 0.3,
              child: Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/gopay.jpg',
                      width: width * 0.15,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      'GoPay',
                      style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Rincian Pembayaran',
                    style: TextStyle(
                        fontSize: width * 0.04, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Online Consultation',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const Text(
                      'Rp. 25.000',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Services fee 5%',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const Text(
                      'Rp. 1.250',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: 1,
                  width: width * 1,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rp. 26.250',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Obx(() {
                  return bookingController.isLoading2.value
                      ? const CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () {
                            bookingController.payment(onSuccess: (msg) {
                              _goRouter.go(Routes.BOOKSUCCESS_SCREEN);

                              Navigator.of(context).pop();
                            }, onFailed: (msg) {
                              showMySnackbar(context, 'failed');
                              Navigator.of(context).pop();
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              alignment: Alignment.center,
                              child: Text(
                                'Pay',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )),
                        );
                })
              ]),
            ),
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: const Text(
            'Booking',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).go(Routes.DETAILDENTIST_SCREEN);
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
                  'Dentist Information',
                  style: TextStyle(
                      fontSize: width * 0.04, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                margin: EdgeInsets.only(bottom: height * 0.01),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade600,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1.2,
                      offset: Offset(0, 0.2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Image.asset(
                            'assets/images/drLuna2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr Luna Claw',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: height * 0.006),
                          Text(
                            'Saiful Anwar Hospital',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.03,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: width * 0.045,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                '4.9',
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Consultation Schedule',
                  style: TextStyle(
                      fontSize: width * 0.04, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select the available consultation schedule',
                  style: TextStyle(
                    fontSize: width * 0.035,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose a Day',
                  style: TextStyle(
                      fontSize: width * 0.04, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        border:
                            Border.all(color: Colors.blue.shade500, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      'Wednesday',
                      style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade500),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.blue.shade500, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      'Friday',
                      style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade500),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose the Time',
                  style: TextStyle(
                      fontSize: width * 0.04, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        border:
                            Border.all(color: Colors.blue.shade500, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      '09.00 - 15.00',
                      style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rp. 25.000',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Obx(() {
                    return bookingController.isLoading.value
                        ? CircularProgressIndicator()
                        : GestureDetector(
                            onTap: () {
                              bookingController.appoinment(
                                  profileController.profile.value.id,
                                  onSuccess: (id) {
                                bookingController.paymentId = id;
                                _showPopup();
                              }, onFailed: (err) {
                                showMySnackbar(context, err);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 48),
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade500,
                                  border: Border.all(
                                      color: Colors.blue.shade500, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                'Book',
                                style: TextStyle(
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ));
                  })
                ],
              ),
            ],
          ),
        )));
  }
}
