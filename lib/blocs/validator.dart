import 'dart:async';

class Validator {
  // we must label the*******************<input , output> of the StreamTransformer
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('enter valid email');
      }
    },
  );

  // we must label the*******************<input , output> of the StreamTransformer
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 4) {
        sink.add(password);
      } else {
        sink.addError('Password must be greater than 4');
      }
    },
  );
}
