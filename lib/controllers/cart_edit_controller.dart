import 'package:dee_pee_ink/model/view_cart_response.dart';
import 'package:dee_pee_ink/repositories/view_cart_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartEditScreenController extends ChangeNotifier {
  BuildContext? _context;
  String name = '';

  bool get isLoading => _isLoading;
  final bool _isLoading = true;
  final ViewCartRepository _viewCartRepository = ViewCartRepository();

  double _total = 0;

  double get total => _total;

  List<QuoteItems> _quoteItems = [];

  List<QuoteItems> get quoteItems => _quoteItems;

  Future<void> init(BuildContext context) async {
    _context = context;
    notifyListeners();
  }
}
