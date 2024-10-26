import 'dart:convert';

import 'package:fluttercourse/data/constants.dart';
import 'package:fluttercourse/data/products_mapper.dart';
import 'package:fluttercourse/models/product.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(Duration(seconds: 3));
    try {
      final response = await http.get(Uri.parse("$apiBaseUrl/products"));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((json) =>
                mapProductEntityToProduct(ProductEntity.fromJson(json)))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
