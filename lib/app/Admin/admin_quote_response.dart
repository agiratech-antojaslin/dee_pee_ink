import 'package:dee_pee_ink/app/Admin/admin_accepted_quotes.dart';
import 'package:dee_pee_ink/app/Admin/admin_denied_quotes.dart';
import 'package:dee_pee_ink/app/Admin/admin_expired_quotes.dart';
import 'package:dee_pee_ink/app/Admin/new_quotes_page.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class AdminQuoteResponse extends StatefulWidget {
  const AdminQuoteResponse({Key? key}) : super(key: key);

  @override
  State<AdminQuoteResponse> createState() => _AdminQuoteResponseState();
}

class _AdminQuoteResponseState extends State<AdminQuoteResponse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: <Widget>[
          DefaultTabController(
            length: 4,
            child: Scaffold(
              backgroundColor: UIColors.bgColor,
              appBar: AppBar(
                backgroundColor: UIColors.primaryColor,
                centerTitle: true,
                iconTheme: const IconThemeData(
                  color: UIColors.bgColor, //change your color here
                ),
                elevation: UIDimens.zero,
                actions: [
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.filter_list,
                      color: UIColors.bgColor,
                    ),
                    onSelected: (String result) {
                      switch (result) {
                        case 'filter1':
                          break;
                        case 'filter2':
                          break;
                        case 'clearFilters':
                          break;
                        default:
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'filter1',
                        child: Text('Old - New'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'filter2',
                        child: Text('New - Old'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'clearFilters',
                        child: Text('Clear filters'),
                      ),
                    ],
                  ),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: StringResources.newQuotes.tr(context),
                    ),
                    Tab(
                      text: StringResources.accepted.tr(context),
                    ),
                    Tab(
                      text: StringResources.denied.tr(context),
                    ),
                    Tab(
                      text: StringResources.expired.tr(context),
                    ),
                  ],
                ),
                title: Text(
                  StringResources.admin.tr(context),
                  style: Styles.textStyle3,
                ),
              ),
              body: TabBarView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return const NewQuotesPage(
                        quoteNo: "Q2402",
                        quoteDate: "24/02/2022",
                        name: "rogers",
                        orderAmount: "2403",
                        products: "3",
                        status: "waiting",
                      );
                    },
                    itemCount: 2,
                  ),
                  const AdminAcceptedQuotePage(),
                  const AdminDeniedQuotePage(),
                  const AdminExpiredQuotePage(),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
