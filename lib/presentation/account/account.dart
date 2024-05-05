import 'package:flutter/material.dart';
// import 'package:urdentist/data/repository/user.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    // String fullName = UserManager.instance.getFullName();
    // String email = UserManager.instance.getEmail();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
