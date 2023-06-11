import 'package:admin_dashboard/services/services.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/coffee_api.dart';

import 'package:admin_dashboard/models/models.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];

  getCategories() async {
    final res = await CoffeeApi.httpGet('/categorias');
    final catRes = GetCategoriesResponse.fromJson(res);
    categorias = [...catRes.categorias];
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {'nombre': name};

    try {
      final json = await CoffeeApi.httpPost('/categorias', data);
      final newCategory = Categoria.fromJson(json);
      categorias.add(newCategory);
      notifyListeners();
      NotificationsService.showSnackbarSuccessful('$name added successfully.');
    } catch (e) {
      NotificationsService.showSnackbarError('$name could not be created.');
    }
  }

  Future updateCategory(String name, String id) async {
    final data = {'nombre': name};

    try {
      await CoffeeApi.httpPut('/categorias/$id', data);
      categorias = categorias.map(
        (c) {
          if (c.id != id) return c;
          c.nombre = name;
          return c;
        },
      ).toList();
      notifyListeners();
      NotificationsService.showSnackbarSuccessful(
          '$name updated successfully.');
    } catch (e) {
      NotificationsService.showSnackbarError('Error updating the category.');
    }
  }

  Future deleteCategory(String id) async {
    try {
      await CoffeeApi.httpDelete("/categorias/$id");
      categorias.removeWhere((c) => c.id == id);
      notifyListeners();
      NotificationsService.showSnackbarSuccessful(
          'Category deleted successfully.');
    } catch (e) {
      NotificationsService.showSnackbarError('Error deleting the category.');
    }
  }
}
