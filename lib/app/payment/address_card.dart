import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    this.name,
    this.flatNo,
    this.city,
    this.pinCode,
    this.streetName,
  }) : super(key: key);

  final String? name;
  final String? flatNo;
  final String? streetName;
  final String? city;
  final String? pinCode;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: UIDimens.size20),
                      child: Text(name!, style: Styles.subTitleStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: UIDimens.size10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteConstants.changeAddress);
                          },
                          child: Text(
                            StringResources.change.tr(context),
                            style: Styles.textStyle3
                                .copyWith(color: UIColors.greyColor),
                          )),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: UIDimens.size20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          flatNo!,
                          style: Styles.textStyle,
                        ),
                        Text(
                          streetName!,
                          style: Styles.textStyle,
                        ),
                        Text(
                          city!,
                          style: Styles.textStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: UIDimens.size20),
                      child: Text(
                        pinCode!,
                        style: Styles.textStyle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: UIDimens.size10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteConstants.editAddress);
                            },
                            child: Text(
                              StringResources.editAddress.tr(context),
                              style: Styles.textStyle3
                                  .copyWith(color: UIColors.primaryColor),
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
