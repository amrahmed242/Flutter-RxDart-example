import 'package:flutter/material.dart';
import 'package:form_validation_bloc/screens/login_screen.dart';
import './blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'form Bloc',
        home: Scaffold(
          appBar: AppBar(
            title: Text("form validation with bloc pattern"),
            centerTitle: true,
          ),
          body: LoginScreen(),
        ),
      ),
    );
  }
}
