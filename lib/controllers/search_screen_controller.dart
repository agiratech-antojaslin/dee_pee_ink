import 'package:dee_pee_ink/model/product_filter.dart';
import 'package:dee_pee_ink/repositories/products_repository.dart';
import 'package:flutter/cupertino.dart';

import '../model/product_list_response.dart';

class SearchScreenController extends ChangeNotifier {
  String name = '';

  bool get isLoading => _isLoading;
  bool _isLoading = true;
  ProductsRepository _productsRepository = ProductsRepository();

  List<Products> _products = [];

  List<Products> get products => _products;

  final TextEditingController _searchFieldController = TextEditingController();

  TextEditingController get searchFieldController => _searchFieldController;

  late BuildContext _context;

  Future<void> init(BuildContext context) async {
    _context = context;

    notifyListeners();
  }

  void submitSearch() async {
    _products = [];
    _isLoading = true;
    notifyListeners();
    _products = await _productsRepository.fetchProductList(
        _context,
        ProductFilter(
            orderBy: "created_at asc",
            search: _searchFieldController.text.trim(),
            page: 1,
            perPage: 20));
    _isLoading = false;
    notifyListeners();
  }
}
