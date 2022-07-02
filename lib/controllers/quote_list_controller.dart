import 'package:dee_pee_ink/model/quote_pdf_response.dart';
import 'package:dee_pee_ink/repositories/quote_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import '../model/list_quote_accecpted_response.dart';
import '../model/list_quote_filter.dart';
import '../model/list_quote_response.dart';
import '../utils/app_preferences.dart';

class ListQuoteScreenController extends ChangeNotifier {
  BuildContext? _context;

  bool get isLoading => _isLoading;
  final bool _isLoading = true;
  bool get isfirst => _isfirst;
  bool _isfirst = false;

  final QuotesRepository _quotesRepository = QuotesRepository();

  final TextEditingController _searchQueryController = TextEditingController();

  TextEditingController get searchQueryController => _searchQueryController;
  bool _isSearching = false;

  bool get isSearching => _isSearching;

  List<Quotes> _quoteList = [];

  List<Quotes> get quoteList => _quoteList;

  List<QuotesAccepted> _quoteListAccepted = [];

  List<QuotesAccepted> get quoteListAccepted => _quoteListAccepted;

  String _quoteFilter = "null";

  String get quoteFilter => _quoteFilter;

  Future<void> init(BuildContext context,String orderId) async {
    _context = context;
    listQuoteupdate();
    listQuote();
    await AppPreferences.setCurOrderId(orderId.toString());
    debugPrint("QuoteResponsePage " + orderId.toString());
    notifyListeners();
  }


  Future<bool> downloadQuotePDF() async {
    String quoteID = await AppPreferences.getCurQuoteId();
    QuotePDFResponse? response = await _quotesRepository.downloadQuote(_context,quoteID);
    debugPrint("Quote Download ID $quoteID");
    final appStorage = await getApplicationDocumentsDirectory();
    //final file = File('${appStorage.path}/$name');
    if (response != null) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> listQuote() async {
    if (_quoteFilter == "4") {
      ListQuoteAcceptedResponse? response =
          await _quotesRepository.listQuoteAccepted(
              _context,
              ListQuotePostFilter(
                  quote: ListQuote(
                orderBy: "created_at desc",
                search: _searchQueryController.text,
                status: _quoteFilter.toString() != "null"
                    ? int.parse(_quoteFilter)
                    : null,
                page: 1,
                perPage: 50,
              )));
      if (response != null) {
        // print("setCurOrderIdlistQuote "+response.data!.quotes![0].order!.id.toString());
        // await AppPreferences.setCurOrderId(response.data!.quotes![0].order!.id.toString());
        _isfirst = true;
        _quoteListAccepted = [];
        _quoteListAccepted = response.data?.quotes as List<QuotesAccepted>;
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } else {
      return false;
    }
  }

  void listQuoteupdate() async {
    ListQuoteResponse? response = await _quotesRepository.listQuote(
        _context,
        ListQuotePostFilter(
            quote: ListQuote(
          orderBy: "created_at desc",
          search: _searchQueryController.text,
          status: _quoteFilter.toString() != "null"
              ? int.parse(_quoteFilter)
              : null,
          page: 1,
          perPage: 50,
        )));
    if (response != null) {
      _isfirst = true;
      _quoteList = [];
      _quoteList = response.data?.quotes as List<Quotes>;
      notifyListeners();
      // return true;
    } else {
      notifyListeners();
      // return false;
    }
  }

  void startSearch() {
    // ModalRoute.of(_context!)!
    //     .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));

    _isSearching = true;
    _quoteFilter = "null";
    print(_isSearching);
    notifyListeners();
  }

  void updateSearchQuery(String newQuery) {
    if (_searchQueryController == null || _searchQueryController.text.isEmpty) {
      // _clearSearchQuery();
      return;
    }
  }

  void clearSearchQuery() {
    _searchQueryController.clear();

    updateSearchQuery("");
    notifyListeners();
  }

  void stopSearching() {
    clearSearchQuery();

    _isSearching = false;

    notifyListeners();
  }

  void setFilter(String query) {
    print(query);
    _quoteFilter = query;
    listQuoteupdate();
    listQuote();
  }
}
