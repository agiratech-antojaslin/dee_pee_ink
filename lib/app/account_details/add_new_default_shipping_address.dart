import 'package:dee_pee_ink/app/account_details/account_details.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/controllers/shippingAddressController.dart';
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
import '../../../ui_utils/ui_dimens.dart';

class AddNewDefaultShippingAddress extends StatefulWidget {
  const AddNewDefaultShippingAddress({Key? key}) : super(key: key);

  @override
  State<AddNewDefaultShippingAddress> createState() => _AddNewDefaultShippingAddress();
}

class _AddNewDefaultShippingAddress extends State<AddNewDefaultShippingAddress> {

  late ShippingAddressController _shippingAddressController;

  @override
  void initState() {
    _shippingAddressController = ShippingAddressController();
    _shippingAddressController.addListener(_listener);
    _shippingAddressController.init('', '', '', '', '', '', '',context);
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
                      controller: _shippingAddressController.addressLineController,
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
                      controller: _shippingAddressController.cityController,
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
                      controller: _shippingAddressController.stateController,
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
                      controller: _shippingAddressController.pinCodeController,
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
                      controller: _shippingAddressController.countryController,
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
                    CommonTextField(readOnly: true,
                      controller: _shippingAddressController.addressTypeController,
                      icon: Icons.location_city_rounded,
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      labelText: StringResources.addressType.tr(context),
                      hintText: StringResources.billingOrShipping.tr(context),
                      // suffix: PopupMenuButton<String>(
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   onSelected: (String value) {
                      //     _shippingAddressController.addressTypeController.text = value;
                      //   },
                      //   itemBuilder: (BuildContext context) {
                      //     return _shippingAddressController.items.map<PopupMenuItem<String>>((String value) {
                      //       return  PopupMenuItem(padding: EdgeInsets.symmetric(horizontal: 50,),
                      //           child:  Text(value,style: Styles.textStyle), value: value
                      //
                      //       );
                      //     }).toList();
                      //   },
                      // ),
                    ),
                    const Space(
                      isSmall: true,
                    ),
                    CommonTextField(
                      controller: _shippingAddressController.gstNumberController,
                      maxLength: 15,
                      icon: Icons.confirmation_number_rounded,
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      labelText: StringResources.gstNumber.tr(context),
                      hintText: StringResources.gstNumber.tr(context),
                    ),
                    const Space(
                      isSmall: true,
                    ),
                    CommonButton(
                      text: StringResources.saveAddress.tr(context),
                      onPressed: () async {
                        if (_shippingAddressController.isButtonEnabled) {
                          BillingAddressResponse? response = await _shippingAddressController
                              .callCreateAddress(context);
                          if (response != null) {
                            // Navigator.pushReplacementNamed(context,
                            //   RouteConstants.accountDetails,
                            // );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountDetails(activeTab: 1)));
              
                          }
                        } else {
                          String error = _shippingAddressController.errorText();
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
}
