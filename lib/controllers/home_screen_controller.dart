import 'package:dee_pee_ink/model/category_response.dart'as prefix;
import 'package:dee_pee_ink/model/product_filter.dart';
import 'package:dee_pee_ink/repositories/products_repository.dart';
import 'package:dee_pee_ink/repositories/profile_repository.dart';
import 'package:flutter/cupertino.dart';

import '../model/feature_product_response.dart';
import '../model/product_list_response.dart';
import '../model/profile_response.dart';
import '../utils/app_preferences.dart';

class HomeScreenController extends ChangeNotifier {
  String name = '';

  bool get isLoading => _isLoading;
  final bool _isLoading = true;
  ProductsRepository _productsRepository = ProductsRepository();
  ProfileRepository _profileRepository = ProfileRepository();

  List<Products> _products = [];
  List<Products> get products => _products;

  FeatureProductResponse? _featureProducts;
  FeatureProductResponse? get featureProducts => _featureProducts;

  List<prefix.Categories> _categories = [];
  List<prefix.Categories> get categories => _categories;

  int currentCategory = 0;
  ProfileDetail? _profileDetail;
  ProfileDetail? get profileDetail => _profileDetail;

  String _cartCount = "";
  String get cartCount => _cartCount;

  late BuildContext _context;
  Future<void> init(BuildContext context) async {
    _context = context;
    _categories = (await _productsRepository.fetchCategoriesList(context))!;
    _cartCount = await AppPreferences.getCartCount();
    _products = await _productsRepository.fetchProductList(context,
        ProductFilter(orderBy: "created_at asc", page: 1, perPage: 20));
    _featureProducts = (await _productsRepository.getFeaturedProduct(context))!;
    notifyListeners();
    notifyListeners();
    _profileDetail = await _profileRepository.getProfileResponse(context);
    name = "Hi " + (_profileDetail?.fullName)!;

    notifyListeners();
  }

  Future<void> updateCategory(int index) async {
    if (currentCategory != index) {
      _categories[index].isEnabled = true;
      _categories[currentCategory].isEnabled = false;
      currentCategory = index;
      notifyListeners();
      _products = await _productsRepository.fetchProductList(
          _context,
          ProductFilter(
              orderBy: "created_at asc",
              page: 1,
              perPage: 20,
              brandIds: _categories[index].id));
      notifyListeners();
    }
  }

  refreshCartCount() async {
    _cartCount = await AppPreferences.getCartCount();
    notifyListeners();
  }
}
