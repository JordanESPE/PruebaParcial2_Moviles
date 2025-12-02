import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({
    required int limit,
    String? category,
  });
  
  Future<List<String>> getCategories();
}
