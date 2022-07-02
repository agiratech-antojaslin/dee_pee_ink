import 'package:dee_pee_ink/model/add_quote_request_response.dart';
import 'package:dee_pee_ink/model/add_quote_response.dart';
import 'package:dee_pee_ink/model/add_quote_without_id_response.dart';
import 'package:dee_pee_ink/repositories/quote_repository.dart';
import 'package:dee_pee_ink/utils/app_preferences.dart';
import 'package:flutter/cupertino.dart';

class AddToQuoteScreenController extends ChangeNotifier {
  BuildContext? _context;

  bool get isLoading => _isLoading;
  final bool _isLoading = true;
  final QuotesRepository _quotesRepository = QuotesRepository();

  final List<QuoteItems1> _quoteItemsList = [];

  List<QuoteItems1> get quoteItemsList => _quoteItemsList;
  final List<QuoteItemsWo> _quoteItemswithoutIDList = [];

  List<QuoteItemsWo> get quoteItemswithoutIDList => _quoteItemswithoutIDList;
  String curQuoteId = "";

  Future<void> init(BuildContext context) async {
    _context = context;
    notifyListeners();
    // await AppPreferences.setCurQuoteId("");
  }

  Future<bool> addToQuote(
      String productId, String colorId, String quantity) async {
    curQuoteId = (await AppPreferences.getCurQuoteId());
    print("productId " + productId);
    print("colorId " + colorId);
    print("quantity " + quantity);
    print("curQuoteId " + curQuoteId.toString());
    _quoteItemsList.add(QuoteItems1(
        productId: int.parse(productId),
        colorId: int.parse(colorId),
        quantity: int.parse(quantity)));
    _quoteItemswithoutIDList.add(QuoteItemsWo(
        productId: int.parse(productId),
        colorId: int.parse(colorId),
        quantity: int.parse(quantity)));
    AddQuoteResponse? response = await _quotesRepository.addQuote(
        _context,
        curQuoteId == "" || curQuoteId == null
            ? AddQuoteRequestWithOutIdResponse(
                quote: QuoteWo(quoteItems2: _quoteItemswithoutIDList))
            : AddQuoteRequestResponse(
                quote:
                    Quote1(quoteId: curQuoteId, quoteItems1: quoteItemsList)));
    if (response != null) {
      print("setCurQuoteId " + (response.data?.quote?.id).toString());
      await AppPreferences.setCurQuoteId((response.data?.quote?.id).toString());
      // Navigator.pushNamed(_context!, RouteConstants.cartDetails);
      _quoteItemsList.clear();
      _quoteItemswithoutIDList.clear();
      notifyListeners();
      return true;
    } else {
      _quoteItemsList.clear();
      _quoteItemswithoutIDList.clear();
      notifyListeners();
      return false;
    }
  }
}
