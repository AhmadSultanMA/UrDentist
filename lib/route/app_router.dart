import 'package:flutter/material.dart';
import 'package:urdentist/presentation/account/account.dart';
import 'package:urdentist/presentation/article/article.dart';
import 'package:urdentist/presentation/carierDetector/carier_detector.dart';
import 'package:urdentist/presentation/carierDetector/result.dart';
import 'package:urdentist/presentation/chooseProfile/screen/choose_profile.dart';
import 'package:urdentist/presentation/chooseProfile/screen/create_profile.dart';
import 'package:urdentist/presentation/consultation/screen/answer.dart';
import 'package:urdentist/presentation/consultation/screen/book_success.dart';
import 'package:urdentist/presentation/consultation/screen/booking.dart';
import 'package:urdentist/presentation/consultation/screen/consultation.dart';
import 'package:urdentist/global_widgets/scaffold_navbar.dart';
import 'package:urdentist/presentation/consultation/screen/create_question.dart';
import 'package:urdentist/presentation/consultation/screen/dentist_detail.dart';
import 'package:urdentist/presentation/habit/habit.dart';
import 'package:urdentist/presentation/habit/recapDetail.dart';
import 'package:urdentist/presentation/healthTracker/screen/health_tracker.dart';
import 'package:urdentist/presentation/healthTracker/screen/question1.dart';
import 'package:urdentist/presentation/healthTracker/screen/question2.dart';
import 'package:urdentist/presentation/healthTracker/screen/question3.dart';
import 'package:urdentist/presentation/healthTracker/screen/question4.dart';
import 'package:urdentist/presentation/homepage/homepage.dart';

import 'package:urdentist/route/routes.dart';
import 'package:go_router/go_router.dart';

import 'package:urdentist/presentation/splash/splash_screen.dart';
import 'package:urdentist/presentation/splash/introduction.dart';
import 'package:urdentist/presentation/authentication/screen/signin.dart';
import 'package:urdentist/presentation/authentication/screen/forgot_password.dart';
import 'package:urdentist/presentation/authentication/screen/forgot_password_code.dart';
import 'package:urdentist/presentation/authentication/screen/create_newpass.dart';
import 'package:urdentist/presentation/authentication/screen/register.dart';
import 'package:urdentist/presentation/authentication/screen/register_code.dart';
import 'package:urdentist/presentation/authentication/screen/email_success.dart';
import 'package:urdentist/presentation/authentication/screen/forgot_success.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  final _rootNavKey = GlobalKey<NavigatorState>();
  final _shellNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: Routes.SPLASH_SCREEN,
        navigatorKey: _rootNavKey,
        routes: [
          ShellRoute(
            navigatorKey: _shellNavKey,
            builder: (context, state, widget) =>
                ScaffoldWithNavbar(context, widget),
            routes: [
              GoRoute(
                parentNavigatorKey: _shellNavKey,
                path: Routes.HOMEPAGE_SCREEN,
                builder: (context, _) => HomePage(),
              ),
              GoRoute(
                parentNavigatorKey: _shellNavKey,
                path: Routes.CONSULTATION_SCREEN,
                builder: (context, _) => Consultation(),
              ),
              GoRoute(
                parentNavigatorKey: _shellNavKey,
                path: Routes.HABIT_SCREEN,
                builder: (context, _) => Habit(),
              ),
              GoRoute(
                parentNavigatorKey: _shellNavKey,
                path: Routes.ACCOUNT_SCREEN,
                builder: (context, _) => Account(),
              ),
            ],
          ),
          // ------

          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.SPLASH_SCREEN,
            builder: (context, _) => const SplashScreen(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.INTRODUCTION_SCREEN,
            builder: (context, _) => Introduction(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.SIGNIN_SCREEN,
            builder: (context, _) => SignIn(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.FORGOT_SCREEN,
            builder: (context, _) => ForgotPassword(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.FORGOTCODE_SCREEN,
            builder: (context, _) => ForgotPasswordCode(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.CREATEPASS_SCREEN,
            builder: (context, _) => CreateNewPass(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.REGISTER_SCREEN,
            builder: (context, _) => Register(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.REGISTERCODE_SCREEN,
            builder: (context, _) => RegisterCode(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.EMAILSUCCESS_SCREEN,
            builder: (context, _) => EmailSuccess(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.FORGOTSUCCESS_SCREEN,
            builder: (context, _) => ForgotSuccess(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.RECAPDETAIL_SCREEN,
            builder: (context, _) => RecapDetail(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.CHOOSEPROFILE_SCREEN,
            builder: (context, _) => ChooseProfile(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.CREATEPROFILE_SCREEN,
            builder: (context, _) => CreateProfile(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.ANSWER_SCREEN,
            builder: (context, _) => Answer(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.DETAILDENTIST_SCREEN,
            builder: (context, _) => DetailDentist(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.CREATEQUESTION_SCREEN,
            builder: (context, _) => CreateQuestion(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.BOOKING_SCREEN,
            builder: (context, _) => Booking(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.ARTICLE_SCREEN,
            builder: (context, _) => Article(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.HEALTHTRACKET_SCREEN,
            builder: (context, _) => HealthTracker(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.BOOKSUCCESS_SCREEN,
            builder: (context, _) => BookSuccess(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.QUESTION1_SCREEN,
            builder: (context, _) => Question1(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.QUESTION2_SCREEN,
            builder: (context, _) => Question2(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.QUESTION3_SCREEN,
            builder: (context, _) => Question3(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.QUESTION4_SCREEN,
            builder: (context, _) => Question4(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.CARIERDETECT_SCREEN,
            builder: (context, _) => CameraScreen(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.RESULT_SCREEN,
            builder: (context, _) => ResultScreen(),
          ),
        ],
      ),
    );
  }
}
