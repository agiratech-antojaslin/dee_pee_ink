import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/controllers/shippingAddressController.dart';
import 'package:dee_pee_ink/model/biling_address_model.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/app_snack_bar.dart';
import '../../../common_widgets/common_icon.dart';
import '../../../constants/string_resources.dart';
import '../../../controllers/billingAddressController.dart';
import '../../../routing/route_constants.dart';
import '../../../ui_utils/assets.dart';
import '../../../ui_utils/styles.dart';
import '../../../ui_utils/ui_colors.dart';
import '../../../ui_utils/ui_dimens.dart';
import '../../../utils/app_preferences.dart';

class BillingAndShippingAddress extends StatefulWidget {
  const BillingAndShippingAddress({
    Key? key,
  }) : super(key: key);

  @override
  State<BillingAndShippingAddress> createState() =>
      _BillingAndShippingAddressState();
}

class _BillingAndShippingAddressState extends State<BillingAndShippingAddress>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
  }

  Future<void> _toggleTab() async {
    String billingID = await AppPreferences.getCurBillingAddress();
    if (billingID.isEmpty || billingID == "") {
      const AppSnackBar(message: "Choose Billing Address", color: Colors.red)
          .showAppSnackBar(context);
    } else {
      _tabIndex = _tabController!.index + 1;
      _tabController!.animateTo(_tabIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: <Widget>[
          DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: UIColors.bgColor,
              appBar: AppBar(
                backgroundColor: UIColors.bgColor,
                centerTitle: true,
                iconTheme: const IconThemeData(
                  color: UIColors.blackColor, //change your color here
                ),
                elevation: UIDimens.zero,
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: StringResources.billingAddress.tr(context),
                    ),
                    Tab(
                      text: StringResources.shippingAddress.tr(context),
                    ),
                  ],
                ),
                title: Text(StringResources.address.tr(context),
                    style: Styles.textBoldStyle
                        .copyWith(color: UIColors.greyColor)),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  BillingAddress(
                    onPressed: _toggleTab,
                  ),
                  ShippingAddress(),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({
    Key? key,
  }) : super(key: key);

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
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
    _shippingAddressController.init('', '', '', '', '', '', '', context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UIDimens.size15, vertical: UIDimens.size15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(UIDimens.size15),
              color: UIColors.primaryColor),
          child: TextButton(
              child: Text(
                StringResources.paymentMethod.tr(context),
                style: Styles.textBoldStyle.copyWith(color: UIColors.bgColor),
              ),
              onPressed: () {
                if (_shippingAddressController.curShippingID.isEmpty) {
                  const AppSnackBar(
                          message: "Choose Shipping Address", color: Colors.red)
                      .showAppSnackBar(context);
                } else {
                  _paymentDialog();
                }
                // Navigator.pushNamed(context, RouteConstants.checkOut);
              }),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
               return RadioListTile(
                 title: ShippingAddressCard(
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
               ),
                 activeColor: Colors.green,
                 value: index,
                 groupValue: selectedValue,
                 onChanged: (value) {
                   setState(() {
                     selectedValue = value as int;
                     print(selectedValue);
                     print(_shippingAddressController
                         .shippingList[value].address?.id);
                     _shippingAddressController.updateShippingAddressID(
                         _shippingAddressController
                             .shippingList[value].address?.id
                             .toString());
                   });
                 },
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
                          context, RouteConstants.addNewShippingAddress);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  refreshOnly() async {
    print("refreshOnly");
    _shippingAddressController.init('', '', '', '', '', '', '', context);
  }

  onPressedShippingDelete(String? Id) {
    print(Id);
  }

  _paymentDialog() {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text(
            "Choose Payment method",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return DropdownButton(
                hint: _dropDownValue == null
                    ? Text(
                        'Select Payment Type',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600]),
                      )
                    : Text(
                        _dropDownValue,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                // items: ['Cash on Delivery', 'Online Payment'].map(
                items: ['Offline Payment'].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(
                        val,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val.toString();
                    },
                  );
                },
              );
            },
          ),
          actions: <Widget>[
            ElevatedButton(
                child: const Text(
                  "Close",
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            ElevatedButton(
              child: const Text(
                "Place Order",
              ),
              onPressed: () async {
                print(_dropDownValue);
                if (_dropDownValue == null ||
                    _dropDownValue.toString() == " ") {
                  Navigator.of(context).pop();
                  const AppSnackBar(
                          message: "Select Payment method", color: Colors.red)
                      .showAppSnackBar(context);
                } else {
                  if (_dropDownValue == "Offline Payment") {
                    Navigator.of(context).pop();
                    const CircularProgressIndicator();
                    bool result =
                        await _shippingAddressController.updateOrderConifirm();
                    if (result) {
                      _paymentSuccessDialog();
                    }
                    // placeOrder();

                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  _paymentSuccessDialog() async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: const Text(
              "Order Confirmed",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return const Text("Your Offline payment will process by admin");
              },
            ),
            actions: <Widget>[
              ElevatedButton(
                  child: const Text(
                    "Ok",
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  changeValue(int val) {
    setState(() {
      selectedValue = val;
    });
  }
}

class BillingAddress extends StatefulWidget {
  const BillingAddress({Key? key, this.onPressed, this.address})
      : super(key: key);
  final VoidCallback? onPressed;
  final Address? address;

  @override
  State<BillingAddress> createState() => _BillingAddressState();
}

class _BillingAddressState extends State<BillingAddress> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UIDimens.size15, vertical: UIDimens.size15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(UIDimens.size15),
              color: UIColors.primaryColor),
          child: TextButton(
            child: Text(
              StringResources.next.tr(context),
              style: Styles.textBoldStyle.copyWith(color: UIColors.bgColor),
            ),
            onPressed: widget.onPressed,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: RadioListTile(
                  title: BillingAddressCard(
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
                  ),
                  activeColor: Colors.green,
                  value: index,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as int;
                      print(selectedValue);
                      print(_controller.billingList[value].address?.id);
                      _controller.updateBillingAddressID(_controller
                          .billingList[value].address?.id
                          .toString());
                    });
                  },
                ),
              );
            },
            itemCount: _controller.billingList.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
          )),
          // BillingAddressCard(
          //     pinCode: "600027",
          //     city: "Chennai",
          //     gstNumber: "04AABCU9603R1ZV",
          //     addressType: "Billing",
          //     state: "TN",
          //     addressLine: "2nd Street",
          //     country: "India"),
          //_updateShippingAddress,
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
                      context, RouteConstants.addNewBillingAddress),
                ),
              ],
            ),
          ),
        ],
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
  State<BillingAddressCard> createState() => _BillingAddressCardState();
}

class _BillingAddressCardState extends State<BillingAddressCard> {
  int selectedValue = 0;
  late BillingAddressController _billingAddressController;

  @override
  void initState() {
    super.initState();
    _billingAddressController = BillingAddressController();
    _billingAddressController.addListener(_listener);
    _billingAddressController.init('', '', '', '', '', '', '', context);
  }

  void _listener() {
    setState(() {});
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringResources.billingAddress.tr(context),style: Styles.textStyle3,),
                            CommonIcon(
                                path: Assets.edit,size: 20,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteConstants.editAddress,arguments: Address);
                                }),
                          ],
                        ),
                        Text(widget.addressLine!),
                        // Text(widget.addressLine!,),
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
                            //       // print(widget.id);
                            //       // Navigator.pushNamed(
                            //       //     context, RouteConstants.editAddress);
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
                                onPressed: () {
                                  _alertBox(context, widget.id.toString());
                                }),
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
                    await _billingAddressController.deleteAddress(id);
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
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringResources.shippingAddress.tr(context),style: Styles.textStyle3,),
                            CommonIcon(
                                path: Assets.edit,size: 20,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteConstants.editAddress,arguments: Address());
                                }),
                          ],
                        ),
                        Text(widget.addressLine!,),
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
                                onPressed: () {
                                  _alertBox(context, widget.id.toString());
                                }),
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
