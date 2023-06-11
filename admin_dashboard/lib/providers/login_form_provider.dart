import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  String email = '';
  String password = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginFormProvider();

  bool validateForm() {
    return formKey.currentState!.validate();
  }
}
