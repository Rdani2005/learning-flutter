import 'package:admin_dashboard/api/coffee_api.dart';
import 'package:admin_dashboard/models/models.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/services.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notauthenticated,
}

class AuthProvider extends ChangeNotifier {
  Usuario? user;

  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    final data = {
      "correo": email,
      "password": password,
    };
    CoffeeApi.httpPost("/auth/login", data).then((json) {
      final AuthResponse authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;
      LocalStorage.prefs.setString('token', authResponse.token);

      authStatus = AuthStatus.authenticated;
      CoffeeApi.configureDio();
      notifyListeners();
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
    }).catchError((e) {
      NotificationsService.showSnackbarError('User / Pasword not valid.');
      authStatus = AuthStatus.notauthenticated;
    });
    notifyListeners();
  }

  register(String name, String email, String password) {
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };

    CoffeeApi.httpPost("/usuarios", data).then((json) {
      final AuthResponse authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;
      LocalStorage.prefs.setString('token', authResponse.token);

      authStatus = AuthStatus.authenticated;
      CoffeeApi.configureDio();
      notifyListeners();
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
    }).catchError((e) {
      NotificationsService.showSnackbarError('User / Pasword not valid.');
      authStatus = AuthStatus.notauthenticated;
    });
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notauthenticated;
      notifyListeners();
      return false;
    }

    try {
      final response = await CoffeeApi.httpGet('/auth');
      final AuthResponse authResponse = AuthResponse.fromJson(response);
      user = authResponse.usuario;
      LocalStorage.prefs.setString('token', authResponse.token);
      authStatus = AuthStatus.authenticated;
      CoffeeApi.configureDio();
      notifyListeners();
      return true;
    } catch (e) {
      // Not valid token.
      authStatus = AuthStatus.notauthenticated;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notauthenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.loginRoute);
  }
}
