import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:urdentist/presentation/carierDetector/carier_controller.dart';
import 'package:urdentist/route/routes.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  CarierController carierController = Get.find<CarierController>();

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
            'Results',
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
                  children: [
                    Obx(() {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(width *
                              0.25), // Setengah dari lebar Container untuk membuatnya lingkaran
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          carierController.persen.value,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      'Caries',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width * 0.04),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recommendations',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Obx(() {
                      return Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          carierController.texts.value,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    })
                  ],
                ))));
  }
}
