import 'package:dee_pee_ink/model/address_response.dart';
import 'package:dee_pee_ink/model/billing_address_response.dart' as prefix;
import 'package:dee_pee_ink/model/success_response.dart';
import 'package:dee_pee_ink/repositories/address_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_widgets/app_snack_bar.dart';
import '../model/address_delete_body.dart';
import '../model/offline_payment_body.dart';
import '../model/offline_payment_response.dart';
import '../model/order_confirm_body.dart';
import '../model/order_confirm_response.dart';
import '../model/update_address_body.dart';
import '../model/update_address_response.dart';
import '../utils/app_preferences.dart';

class ShippingAddressController with ChangeNotifier {
  final TextEditingController _addressLineController = TextEditingController();
  TextEditingController get addressLineController => _addressLineController;

  final TextEditingController _cityController = TextEditingController();
  TextEditingController get cityController => _cityController;

  final TextEditingController _stateController = TextEditingController();
  TextEditingController get stateController => _stateController;

  final TextEditingController _pinCodeController = TextEditingController();
  TextEditingController get pinCodeController => _pinCodeController;

  final TextEditingController _countryController = TextEditingController();
  TextEditingController get countryController => _countryController;

  final TextEditingController _addressTypeController = TextEditingController();
  TextEditingController get addressTypeController => _addressTypeController;

  final TextEditingController _gstNumberController = TextEditingController();
  TextEditingController get gstNumberController => _gstNumberController;

  final AddressRepository _addressRepository = AddressRepository();

  final List<String> _items = ['Billing', 'Shipping'];
  List<String> get items => _items;

  bool _updateValue = false;
  bool get isButtonEnabled => _updateValue;

  List<Shipping> _shippingList = [];
  List<Shipping> get shippingList => _shippingList;
  String curShippingID = "";

  Future<bool> listShippingAddress() async {
    AddressResponse? response = await _addressRepository.listAddress(_context);
    if (response != null) {
      _shippingList = [];
      _shippingList = response.data?.shipping as List<Shipping>;
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateAddress(String addressId) async {
    UpdateAddressResponse? response = await _addressRepository.updateAddress(addressId,
        _context,
        UpdateAddressBody(address: UpdateAddress(
            addressLine1: _addressLineController.text,
            addressType: _addressTypeController.text,
            city: _cityController.text,
            gstNumber: _gstNumberController.text,
            postalCode: _pinCodeController.text,
            region: _countryController.text,
            state: _stateController.text),
          id: int.parse(addressId),
        ));
    if (response != null) {
      AppSnackBar(message: response.message.toString())
          .showAppSnackBar(_context!);
      init('', '', '', '', '', '', '', _context!);
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  bool _sameAsBillingAddress = false;
  bool get sameAsBillingAddress => _sameAsBillingAddress;


  updateShippingAddressID(String? id) async {
    curShippingID = id.toString();
    print("setShippingAddressID " + curShippingID);
  }

  Future<bool> updateOrderConifirm() async {
    String billingID = await AppPreferences.getCurBillingAddress();
    String orderID = await AppPreferences.getCurOrderId();
    print("orderID "+orderID.toString());
    print("setCurBillingAddress " + billingID.toString());
    print("setShippingAddressID " + curShippingID);
    if (orderID.isNotEmpty) {
      OrderConfirmResponse? response =
          await _addressRepository.orderConfirmation(
              orderID.toString(),
              _context,
              OrderConfirmBody(
                  billingAddressId: int.parse(billingID),
                  shippingAddressId: int.parse(curShippingID)));
      if (response != null) {
        OfflinePaymentResponse? responsePayment =
            await _addressRepository.offlinePayment(
                orderID.toString(),
                _context,
                OfflinePaymentBody(
                  id: int.parse(orderID.toString()),
                  paymentMethod: 2,
                ));
        if (responsePayment != null) {
          await AppPreferences.setCurBillingAddress("");
          await AppPreferences.setCurOrderId("");
          curShippingID = "";
          // AppSnackBar(message: responsePayment.message.toString())
          //     .showAppSnackBar(_context!);
          notifyListeners();
          return true;
        } else {
          notifyListeners();
          return false;
        }
      } else {
        notifyListeners();
        return false;
      }
    } else {
      const AppSnackBar(message: "OrderID is Empty", color: Colors.red)
          .showAppSnackBar(_context!);
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
      init('', '', '', '', '', '', '', _context!);
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<prefix.BillingAddressResponse?> callCreateAddress(
      BuildContext context) async {
    prefix.BillingAddressResponse? response =
        await _addressRepository.postCreateAddress(
            context,
            addressLineController.text,
            _cityController.text,
            _stateController.text,
            _pinCodeController.text,
            _countryController.text,
            _addressTypeController.text,
            _gstNumberController.text,sameAsBillingAddress);
    return response;
  }

  String errorText() {
    if (_addressLineController.text.isEmpty) {
      return 'please enter your address';
    } else if (_cityController.text.isEmpty) {
      return 'please enter your city';
    } else if (_stateController.text.isEmpty) {
      return 'please enter your state';
    } else if (_pinCodeController.text.isEmpty) {
      return 'please enter your pincode';
    } else if (_countryController.text.isEmpty) {
      return 'please enter your country';
    } else if (_addressTypeController.text.isEmpty) {
      return 'please enter your address type';
    } else if (_gstNumberController.text.isEmpty) {
      return 'please enter your GST number';
    }
    return '';
  }

  BuildContext? _context;

  void init(
      String? addressLine,
      String? city,
      String? state,
      String? pinCode,
      String? country,
      String? addressType,
      String? gstNumber,
      BuildContext context) async {
    _addressLineController.text = addressLine!;
    _cityController.text = city!;
    _stateController.text = state!;
    _pinCodeController.text = pinCode!;
    _countryController.text = country!;
    _addressTypeController.text = "Shipping";
    _gstNumberController.text = gstNumber!;
    _context = context;

    _addressLineController.addListener(() {
      _validateValues();
    });

    _cityController.addListener(() {
      _validateValues();
    });
    _stateController.addListener(() {
      _validateValues();
    });

    _pinCodeController.addListener(() {
      _validateValues();
    });
    countryController.addListener(() {
      _validateValues();
    });
    addressTypeController.addListener(() {
      _validateValues();
    });
    gstNumberController.addListener(() {
      _validateValues();
    });
    listShippingAddress();
  }

  _validateValues() {
    _updateValue = _addressLineController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _stateController.text.isNotEmpty &&
        _pinCodeController.text.isNotEmpty &&
        _countryController.text.isNotEmpty &&
        _addressTypeController.text.isNotEmpty &&
        _gstNumberController.text.isNotEmpty;
    notifyListeners();
  }
}
