import 'dart:ui';

import 'package:dee_pee_ink/app/account_details/account_details.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/app_snack_bar.dart';
import '../../common_widgets/common_icon.dart';
import '../../constants/string_resources.dart';
import '../../controllers/shippingAddressController.dart';
import '../../model/address_response.dart';
import '../../routing/route_constants.dart';
import '../../ui_utils/assets.dart';
import '../../ui_utils/styles.dart';
import '../../ui_utils/ui_colors.dart';
import '../../ui_utils/ui_dimens.dart';

class MyShippingAddress extends StatefulWidget {
  const MyShippingAddress({
    Key? key,
  }) : super(key: key);

  @override
  State<MyShippingAddress> createState() => _MyShippingAddress();
}

class _MyShippingAddress extends State<MyShippingAddress> {
  late ShippingAddressController _shippingAddressController;
  int selectedValue = -1;
  String _dropDownValue = " ";

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _shippingAddressController = ShippingAddressController();
    _shippingAddressController.addListener(_listener);
    _shippingAddressController.init(
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height/1.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ShippingAddressCard(
                      addressLine: _shippingAddressController
                          .shippingList[index].address?.addressLine1!,
                      city: _shippingAddressController
                          .shippingList[index].address?.city,
                      pinCode: _shippingAddressController
                          .shippingList[index].address?.postalCode,
                      state: _shippingAddressController
                          .shippingList[index].address?.state!,
                      addressType: _shippingAddressController
                          .shippingList[index].address?.addressType,
                      country: _shippingAddressController
                          .shippingList[index].address?.region,
                      gstNumber: _shippingAddressController
                          .shippingList[index].address?.gstNumber,
                      id: _shippingAddressController
                          .shippingList[index].address?.id
                          .toString(),
                    );
                  },
                  itemCount: _shippingAddressController.shippingList.length,
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
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RouteConstants.addNewDefaultShippingAddress);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onPressedShippingDelete(String? Id) {
    print(Id);
  }
}


class ShippingAddressCard extends StatefulWidget {
  const ShippingAddressCard({
    Key? key,
    this.addressLine,
    this.state,
    this.city,
    this.pinCode,
    this.country,
    this.addressType,
    this.gstNumber,
    this.id,
  }) : super(key: key);

  final String? addressLine;
  final String? state;
  final String? country;
  final String? city;
  final String? pinCode;
  final String? addressType;
  final String? gstNumber;
  final String? id;
  @override
  State<ShippingAddressCard> createState() => _ShippingAddressCardState();
}

class _ShippingAddressCardState extends State<ShippingAddressCard> {
  late ShippingAddressController _shippingAddressController;
  int selectedValue = 0;

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _shippingAddressController = ShippingAddressController();
    _shippingAddressController.addListener(_listener);
    _shippingAddressController.init('', '', '', '', '', '', '', context);
  }

  refreshOnly() async {
    _shippingAddressController. init('', '', '', '', '', '', '', context);
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
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringResources.shippingAddress.tr(context),style: Styles.textStyle3,),
                            CommonIcon(
                                path: Assets.edit,size: 20,
                                onPressed: () {
                                  var address = Address1(id: int.parse(widget.id!), addressLine1: widget.addressLine, city: widget.city, postalCode: widget.pinCode, state: widget.state, region: widget.country, alternateContactNumber: "", addressType: widget.addressType, gstNumber: widget.gstNumber, isDefault: false); // shipping address object
                                  Navigator.pushNamed(
                                      context, RouteConstants.editAddress,arguments: {"address": address}); // passing address object through route
                                }),
                          ],
                        ),
                        Text(widget.addressLine!,),
                        // Text(addressLine!,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.city!),
                            // GestureDetector(
                            //     child: Text(
                            //       StringResources.edit.tr(context),
                            //       style: Styles.textStyle3
                            //           .copyWith(color: UIColors.primaryColor),
                            //     ),
                            //     onTap: () {
                            //       print(widget.id);
                            //       // Navigator.pushNamed(
                            //       //     context, RouteConstants.eitAddress);
                            //     }),
                          ],
                        ),
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
                                await _shippingAddressController.deleteAddress(widget.id.toString()).then((value) =>  {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AccountDetails(activeTab: 1))) // Added active index param to the route
                                      .then((val) {
                                    debugPrint("refresh");
                                    val != null? refreshOnly():Navigator.of(context).pop(true);
                                  })
                                });
                                
                                //Navigator.of(context).pop(true);
                               
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
                    Navigator.pop(context);
                    await _shippingAddressController.deleteAddress(id);
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
