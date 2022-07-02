import 'package:dee_pee_ink/common_widgets/app_snack_bar.dart';
import 'package:dee_pee_ink/repositories/quote_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/accept_create_order_response.dart';
import '../model/quote_accept_body.dart';
import '../model/quote_deny_response.dart';
import '../utils/app_preferences.dart';

class QuoteAcceptDenyScreenController extends ChangeNotifier {
  BuildContext? _context;

  bool get isLoading => _isLoading;
  final bool _isLoading = true;
  final QuotesRepository _quotesRepository = QuotesRepository();

  Future<void> init(BuildContext context, String? orderId) async {
    _context = context;
    await AppPreferences.setCurOrderId(orderId.toString());
    print("QuoteDetailPAge " + orderId.toString());
    notifyListeners();
  }

  Future<bool> acceptQuote(String quoteId) async {
    AcceptQuoteCreateOrderResponse? response = await _quotesRepository
        .acceptQuote(_context, AcceptQuoteBody(id: int.parse(quoteId)));

    if (response != null) {
      await AppPreferences.setCurOrderId(response.data!.order!.id.toString());
      print("OrderID " + response.data!.order!.id.toString());
      AppSnackBar(message: response.message.toString())
          .showAppSnackBar(_context!);

      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> denyQuote(String quoteId) async {
    QuoteDenyResponse? response = await _quotesRepository.denyQuote(
        _context, AcceptQuoteBody(id: int.parse(quoteId)));
    if (response != null) {
      AppSnackBar(message: response.message.toString())
          .showAppSnackBar(_context!);

      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }
}
