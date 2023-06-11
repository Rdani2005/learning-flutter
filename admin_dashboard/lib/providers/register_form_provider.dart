import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  String email = '';
  String name = '';
  String password = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validateForm() {
    return formKey.currentState!.validate();
  }
}
