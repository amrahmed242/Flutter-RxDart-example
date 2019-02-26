import 'dart:async';
import 'package:form_validation_bloc/blocs/validator.dart';
import 'package:form_validation_bloc/models/user.dart';
import 'package:rxdart/rxdart.dart';

//add the                      Validator mixins
class Bloc extends Object with Validator {
  //A SPECIAL REPLACEMENT FOR NORMAL StreamController (EXTRA FUNCTIONALITY)
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //sending data to bloc
  Function(String) get changedEmail => _emailController.sink.add;
  Function(String) get changedPassword => _passwordController.sink.add;

  //recieving from bloc
  Stream<String> get validatedEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get validatedPassword =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(validatedEmail, validatedPassword, (e, p) => true);

  User submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    return User(validEmail.toString(), validPassword.toString());
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
