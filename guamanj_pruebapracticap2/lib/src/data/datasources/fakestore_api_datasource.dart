import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class FakeStoreApiDataSource {
  final String baseUrl = "https://fakestoreapi.com";

  // Obtener productos con paginacion y filtro
  Future<List<ProductModel>> getProducts({
    required int limit,
    String? category,
  }) async {
    String endpoint = "$baseUrl/products";
    
    // Si hay filtro por categoria, usar endpoint especifico
    if (category != null && category.isNotEmpty && category != 'all') {
      endpoint = "$baseUrl/products/category/$category";
    }
    
    // Agregar limite de productos
    endpoint += "?limit=$limit";

    final resp = await http.get(Uri.parse(endpoint));

    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Error cargando productos");
    }
  }

  // Obtener lista de categorias
  Future<List<String>> getCategories() async {
    final url = Uri.parse("$baseUrl/products/categories");
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final List<dynamic> data = jsonDecode(resp.body);
      return data.map((e) => e.toString()).toList();
    } else {
      throw Exception("Error cargando categorias");
    }
  }
}
