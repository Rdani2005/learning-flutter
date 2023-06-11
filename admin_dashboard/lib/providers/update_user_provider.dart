import 'dart:typed_data';

import 'package:admin_dashboard/api/coffee_api.dart';
import 'package:admin_dashboard/services/services.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/user.dart';

class UpdateUserProvider extends ChangeNotifier {
  Usuario? user;
  late GlobalKey<FormState> formKey;

  set username(String name) {
    user!.nombre = name;
    notifyListeners();
  }

  set userEmail(String email) {
    user!.correo = email;
    notifyListeners();
  }

  bool validForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future updateUser() async {
    if (!validForm()) return false;
    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };

    try {
      await CoffeeApi.httpPut('/usuarios/${user!.uid}', data);
      NotificationsService.showSnackbarSuccessful("Successfully updated user.");
      return true;
    } catch (e) {
      NotificationsService.showSnackbarError("Error Updating info for user.");
      return false;
    }
  }

  Future uploadImage(String path, Uint8List bytes) async {
    try {
      final res = await CoffeeApi.httpUploadFile(path, bytes);
      user = Usuario.fromJson(res);
      notifyListeners();
      NotificationsService.showSnackbarSuccessful(
          "Image Uploaded Successfully");
    } catch (e) {
      NotificationsService.showSnackbarError("Image could not be uploaded.");
    }
  }
}
