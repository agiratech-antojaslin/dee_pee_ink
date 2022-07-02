//import 'package:connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../common_widgets/app_snack_bar.dart';

class NetworkCheck {
  Future<bool> check() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<void> checkNetworkAndShowSnackBar(BuildContext context) async {
    bool isNetWorkAvailable = await check();
    if (!isNetWorkAvailable) {
      AppSnackBar(
          message:
              "Translations.of(context)?.text(StringResources.checkYourInternetConnection)",
          actionText: "Translations.of(context)?.text(StringResources.ok)",
          onPressed: () => {}).showAppSnackBar(context);
    }
  }

  void showNoInternetMessage(BuildContext context) {
    AppSnackBar(
        message:
            "Translations.of(context)?.text(StringResources.checkYourInternetConnection)",
        actionText: "Translations.of(context)?.text(StringResources.ok)",
        onPressed: () => {}).showAppSnackBar(context);
  }
}
