import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/fakestore_api_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FakeStoreApiDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<List<Product>> getProducts({
    required int limit,
    String? category,
  }) async {
    return await dataSource.getProducts(
      limit: limit,
      category: category,
    );
  }

  @override
  Future<List<String>> getCategories() async {
    return await dataSource.getCategories();
  }
}
