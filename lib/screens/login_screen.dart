import 'package:flutter/material.dart';
import 'package:form_validation_bloc/blocs/bloc.dart';
import 'package:form_validation_bloc/models/user.dart';
import 'package:form_validation_bloc/screens/main_screen.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Padding(padding: EdgeInsets.only(bottom: 18)),
          submetButton(context, bloc),
        ],
      ),
    );
  }

  emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.validatedEmail,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changedEmail,
          decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Adress',
              errorText: snapshot.error),
        );
      },
    );
  }

  passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.validatedPassword,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changedPassword,
          decoration: InputDecoration(
              hintText: 'Password', labelText: 'Password', errorText: snapshot.error),
        );
      },
    );
  }

  submetButton(BuildContext context, Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text("login"),
          color: Colors.blue[300],
          onPressed: snapshot.hasData ? () => navigate(context, bloc) : null,
        );
      },
    );
  }

  navigate(BuildContext context, Bloc bloc) async {
    User user = bloc.submit();
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(user: user)));
    }
  }
}
