import 'dart:convert';

import 'package:furniture_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<ProductModel>?> getProducts() async {
    try {
      final response = await http.get(Uri.parse(
          'https://5f210aa9daa42f001666535e.mockapi.io/api/products'));
      if (response.statusCode == 200) {
         List<ProductModel>? productModel = List<ProductModel>.from(
          jsonDecode(response.body).map(
            (element) => ProductModel.fromJson(element),
          ),
        );

        return productModel;
      }
    } catch (e) {
      print('API Error => => $e');
    }
    return null;
  }
}
