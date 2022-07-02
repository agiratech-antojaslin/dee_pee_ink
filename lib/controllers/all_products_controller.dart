import 'package:dee_pee_ink/model/category_response.dart';
import 'package:dee_pee_ink/model/product_filter.dart';
import 'package:dee_pee_ink/repositories/products_repository.dart';
import 'package:flutter/cupertino.dart';

import '../model/product_list_response.dart';

class AllProductsController extends ChangeNotifier {
  String name = '';

  bool get isLoading => _isLoading;
  final bool _isLoading = true;
  ProductsRepository _productsRepository = ProductsRepository();

  List<Products> _products = [];
  List<Products> get products => _products;

  List<Categories> _categories = [];
  List<Categories> get categories => _categories;

  int currentCategory = 0;

  late BuildContext _context;
  Future<void> init(BuildContext context) async {
    _context = context;
    // _categories = (await _productsRepository.fetchCategoriesList(context))!;

    _products = await _productsRepository.fetchProductList(context,
        ProductFilter(orderBy: "created_at asc", page: 1, perPage: 100));
    print(_products);
    notifyListeners();
  }
}
