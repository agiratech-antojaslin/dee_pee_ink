import 'package:dee_pee_ink/common_widgets/common_app_bar.dart';
import 'package:dee_pee_ink/common_widgets/common_button.dart';
import 'package:dee_pee_ink/common_widgets/common_textfield.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/editingAddressController.dart';
import 'package:dee_pee_ink/model/address_response.dart';
import 'package:dee_pee_ink/model/update_address_response.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/app_snack_bar.dart';
import '../../controllers/billingAddressController.dart';
import '../../routing/route_constants.dart';

class EditAddress extends StatefulWidget {
  // const EditAddress({Key? key, required this.billingAddress}) : super(key: key);
  // final Address1 billingAddress;

  const EditAddress({Key? key, required this.address}) : super(key: key);
  final Address1 address; // Get address object from route

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  late EditingAddressController _editingAddressController;


  @override
  void initState() {
    _editingAddressController = EditingAddressController();
    _editingAddressController.addListener(_listener);
    // _editingAddressController.init(widget.billingAddress,context);
    _editingAddressController.init(widget.address,context);
    super.initState();
  }
  void _listener() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    //print(widget.billingAddress.id);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CommonAppBar(
                title: StringResources.editAddress.tr(context),
                automaticallyImplyLeading: true,
              ),
              Padding(
                padding: const EdgeInsets.all(UIDimens.size20),
                child: Column(
                  children: [
                    CommonTextField(
                      controller: _editingAddressController.addressLineController,
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
                      controller: _editingAddressController.cityController,
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
                      controller: _editingAddressController.stateController,
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
                      controller: _editingAddressController.pinCodeController,
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
                      controller: _editingAddressController.countryController,
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
                      controller: _editingAddressController.addressTypeController,
                      maxLength: 30,
                      icon: Icons.location_city_rounded,
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      labelText: StringResources.addressType.tr(context),
                      hintText: StringResources.billingOrShipping.tr(context),
                    ),
                    const Space(
                      isSmall: true,
                    ),
                    CommonTextField(
                      controller: _editingAddressController.gstNumberController,
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
                        onPressed: () {
                          setState(()  {
                            print("Update address id " + widget.address.id.toString());
                            Future<bool> result = _editingAddressController
                                //.updateAddress(_editingAddressController.billingList[0].address!.id.toString());
                                .updateAddress(widget.address.id.toString()); // passing address id 
                            if (result == true) {
                              Navigator.pushNamed(
                                  context, RouteConstants.editAddress);
                            }
                            //print("BillingID " + widget.id.toString());
                          });
                        }
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
