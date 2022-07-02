import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/common_icon.dart';
import '../../../constants/string_resources.dart';
import '../../../ui_utils/assets.dart';

class ShippingAddressCard extends StatelessWidget {
  const ShippingAddressCard(
      {Key? key,
      this.addressLine,
      this.state,
      this.city,
      this.pinCode,
      this.country,
      this.addressType,
      this.gstNumber,
      this.onPressedDelete})
      : super(key: key);

  final String? addressLine;
  final String? state;
  final String? country;
  final String? city;
  final String? pinCode;
  final String? addressType;
  final String? gstNumber;
  final Function? onPressedDelete;

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
                        Text(addressLine!, style: Styles.textStyle3),
                        // Text(addressLine!,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(city!),
                            GestureDetector(
                                child: Text(
                                  StringResources.edit.tr(context),
                                  style: Styles.textStyle3
                                      .copyWith(color: UIColors.primaryColor),
                                ),
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, RouteConstants.editAddress);
                                }),
                          ],
                        ),
                        Text(
                          state!,
                        ),
                        Text(
                          pinCode!,
                        ),
                        Text(
                          country!,
                        ),
                        Text(
                          addressType!,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(gstNumber!),
                            CommonIcon(
                                path: Assets.bin,
                                onPressed: () {
                                  onPressedDelete;
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Align(
                //       alignment: Alignment.bottomRight,
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: UIDimens.size10),
                //         child: TextButton(
                //             onPressed: () {
                //               Navigator.pushNamed(
                //                   context, RouteConstants.editAddress);
                //             },
                //             child: Text(
                //               StringResources.editAddress.tr(context),
                //               style: Styles.textStyle3
                //                   .copyWith(color: UIColors.primaryColor),
                //             )),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
