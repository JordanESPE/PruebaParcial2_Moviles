import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> call({
    required int limit,
    String? category,
  }) async {
    return await repository.getProducts(
      limit: limit,
      category: category,
    );
  }
}
