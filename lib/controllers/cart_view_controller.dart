import 'package:dee_pee_ink/common_widgets/app_snack_bar.dart';
import 'package:dee_pee_ink/model/edit_cart_response.dart';
import 'package:dee_pee_ink/model/edit_quote_request_response.dart';
import 'package:dee_pee_ink/model/view_cart_response.dart';
import 'package:dee_pee_ink/repositories/view_cart_repository.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/utils/app_preferences.dart';
import 'package:flutter/cupertino.dart';

import '../model/cart_delete_body.dart';

class ViewCartScreenController extends ChangeNotifier {
  BuildContext? _context;
  String name = '';
  bool get isfirst => _isfirst;
  bool _isfirst = false;

  bool get isLoading => _isLoading;
  final bool _isLoading = true;
  final ViewCartRepository _viewCartRepository = ViewCartRepository();

  // final TextEditingController _controllerQty = TextEditingController(text: "0");
  // TextEditingController get controllerQty => _controllerQty;
  final List<TextEditingController> _controllerQty = [];

  List<TextEditingController> get controllerQty => _controllerQty;
  final List<QuoteItemsEdit> _quoteItemsList = [];

  double _total = 0;

  double get total => _total;

  List<QuoteItems> _quoteItems = [];

  List<QuoteItems> get quoteItems => _quoteItems;

  ViewCartResponse? _cartItems;

  ViewCartResponse? get cartItems => _cartItems;

  Future<void> init(BuildContext context) async {
    _context = context;
    String curQuoteId = (await AppPreferences.getCurQuoteId());
    print("curQuoteId " + curQuoteId);
    if (curQuoteId.isNotEmpty) {
      ViewCartResponse? _viewCartDetailResponse = (await _viewCartRepository
          .getCartDetails(context, curQuoteId.toString()));
      print(_viewCartDetailResponse);
      if (_viewCartDetailResponse != null) {
        _cartItems = _viewCartDetailResponse;
        _isfirst = true;
        _total = 0.0;
        _quoteItems = [];
        _quoteItems =
            _viewCartDetailResponse.data?.quoteItems as List<QuoteItems>;
        notifyListeners();
        var quoteItems =
            _viewCartDetailResponse.data?.quoteItems as List<dynamic>;
        controllerQty.clear();
        await AppPreferences.setCartCount(quoteItems.length.toString());
        notifyListeners();
        for (int i = 0; i < quoteItems.length; i++) {
          var textEditingController =
              TextEditingController(text: quoteItems[i].quantity.toString());
          controllerQty.add(textEditingController);
          _total = (_total +
              ((quoteItems[i].quantity) *
                  (quoteItems[i].product?.approxPrice)));
          print(_total.toString());
          notifyListeners();
        }
      } else {
        await AppPreferences.setCartCount("");
        _quoteItems = [];
        notifyListeners();
      }
      notifyListeners();
    } else {
      _isfirst = true;
      await AppPreferences.setCartCount("");
      _quoteItems = [];
      notifyListeners();
    }
  }

  Future<bool> deleteQuoteItem(quoteItemId) async {
    String curQuoteId = (await AppPreferences.getCurQuoteId());
    EditCartResponse? response = (await _viewCartRepository.deleteCartItemsNew(
        _context!,
        CartDeleteBody(
            id: int.parse(curQuoteId), quoteItemsId: int.parse(quoteItemId))));

    if (response != null) {
      if (_quoteItems.length == 1) {
        await AppPreferences.setCurQuoteId("");
        await AppPreferences.setCartCount("");
        _quoteItems = [];
        _total = 0.0;
        notifyListeners();
        print("code:7002");
      }
      init(_context!);
      AppSnackBar(message: response.message.toString(),)
          .showAppSnackBar(_context!);
      notifyListeners();
      return true;
    } else {
      if (_quoteItems.isNotEmpty) {
        init(_context!);
        notifyListeners();
      } else {
        await AppPreferences.setCurQuoteId("");
        await AppPreferences.setCartCount("");
        _quoteItems = [];
        _total = 0.0;
        notifyListeners();
      }
      print("responseNull");
      return false;
    }
  }

  Future<bool> editQuoteItems(String quoteItemId, String productId,
      String colorId, String quantity) async {
    String curQuoteId = (await AppPreferences.getCurQuoteId());
    print("productId " + productId);
    print("colorId " + colorId);
    print("quantity " + quantity);

    _quoteItemsList.add(QuoteItemsEdit(
        id: int.parse(quoteItemId),
        productId: int.parse(productId),
        colorId: int.parse(colorId),
        quantity: int.parse(quantity)));

    EditCartResponse? response = await _viewCartRepository.editCartItems(
        curQuoteId,
        _context,
        EditQuoteRequestResponse(quote: Quote(quoteItems: _quoteItemsList)));
    if (response != null) {
      init(_context!);
      notifyListeners();
      _quoteItemsList.clear();

      notifyListeners();
      return true;
    } else {
      _quoteItemsList.clear();

      notifyListeners();
      return false;
    }
  }

  incrementQty(int index) {
    print("incrementQty" + index.toString());
     int currentValue = int.parse(_controllerQty[index].text);

    // currentValue++;

    // _controllerQty[index].text = (currentValue).toString();
    // print(currentValue);
    if(currentValue != 999) {
      editQuoteItems(
          _quoteItems[index].id.toString(),
          _quoteItems[index].product!.id.toString(),
          _quoteItems[index].color!.id.toString(),
          (int.parse(_controllerQty[index].text) + 1).toString());
      notifyListeners();
    }
  }

  decrementQty(int index) {
    int currentValue = int.parse(_controllerQty[index].text);
    if (currentValue != 1) {
      // currentValue--;

      // _controllerQty[index].text =
      //     (currentValue >= 0 ? currentValue : 0).toString();
      // print(currentValue);
      editQuoteItems(
          _quoteItems[index].id.toString(),
          _quoteItems[index].product!.id.toString(),
          _quoteItems[index].color!.id.toString(),
          (int.parse(_controllerQty[index].text) - 1).toString());
      notifyListeners();
    }
  }

  updateQty(int index) {
    int currentValue = int.parse(_controllerQty[index].text);
    if (currentValue >= 1) {
      notifyListeners();
    } else {
      int currentValue = 1;
      _controllerQty[index].text = currentValue.toString();
      notifyListeners();
    }
    editQuoteItems(
        _quoteItems[index].id.toString(),
        _quoteItems[index].product!.id.toString(),
        _quoteItems[index].color!.id.toString(),
        _controllerQty[index].text);
  }
}
