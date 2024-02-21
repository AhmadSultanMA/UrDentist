import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdentist/route/routes.dart';
import 'package:go_router/go_router.dart';

class BookSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade200, Colors.blue.shade700],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/book_success.svg"),
                Container(
                  margin: EdgeInsets.only(top: height * 0.03),
                  alignment: Alignment.center,
                  child: Text(
                    'Payment Successful',
                    style: TextStyle(
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.015),
                  alignment: Alignment.center,
                  child: const Text(
                    'Congratulations, you have successfully made payment for this consultation session',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go(Routes.HOMEPAGE_SCREEN);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: height * 0.04),
                    padding: EdgeInsets.all(height * 0.02),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03)),
                    ),
                    child: Text(
                      'Return to Homepage',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
