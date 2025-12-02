import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/usecases/get_categories_usecase.dart';

class ProductViewModel extends ChangeNotifier {
  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  ProductViewModel(this.getProductsUseCase, this.getCategoriesUseCase);

  // Estado
  List<Product> products = [];
  List<String> categories = [];
  
  bool isLoading = false;
  String? selectedCategory;
  int _currentLimit = 10;
  
  // Inicializacion
  Future<void> init() async {
    await loadCategories();
    await loadProducts(reset: true);
  }

  // Cargar lista de categorias para el filtro
  Future<void> loadCategories() async {
    try {
      final list = await getCategoriesUseCase();
      categories = list;
      notifyListeners();
    } catch (e) {
      print("Error cargando categorias: $e");
    }
  }

  // Cargar productos con paginacion
  Future<void> loadProducts({bool reset = false}) async {
    if (isLoading) return;
    
    if (reset) {
      products.clear();
      _currentLimit = 10;
    }

    isLoading = true;
    notifyListeners();

    try {
      final newProducts = await getProductsUseCase(
        limit: _currentLimit,
        category: selectedCategory,
      );

      products = newProducts;
    } catch (e) {
      print("Error cargando productos: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Cargar mas productos (paginacion)
  void loadMore() {
    _currentLimit += 10;
    loadProducts();
  }

  // Cambiar filtro de categoria
  void setCategoryFilter(String? category) {
    if (selectedCategory != category) {
      selectedCategory = category;
      loadProducts(reset: true);
    }
  }

  // Resetear filtros
  void resetFilters() {
    selectedCategory = null;
    loadProducts(reset: true);
  }
}
