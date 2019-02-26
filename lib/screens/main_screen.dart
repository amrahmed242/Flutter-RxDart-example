import 'package:flutter/material.dart';
import 'package:form_validation_bloc/models/user.dart';

class MainScreen extends StatefulWidget {
  final User user;
  MainScreen({Key key, @required this.user}) : super(key: key);
  _MainScreenState createState() => _MainScreenState(user: user);
}

class _MainScreenState extends State<MainScreen> {
  final User user;
  _MainScreenState({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(user.email)));
  }
}
