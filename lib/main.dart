import 'package:flutter/material.dart';
import 'package:urdentist/presentation/article/article.dart';
import 'package:urdentist/presentation/consultation/screen/booking.dart';
import 'package:urdentist/presentation/healthTracker/screen/health_tracker.dart';
import 'package:urdentist/route/app_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

SharedPreferences? prefs = null;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: invalid_use_of_visible_for_testing_member
    FlutterSecureStorage.setMockInitialValues({});
    initSharedPref();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HealthTracker()
        // home: const SafeArea(
        //     child: Scaffold(
        //   body: AppRouter(),
        // )),
        );
  }
}

Future<void> initSharedPref() async {
  prefs = await SharedPreferences.getInstance();
}
