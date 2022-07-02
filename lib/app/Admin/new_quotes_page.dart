import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewQuotesPage extends StatefulWidget {
  const NewQuotesPage({
    Key? key,
    this.quoteNo,
    this.quoteDate,
    this.name,
    this.orderAmount,
    this.products,
    this.status,
  }) : super(key: key);

  final String? quoteNo;
  final String? quoteDate;
  final String? name;
  final String? orderAmount;
  final String? products;
  final String? status;

  @override
  _NewQuotesPageState createState() => _NewQuotesPageState();
}

class _NewQuotesPageState extends State<NewQuotesPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(UIDimens.size10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UIDimens.size10),
            ),
            color: UIColors.whiteColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Space(isSmall: true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: UIDimens.size20),
                      child: Row(
                        children: [
                          Text.rich(TextSpan(
                              text: StringResources.quoteNo.tr(context),
                              style: Styles.textStyle2,
                              children: [
                                TextSpan(
                                    text: StringResources.colon.tr(context),style: Styles.textStyle2)
                              ])),
                          const Space(isSmall: true),
                          Text(widget.quoteNo!,
                              style: Styles.textStyle2
                                  .copyWith(color: UIColors.greyColor)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _showDialog,
                      child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: UIDimens.size10),
                          child: Icon(
                            Icons.edit,
                          )),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: UIDimens.size20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text.rich(TextSpan(
                                text: StringResources.quoteDate.tr(context),
                                style: Styles.textStyle2,
                                children: [
                                  TextSpan(
                                      text: StringResources.colon.tr(context),style: Styles.textStyle2)
                                ])),
                            const Space(isSmall: true),
                            Text(widget.quoteDate!,
                                style: Styles.textStyle2
                                    .copyWith(color: UIColors.greyColor)),
                          ],
                        ),
                        Row(
                          children: [
                            Text.rich(TextSpan(
                                text: StringResources.name.tr(context),
                                style: Styles.textStyle2,
                                children: [
                                  TextSpan(
                                      text: StringResources.colon.tr(context),style: Styles.textStyle2)
                                ])),
                            const Space(isSmall: true),
                            Text(widget.name!,
                                style: Styles.textStyle2
                                    .copyWith(color: UIColors.greyColor)),
                          ],
                        ),
                        Row(
                          children: [
                            Text.rich(TextSpan(
                                text: StringResources.orderAmount.tr(context),
                                style: Styles.textStyle2,
                                children: [
                                  TextSpan(
                                      text: StringResources.colon.tr(context),style: Styles.textStyle2)
                                ])),
                            const Space(isSmall: true),
                            Text.rich(TextSpan(
                                text: StringResources.rupees.tr(context),
                                style: Styles.textStyle2
                                    .copyWith(color: UIColors.greyColor),
                                children: [
                                  TextSpan(
                                      text: widget.orderAmount!,
                                      style: Styles.textStyle2
                                          .copyWith(color: UIColors.greyColor))
                                ])),
                          ],
                        ),
                        Row(
                          children: [
                            Text.rich(TextSpan(
                                text: StringResources.product.tr(context),
                                style: Styles.textStyle2,
                                children: [
                                  TextSpan(
                                      text: StringResources.colon.tr(context),style: Styles.textStyle2)
                                ])),
                            const Space(isSmall: true),
                            Text(widget.products!,
                                style: Styles.textStyle2
                                    .copyWith(color: UIColors.greyColor)),
                          ],
                        ),
                        Row(
                          children: [
                            Text.rich(TextSpan(
                                text: StringResources.status.tr(context),
                                style: Styles.textStyle2,
                                children: [
                                  TextSpan(
                                      text: StringResources.colon.tr(context),style: Styles.textStyle2)
                                ])),
                            const Space(isSmall: true),
                            Text(widget.status!,
                                style: Styles.textStyle2
                                    .copyWith(color: UIColors.greyColor)),
                          ],
                        ),
                        const Space(
                          isSmall: true,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: UIDimens.size10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(UIDimens.size15),
                          color: UIColors.primaryColor),
                      child: TextButton(
                        child: Text(
                          StringResources.sendResponse.tr(context),
                          style: Styles.textBoldStyle
                              .copyWith(color: UIColors.bgColor),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                const Space(
                  isSmall: true,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _showDialog() async {
    await showDialog<String>(
      builder: (context) => _SystemPadding(
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(UIDimens.size16),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(StringResources.quoteAmount.tr(context)),
              Container(
                width: UIDimens.size65,
                height: UIDimens.size35,
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(UIDimens.size8),
                  border: Border.all(
                    color: UIColors.blackColor,
                    width: UIDimens.size2,
                  ),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(UIDimens.size5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(UIDimens.size5),
                    ),
                  ),
                  controller: _controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                ),
              )
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
                child: Text(
                  StringResources.cancel.tr(context),
                ),
                onPressed: () {}),
            ElevatedButton(
                child: Text(
                  StringResources.confirm.tr(context),
                ),
                onPressed: () {
                  // Navigator.pop(context);
                })
          ],
        ),
      ),
      context: context,
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget? child;

  const _SystemPadding({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
