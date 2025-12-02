import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/data/datasources/fakestore_api_datasource.dart';
import 'src/data/repositories/product_repository_impl.dart';
import 'src/domain/usecases/get_products_usecase.dart';
import 'src/domain/usecases/get_categories_usecase.dart';
import 'src/presentation/viewmodels/product_viewmodel.dart';
import 'src/presentation/routes/app_routes.dart';
import 'tema/app_theme.dart';

void main() {
  // 1. Instancias de Data Layer
  final datasource = FakeStoreApiDataSource();
  final repository = ProductRepositoryImpl(datasource);

  // 2. Instancias de Domain Layer (UseCases)
  final getProductsUseCase = GetProductsUseCase(repository);
  final getCategoriesUseCase = GetCategoriesUseCase(repository);

  runApp(MyApp(
    getProductsUseCase: getProductsUseCase,
    getCategoriesUseCase: getCategoriesUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  const MyApp({
    super.key,
    required this.getProductsUseCase,
    required this.getCategoriesUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductViewModel(
        getProductsUseCase,
        getCategoriesUseCase,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fake Store API - Clean Architecture',
        theme: AppTheme.lightTheme,
        routes: AppRoutes.getRoutes(),
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
