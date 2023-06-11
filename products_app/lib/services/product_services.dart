import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:products_app/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = "products-app-e616b-default-rtdb.firebaseio.com";

  final List<Product> products = [];

  final storage = const FlutterSecureStorage();

  late Product selectedProduct;

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    loadProducts();
  }

  /// FETCH de todos los produtos
  Future loadProducts() async {
    final url = Uri.https(
      _baseUrl,
      'products.json',
      {'auth': await storage.read(key: 'token')},
    );
    final response = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(response.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromJson(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();
    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      await addProduct(product);
    } else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(
      _baseUrl,
      'products/${product.id}.json',
      {'auth': await storage.read(key: 'token')},
    );
    final response = await http.put(url, body: product.toRawJson());
    // final decodedData = response.body;

    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return response.body;
  }

  Future<String> addProduct(Product product) async {
    final url = Uri.https(
      _baseUrl,
      'products.json',
      {'auth': await storage.read(key: 'token')},
    );
    final response = await http.post(url, body: product.toRawJson());
    final decodedData = json.decode(response.body);

    product.id = decodedData['name'];

    products.add(product);

    return product.id!;
  }

  void UpdateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/dthripqjz/image/upload?upload_preset=fkoetxbs");

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url,
    );

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    final decData = json.decode(response.body);

    return decData['secure_url'];
  }
}
