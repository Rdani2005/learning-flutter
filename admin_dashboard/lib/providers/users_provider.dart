import 'package:admin_dashboard/api/coffee_api.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/models.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = false;

  bool ascending = false;
  int? sortColumnIndex;

  UsersProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final res = await CoffeeApi.httpGet('/usuarios?limite=100&desde=0');
    final userRes = UsersResponse.fromJson(res);
    users = [...userRes.usuarios];
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;
    notifyListeners();
  }

  Future<Usuario?> getUserByUID(String uid) async {
    try {
      final res = await CoffeeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromJson(res);
      return user;
    } catch (e) {
      return null;
    }
  }

  refreshUsers(Usuario user) {
    users = users.map((u) {
      if (user.uid != u.uid) return u;
      return user;
    }).toList();
  }
}
