import 'package:dee_pee_ink/app/payment/address_card.dart';
import 'package:dee_pee_ink/common_widgets/common_app_bar.dart';
import 'package:dee_pee_ink/common_widgets/common_button.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class ChangeAddress extends StatelessWidget {
  const ChangeAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CommonAppBar(
                title: StringResources.changeAddress.tr(context),
                automaticallyImplyLeading: true,
              ),
              const AddressCard(
                name: 'Rohan',
                flatNo: "30/6 R",
                streetName: 'virw 2nd street',
                city: 'Chennai',
                pinCode: '600003',
              ),
              const AddressCard(
                name: 'Kumar',
                flatNo: "7/10 A",
                streetName: 'mountain sea 5th street',
                city: 'Nagarkovil',
                pinCode: '629852',
              ),
              const AddressCard(
                name: 'Fazil',
                flatNo: "24/3 F",
                streetName: 'Ahimsapuram 3rd street extension',
                city: 'Madurai',
                pinCode: '625002',
              ),
              Padding(
                padding: const EdgeInsets.all(UIDimens.size20),
                child: CommonButton(
                  text: StringResources.addNew.tr(context),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
