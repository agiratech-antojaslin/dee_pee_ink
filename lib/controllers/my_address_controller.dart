import 'package:dee_pee_ink/model/billing_address_response.dart' as prefix;
import 'package:dee_pee_ink/repositories/address_repository.dart';
import 'package:flutter/cupertino.dart';

import '../common_widgets/app_snack_bar.dart';
import '../model/address_delete_body.dart';
import '../model/address_response.dart';
import '../model/success_response.dart';
import '../utils/app_preferences.dart';

class MyAddressController with ChangeNotifier {

  final AddressRepository _addressRepository = AddressRepository();

  List<Billing> _billingList = [];
  List<Billing> get billingList => _billingList;


  Future<bool> listAddress() async {
    AddressResponse? response = await _addressRepository.listAddress(_context);
    if (response != null) {
      _billingList = [];
      _billingList = response.data?.billing as List<Billing>;
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }
  Future<bool> deleteAddress(String addressId) async {
    SuccessResponse? response = await _addressRepository.deleteAddress(
        _context,
        AddressDeleteBody(
          addressId: int.parse(addressId),
        ));
    if (response != null) {
      AppSnackBar(message: response.message.toString())
          .showAppSnackBar(_context!);
      init(_context!);
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  BuildContext? _context;

  void init(
      BuildContext context) async {
    _context = context;
    listAddress();
    await AppPreferences.setCurBillingAddress("");
  }

  updateBillingAddressID(String? id) async {
    await AppPreferences.setCurBillingAddress(id.toString());
    print("setCurBillingAddress " + id.toString());
  }
}
