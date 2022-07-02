import 'package:dee_pee_ink/app/account_details/account_details.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/controllers/editingAddressController.dart';
import 'package:dee_pee_ink/routing/route_param_constants.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/common_icon.dart';
import '../../constants/string_resources.dart';
import '../../controllers/billingAddressController.dart';
import '../../model/address_response.dart';
import '../../routing/route_constants.dart';
import '../../ui_utils/assets.dart';
import '../../ui_utils/styles.dart';
import '../../ui_utils/ui_colors.dart';
import '../../ui_utils/ui_dimens.dart';

class MyBillingAddress extends StatefulWidget {
  const MyBillingAddress({Key? key, this.address})
      : super(key: key);
  final Billing? address;

  @override
  State<MyBillingAddress> createState() => _MyBillingAddress();
}

class _MyBillingAddress extends State<MyBillingAddress> {
  late BillingAddressController _controller;
  int selectedValue = -1;

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = BillingAddressController();
    _controller.addListener(_listener);
    _controller.init('', '', '', '', '', '', '', context);
  }

  Future<bool> _onBackPressed() async {
    Navigator.of(context).pop(true);
    print(true);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height/1.4, 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BillingAddressCard(
                        addressLine:
                        _controller.billingList[index].address?.addressLine1!,
                        city: _controller.billingList[index].address?.city,
                        pinCode:
                        _controller.billingList[index].address?.postalCode,
                        state: _controller.billingList[index].address?.state!,
                        addressType:
                        _controller.billingList[index].address?.addressType,
                        country: _controller.billingList[index].address?.region,
                        gstNumber:
                        _controller.billingList[index].address?.gstNumber,
                        id: _controller.billingList[index].address?.id.toString(),
                       
                      );
                    },
                    itemCount: _controller.billingList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      child: Text(
                        StringResources.addNewAddress.tr(context),
                        style: Styles.textBoldStyle
                            .copyWith(color: UIColors.primaryColor),
                      ),
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConstants.addNewDefaultBillingAddress),
                    ),
                  ],
                ),
              ),
              // BillingAddressCard(
              //     pinCode: "600027",
              //     city: "Chennai",
              //     gstNumber: "04AABCU9603R1ZV",
              //     addressType: "Billing",
              //     state: "TN",
              //     addressLine: "2nd Street",
              //     country: "India"),
              //_updateShippingAddress,
            ],
          ),
        ),
      ),
    );
  }

  changeValue(int val) {
    setState(() {
      selectedValue = val;
    });
  }

  onPressedBillingDelete(String? Id) {
    print(Id);
  }

// Widget get _updateShippingAddress => GestureDetector(
//   child: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 15.0),
//     child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//       SizedBox(
//           height: UIDimens.size25,
//           width: UIDimens.size25,
//           child: Theme(
//             data: ThemeData(unselectedWidgetColor: UIColors.primaryColor),
//             child: Checkbox(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(UIDimens.size5),
//                 ),
//                 activeColor: UIColors.primaryColor,
//                 value: _controller.sameAsBillingAddress,
//                 onChanged: _controller.updateShippingAddress),
//           )),
//       const SizedBox(width: UIDimens.size5),
//       Text(StringResources.sameForShippingAddress.tr(context),
//           style: Styles.textStyle.copyWith(fontSize: UIDimens.size14))
//     ]),
//   ),
// );
}

class BillingAddressCard extends StatefulWidget {
  const BillingAddressCard({
    Key? key,
    this.addressLine,
    this.state,
    this.city,
    this.pinCode,
    this.country,
    this.addressType,
    this.gstNumber,
    this.id,
    this.onEdit,
  }) : super(key: key);

  final String? addressLine;
  final String? state;
  final String? country;
  final String? city;
  final String? pinCode;
  final String? addressType;
  final String? gstNumber;
  final String? id;
  final Function? onEdit;

  @override
  State<BillingAddressCard> createState() => _BillingAddressCardState();
}

class _BillingAddressCardState extends State<BillingAddressCard> {
  int selectedValue = 0;
  late BillingAddressController _billingAddressController;
  //late EditingAddressController _editingAddressController;

  @override
  void initState() {
    super.initState();
    _billingAddressController = BillingAddressController();
    _billingAddressController.addListener(_listener);
    _billingAddressController.init('', '', '', '', '', '', '', context);
    print("refresh");
  }

  void _listener() {
    setState(() {});
  }

  refreshOnly() async {
    print("refreshOnly");
    _billingAddressController.addListener(_listener);
    _billingAddressController.init('', '', '', '', '', '', '', context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: UIDimens.size20, vertical: UIDimens.size10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringResources.billingAddress.tr(context),style: Styles.textStyle3,),
                            CommonIcon(
                                path: Assets.edit,size: 20,
                                onPressed: () {
                                  //widget.onEdit;
                                  var billingAddress = Address1(id: int.parse(widget.id!), addressLine1: widget.addressLine, city: widget.city, postalCode: widget.pinCode, state: widget.state, region: widget.country, alternateContactNumber: "", addressType: widget.addressType, gstNumber: widget.gstNumber, isDefault: false); // billing address object
                                  Navigator.pushNamed(
                                      context, RouteConstants.editAddress,arguments: {"address": billingAddress}); // passing address object through route
                                }),
                          ],
                        ),
                        Text(widget.addressLine!,),
                        // Text(widget.addressLine!,),
                        Text(widget.city!),

                        Text(
                          widget.state!,
                        ),
                        Text(
                          widget.pinCode!,
                        ),
                        Text(
                          widget.country!,
                        ),
                        Text(
                          widget.addressType!,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.gstNumber!),
                            CommonIcon(
                                path: Assets.bin,
                              onPressed: () async {
                                _alertBox(context, widget.id.toString());
                                //refreshOnly();
                              },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _alertBox(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Confirm"),
              content: Text("Delete Address"),
              actions: <Widget>[
                TextButton(
                  child: Text("yes"),
                  onPressed: () async {
                    await _billingAddressController.deleteAddress(id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountDetails(activeTab: 0,))) // Added active index param to the route
                        .then((val) => val ? refreshOnly() : null);
                  },
                ),
                TextButton(
                    child: Text("no"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }
}
