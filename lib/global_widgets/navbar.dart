import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urdentist/route/routes.dart';

class AppNavbarItem {
  String icon;
  String route;
  String word;

  AppNavbarItem({
    required this.icon,
    required this.route,
    required this.word,
  });
}

Widget AppNavbar(String selectedRoute, Function(String route) onItemClicked) {
  final items = [
    AppNavbarItem(
      icon: "assets/images/icon_home.svg",
      route: Routes.HOMEPAGE_SCREEN,
      word: "Homepage",
    ),
    AppNavbarItem(
      icon: "assets/images/icon_consultation.svg",
      route: Routes.CONSULTATION_SCREEN,
      word: "Consultation",
    ),
    AppNavbarItem(
        icon: "assets/images/icon_habit.svg",
        route: Routes.HABIT_SCREEN,
        word: "Habit"),
    AppNavbarItem(
      icon: "assets/images/icon_account.svg",
      route: Routes.COMINGSOON_SCREEN,
      word: "Account",
    ),
  ];

  return BottomAppBar(
    color: Colors.white70,
    elevation: 16,
    height: 72,
    padding: EdgeInsets.symmetric(horizontal: 24),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      // ignore: unnecessary_null_comparison
      children: items.where((e) => e != null).map((e) {
        return InkWell(
          onTap: () {
            onItemClicked(e.route);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                e.icon,
                colorFilter: ColorFilter.mode(
                  (e.route == selectedRoute)
                      ? Colors.blue.shade900
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                e.word,
                style: TextStyle(
                    color: (e.route == selectedRoute)
                        ? Colors.blue.shade800
                        : Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}
