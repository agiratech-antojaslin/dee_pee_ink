import 'package:dee_pee_ink/common_widgets/app_snack_bar.dart';
import 'package:dee_pee_ink/model/request_quote_filter.dart';
import 'package:dee_pee_ink/model/request_quote_response.dart.dart';
import 'package:dee_pee_ink/repositories/quote_repository.dart';
import 'package:dee_pee_ink/utils/app_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestQuoteScreenController extends ChangeNotifier {
  BuildContext? _context;

  bool get isLoading => _isLoading;
  final bool _isLoading = true;
  final QuotesRepository _quotesRepository = QuotesRepository();

  String curQuoteId = "";

  Future<void> init(BuildContext context) async {
    _context = context;
    // await AppPreferences.setCurQuoteId("");
    notifyListeners();
  }

  Future<bool> requestQuote() async {
    curQuoteId = (await AppPreferences.getCurQuoteId());

    RequestQuoteResponse? response = await _quotesRepository.requtestQuote(
        _context, RequestQuote(id: int.parse(curQuoteId)));
    if (response != null) {
      AppSnackBar(message: response.message.toString())
          .showAppSnackBar(_context!);
      await AppPreferences.setCurQuoteId("");
       await AppPreferences.setCartCount("");
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }
}
