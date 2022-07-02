import 'package:dee_pee_ink/app/payment/address/billing_address.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/model/billing_address_response.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/app_snack_bar.dart';
import '../../../common_widgets/common_app_bar.dart';
import '../../../common_widgets/common_button.dart';
import '../../../common_widgets/common_textfield.dart';
import '../../../common_widgets/space.dart';
import '../../../constants/string_resources.dart';
import '../../../controllers/billingAddressController.dart';
import '../../../routing/route_constants.dart';
import '../../../routing/route_param_constants.dart';
import '../../../ui_utils/styles.dart';
import '../../../ui_utils/ui_colors.dart';
import '../../../ui_utils/ui_dimens.dart';

class AddNewBillingAddress extends StatefulWidget {
  const AddNewBillingAddress({Key? key}) : super(key: key);

  @override
  State<AddNewBillingAddress> createState() => _AddNewBillingAddressState();
}

class _AddNewBillingAddressState extends State<AddNewBillingAddress> {

  late BillingAddressController _billingAddressController;
  String? _chosenValue;

  final TextEditingController _controller = TextEditingController();
  var items = ['Billing', 'Shipping'];

  @override
  void initState() {
    _billingAddressController = BillingAddressController();
    _billingAddressController.addListener(_listener);
    _billingAddressController.init('', '', '', '', '', '', '',context);
    super.initState();
  }

  void _listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CommonAppBar(
                title: StringResources.addNewAddress.tr(context),
                automaticallyImplyLeading: true,
              ),
              Padding(
                padding: const EdgeInsets.all(UIDimens.size20),
                child: Column(
                  children: [
                    CommonTextField(
                      controller: _billingAddressController.addressLineController,
                      icon: Icons.home,
                      keyboardType: TextInputType.text,
                      maxLength: 50,
                      focusNode: FocusNode(),
                      labelText: StringResources.address.tr(context),
                      hintText: StringResources.addNewAddress.tr(context),
                    ),
                    const Space(
                      isSmall: true,
                    ),
                    CommonTextField(
                      controller: _billingAddressController.cityController,
                      maxLength: 30,
                      icon: Icons.home,
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      labelText: StringResources.town.tr(context),
                      hintText: StringResources.town.tr(context),
                    ),
                    const Space(
                      isSmall: true,
                    ),
                    CommonTextField(
                      controller: _billingAddressController.stateController,
                      maxLength: 30,
                      icon: Icons.home,
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      labelText: StringResources.state.tr(context),
                      hintText: StringResources.state.tr(context),
                    ),
                    const Space(
                      isSmall: true,
                    ),
                    CommonTextField(
                      controller: _billingAddressController.pinCodeController,
                      icon: Icons.fiber_pin_outlined,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      focusNode: FocusNode(),
                      labelText: StringResources.pinCode.tr(context),
                      hintText: StringResources.enterYourPINCode.tr(context),
                    ),
                    const Space(
                      isSmall: true,
                    ),
                    CommonTextField(
                      controller: _billingAddressController.countryController,
                      icon: Icons.home,
                      maxLength: 30,
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      labelText: StringResources.country.tr(context),
                      hintText: StringResources.country.tr(context),
                    ),
                    const Space(
                      isSmall: true,
                    ),
                    CommonTextField(
                      readOnly: true,
                      controller: _billingAddressController.addressTypeController,
                      icon: Icons.location_city_rounded,
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      labelText: StringResources.addressType.tr(context),
                      hintText: StringResources.billingOrShipping.tr(context),
                      // suffix: PopupMenuButton<String>(
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   onSelected: (String value) {
                      //     _billingAddressController.addressTypeController.text = value;
                      //   },
                      //   itemBuilder: (BuildContext context) {
                      //     return _billingAddressController.items.map<PopupMenuItem<String>>((String value) {
                      //       return  PopupMenuItem(padding: EdgeInsets.symmetric(horizontal: 50,),
                      //           child:  Text(value,style: Styles.textStyle), value: value
                      //       );
                      //     }).toList();
                      //   },
                      // ),
                    ),
                    const Space(
                      isSmall: true,
                    ),
                    CommonTextField(
                      controller: _billingAddressController.gstNumberController,
                      maxLength: 15,
                      icon: Icons.confirmation_number_rounded,
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      labelText: StringResources.gstNumber.tr(context),
                      hintText: StringResources.gstNumber.tr(context),
                    ),
                    _updateShippingAddress,
                    const Space(
                      isSmall: true,
                    ),
                    CommonButton(
                      text: StringResources.saveAddress.tr(context),
                      onPressed: () async {
                        if (_billingAddressController.isButtonEnabled) {
                          BillingAddressResponse? response = await _billingAddressController
                              .callCreateAddress(context);
                          if (response != null) {
                            Navigator.pushReplacementNamed(context,
                                RouteConstants.billingAddress,
                               );
                          }
                        } else {
                          String error = _billingAddressController.errorText();
                          AppSnackBar(
                              message: error,
                              color: Theme.of(context).errorColor)
                              .showAppSnackBar(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget get _updateShippingAddress => GestureDetector(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
            height: UIDimens.size25,
            width: UIDimens.size25,
            child: Theme(
              data: ThemeData(unselectedWidgetColor: UIColors.primaryColor),
              child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(UIDimens.size5),
                  ),
                  activeColor: UIColors.primaryColor,
                  value: _billingAddressController.sameAsBillingAddress,
                  onChanged: _billingAddressController.updateShippingAddress),
            )),
        const SizedBox(width: UIDimens.size5),
        Text(StringResources.sameForShippingAddress.tr(context),
            style: Styles.textStyle.copyWith(fontSize: UIDimens.size14))
      ]),
    ),
  );
}

