import 'package:dee_pee_ink/app/quotes/quote_response/quote_response_card.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../common_widgets/common_icon.dart';
import '../../../common_widgets/space.dart';
import '../../../controllers/quote_list_controller.dart';
import '../../../model/list_quote_response.dart';
import '../../../ui_utils/assets.dart';
import '../../../utils/utils.dart';
import '../quotes_details_page/quote_details_page.dart';

class ResponseQuotePage extends StatefulWidget {
  const ResponseQuotePage({Key? key, this.quoteList, this.orderId}) : super(key: key);
  final Quotes? quoteList;
  final String? orderId;

  @override
  State<ResponseQuotePage> createState() => _ResponseQuotePageState();
}

class _ResponseQuotePageState extends State<ResponseQuotePage> {
  late ListQuoteScreenController _controller;
  var formatter = NumberFormat('#,##,##0.00');

  @override
  void initState() {
    super.initState();
    _controller = ListQuoteScreenController();
    _controller.addListener(_listener);
    _controller.init(context,widget.orderId.toString());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _listener() {
    setState(() {});
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<bool> _onBackPressed() async {
    if (_controller.isSearching) {
      FocusScope.of(context).unfocus();
      _controller.stopSearching();
      // _controller.listQuoteupdate();
      print(true);
      return true;
    } else {
      print(false);
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
            onWillPop: _onBackPressed,
            child: Scaffold(
              backgroundColor: UIColors.bgColor,
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(UIDimens.size20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              body: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppBar(
                        backgroundColor: UIColors.bgColor,
                        centerTitle: true,
                        iconTheme: const IconThemeData(
                          color: UIColors.blackColor, //change your color here
                        ),
                        elevation: UIDimens.size2,
                        leading: _controller.isSearching
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CommonIcon(
                              path: Assets.back,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                _controller.stopSearching();
                                _controller.listQuoteupdate();
                              },
                              size: UIDimens.size2),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CommonIcon(
                            path: Assets.back,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              Navigator.of(context).pop(true);
                            },
                            size: 2,
                          ),
                        ),
                        title: _controller.isSearching
                            ? buildSearchField()
                            : _controller.isSearching
                            ? buildSearchField()
                            : Text(StringResources.myQuotes.tr(context),
                            style: Styles.textBoldStyle
                                .copyWith(color: UIColors.greyColor)),
                        actions: buildActions(),
                      ),
                      const Space(isSmall: true),
                      Expanded(
                        child: (_controller.quoteList.isNotEmpty)
                            ? ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            debugPrint("quote status ${_controller.quoteList[index].quoteStatus?.name.toString()}");
                            return GestureDetector(
                                onTap: () {
                                  _controller.quoteFilter == "4"
                                      ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuoteDetailsPage(
                                                quoteList: _controller
                                                    .quoteList[index],
                                                orderNo: _controller
                                                    .quoteListAccepted[
                                                index]
                                                    .order!
                                                    .code,orderId: _controller
                                                  .quoteListAccepted[
                                              index]
                                                  .order!.id.toString(),
                                              ))).then((val) =>
                                  val ? refreshOnly() : null)
                                      : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuoteDetailsPage(
                                                quoteList: _controller
                                                    .quoteList[index],
                                                orderNo: _controller.quoteList[index].order?.code,
                                              ))).then((val) =>
                                  val ? refreshOnly() : null);
                                },
                                child:  _controller.quoteFilter == "4"
                                    ? QuoteResponseListCard(
                                  download: ()
                                  {
                                    debugPrint("on clicked");
                                    // openFile(
                                    //     url:"http://www.africau.edu/images/default/sample.pdf",
                                    //     fileName:'quote.pdf');
                                  },
                                  quoteNo: _controller
                                      .quoteList[index].code!,
                                  orderNo: _controller
                                      .quoteListAccepted[index]
                                      .order!
                                      .code
                                      .toString(),
                                  // orderDate:
                                  //     _controller.quoteList[index].requestedDate!,
                                  requestDate: _controller
                                      .quoteList[index]
                                      .requestedDate !=
                                      null
                                      ? Utils.formatDate(
                                      _controller
                                          .quoteList[index]
                                          .requestedDate!,
                                      'dd/MM/yyyy hh:mm a')
                                      : " ",
                                  amount: formatter.format(
                                      _controller.quoteList[index]
                                          .totalAmount),
                                  // amount: "0",
                                  quoteStatus: _controller
                                      .quoteList[index]
                                      .quoteStatus
                                      ?.name!,
                                  orderStatus: _controller.quoteList[index].order?.orderStatus!,
                                  // orderStatus: "Order In progress",
                                )
                                    :QuoteResponseListCard(
                                  download: (){
                                    debugPrint("on clicked");
                                    // openFile(
                                    //   url: "http://www.africau.edu/images/default/sample.pdf",
                                    // fileName:'quote.pdf');
                                  },
                                  quoteNo: _controller
                                      .quoteList[index].code!,
                                  // orderNo: _controller.quoteList[index].order.,
                                  // orderDate:
                                  //     _controller.quoteList[index].requestedDate!,
                                  orderNo: _controller.quoteList[index].order?.code,
                                  requestDate: _controller
                                      .quoteList[index]
                                      .requestedDate !=
                                      null
                                      ? Utils.formatDate(
                                      _controller
                                          .quoteList[index]
                                          .requestedDate!,
                                      'dd/MM/yyyy hh:mm a')
                                      : " ",
                                  amount: _controller.quoteList[index].quoteStatus?.name.toString() == "Accepted"?
                                  formatter.format(
                                      _controller.quoteList[index]
                                          .totalAmount):_controller.quoteList[index].quoteStatus?.name.toString() == "Responded"?
                                  formatter.format(
                                      _controller.quoteList[index]
                                          .totalAmount):formatter.format(
                                      _controller.quoteList[index]
                                          .totalApproxAmount),
                                  // amount: "0",
                                  quoteStatus: _controller
                                      .quoteList[index]
                                      .quoteStatus
                                      ?.name!,
                                  orderStatus: _controller.quoteList[index].order?.orderStatus,
                                ));
                          },
                          itemCount: _controller.quoteList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                        )
                            : _generateEmptyQuote(),
                        // QuoteResponseListCard(
                        //   quoteNo: "Q2402",
                        //   amount: "1200",
                        // ),
                        // Center(
                        //   child: Text("March 9, 2022"),
                        // ),
                        // QuoteResponseListCard(
                        //   quoteNo: "Q0224",
                        //   orderNo: "0302",
                        //   orderDate: "09/03/2022",
                        //   amount: "700",
                        //   quoteStatus: "Quote Accepted",
                        //   orderStatus: "Order In progress",
                        // ),
                        // QuoteResponseListCard(
                        //   quoteNo: "Q1408",
                        //   amount: "7500",
                        // ),
                        // Center(
                        //   child: Text(
                        //     "March 8, 2022",
                        //   ),
                        // ),
                        // QuoteResponseListCard(
                        //   quoteNo: "Q2402",
                        //   orderNo: "2348",
                        //   amount: "1200",
                        //   quoteStatus: "Quote denied",
                        //   orderStatus: "Payment pending",
                        // ),
                        // QuoteResponseListCard(
                        //   quoteNo: "Q0224",
                        //   orderNo: "0302",
                        //   amount: "700",
                        //   orderStatus: "Order In progress",
                        //   quoteStatus: "Quote Expired",
                        //   orderDate: "08/03/2022",
                        // ),
                        // Center(
                        //   child: Text("March 7, 2022"),
                        // ),
                        // QuoteResponseListCard(
                        //   quoteNo: "Q1408",
                        //   amount: "7500",
                        // ),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }

  // Future openFile({required String url, String? fileName})async{
  // final file = await downloadFile(url,fileName!);
  // if(file == null) return;
  //
  // print('Path: ${file.path}');
  //
  // OpenFile.open(file.path);
  // }
  //
  // Future<File?> downloadFile(String url,String name)async{
  //   final appStorage = await getApplicationDocumentsDirectory();
  //   final file = File('${appStorage.path}/$name');
  //
  //   try {
  //     final response = await Dio().get(
  //         url,
  //         options: Options(
  //           responseType: ResponseType.bytes,
  //           followRedirects: false,
  //           receiveTimeout: 0,
  //         )
  //     );
  //
  //     final raf = file.openSync(mode: FileMode.write);
  //     raf.writeFromSync(response.data);
  //     await raf.close();
  //
  //     return file;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  List<Widget> buildActions() {
    if (_controller.isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(
            Icons.cancel_outlined,
            size: UIDimens.size20,
          ),
          onPressed: () {
            if (_controller.searchQueryController == null ||
                _controller.searchQueryController.text.isEmpty) {
              return;
            }
            _controller.clearSearchQuery();
            _controller.listQuoteupdate();
          },
        ),
        IconButton(
          icon: const Icon(
              Icons.search_rounded,
              size: UIDimens.size35,
              color: UIColors.blackColor
          ),
          onPressed: () {
            if (_controller.searchQueryController.text.trim().isNotEmpty) {
              _controller.listQuoteupdate();
            }
          },
        ),
      ];
    }

    return <Widget>[
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommonIcon(
              path: Assets.search,
              onPressed: () {
                _controller.startSearch();
              },
              size: UIDimens.size18)),
      PopupMenuButton<String>(
        icon: const Icon(Icons.filter_list),
        onSelected: (String result) {
          switch (result) {
            case 'filter1':
              print('filter 1 New clicked');

              _controller.setFilter("1");
              break;
            case 'filter2':
              print('filter 2 Requested clicked');
              _controller.setFilter("2");
              break;
            case 'filter3':
              print('filter 3 Responded clicked');
              _controller.setFilter("3");
              break;
            case 'filter4':
              print('filter 4 Accepted clicked');
              _controller.setFilter("4");
              break;
            case 'filter5':
              print('filter 8 denied clicked');
              _controller.setFilter("8");
              break;
            case 'filter6':
              print('filter 6 Expiredclicked');
              _controller.setFilter("6");
              break;
            case 'clearFilters':
              print('Clear filters');
              _controller.setFilter("null");
              break;
            default:
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'filter1',
            child: Text('New'),
          ),
          // const PopupMenuItem<String>(
          //   value: 'filter2',
          //   child: Text('Requested'),
          // ),
          const PopupMenuItem<String>(
            value: 'filter3',
            child: Text('Responded'),
          ),
          const PopupMenuItem<String>(
            value: 'filter4',
            child: Text('Accepted'),
          ),
          const PopupMenuItem<String>(
            value: 'filter5',
            child: Text('Denied'),
          ),
          const PopupMenuItem<String>(
            value: 'filter6',
            child: Text('Expired'),
          ),
          const PopupMenuItem<String>(
            value: 'clearFilters',
            child: Text('Clear filters'),
          ),
        ],
      )
    ];
  }

  refreshOnly() async {
    _controller.init(context,widget.orderId.toString());
  }

  Widget buildSearchField() {
    return TextField(
      controller: _controller.searchQueryController,
      autofocus: true,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          _controller.listQuoteupdate();
        }
      },
      decoration: const InputDecoration(
        hintText: "Search Quotes",
        border: InputBorder.none,
        hintStyle:
        TextStyle(color: UIColors.blackColor/*Colors.black38*/, fontWeight: FontWeight.w600),
      ),
      style: const TextStyle(
          color: UIColors.blackColor/*Colors.black87*/, fontSize: 16.0, fontWeight: FontWeight.w600),
      onChanged: (query) {
        if (query.length <= 0) {
          _controller.clearSearchQuery();
          _controller.listQuoteupdate();
        }
      },
    );
  }

  Widget _generateEmptyQuote() {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          // color: Colors.grey[800],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  _controller.isSearching == true
                      ? "Quote doesn't exist"
                      : _controller.isfirst == false
                      ? "Loading..."
                      : "Your Quote is Empty",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      color: UIColors.blackColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}