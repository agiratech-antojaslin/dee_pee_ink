import 'dart:io';

import 'package:dee_pee_ink/app/account_details/default_billing_address.dart';
import 'package:dee_pee_ink/app/account_details/default_shipping_address.dart';
import 'package:dee_pee_ink/common_widgets/common_app_bar.dart';
import 'package:dee_pee_ink/common_widgets/common_button.dart';
import 'package:dee_pee_ink/common_widgets/common_icon.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/my_address_controller.dart';
import 'package:dee_pee_ink/controllers/upload_image_controller.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../common_widgets/app_snack_bar.dart';
import '../../model/billing_address_list.dart';
import '../../model/billing_address_response.dart';
import '../../ui_utils/assets.dart';
import '../../utils/app_preferences.dart';
import '../payment/address/billing_address.dart';

class AccountDetails extends StatefulWidget {
  
  const AccountDetails({Key? key,this.billingAddress, required this.activeTab}) : super(key: key);

  final BillingAddressList? billingAddress;
  final int activeTab; // variable that holds active index 

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails>
    with SingleTickerProviderStateMixin{

  TabController? _tabController;
  late ProfileController _controller;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2,initialIndex: widget.activeTab); // sets the active index value to initial index
    _controller = ProfileController();
    _controller.init(context);
    _controller.addListener(() {
      setState(() {});
    });
  }

  Future<bool> _onBackPressed() async {
    Navigator.of(context).pop(true);
    print(true);
    return true;
  }

  // File? image;
  // final picker = ImagePicker();


  // Future pickImage(ImageSource source) async {
  //   final pickedFile = await picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     File? croppedFile = await ImageCropper().cropImage(
  //       sourcePath: pickedFile.path,
  //       aspectRatioPresets: [
  //         CropAspectRatioPreset.square,
  //         CropAspectRatioPreset.ratio3x2,
  //         CropAspectRatioPreset.original,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.ratio16x9
  //       ],
  //       androidUiSettings: AndroidUiSettings(
  //         toolbarTitle: StringResources.cropYourImageHere.tr(context),
  //         toolbarColor: UIColors.primaryColor,
  //         toolbarWidgetColor: Colors.white,
  //         activeControlsWidgetColor: UIColors.primaryColor,
  //         initAspectRatio: CropAspectRatioPreset.original,
  //         lockAspectRatio: false,
  //       ),
  //     );
  //     if (croppedFile != null) {
  //       setState(() {
  //         image = croppedFile;
  //       });
  //       _controller.upload(image!);
  //     }
  //   }
  // }


  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
        child: WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              CommonAppBar(automaticallyImplyLeading: true,
                  title: StringResources.myAccount.tr(context)),
              if(_controller.profileDetail!=null)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: UIDimens.size23),
                  child: Column(
                    children:  <Widget>[
                      SizedBox(height: UIDimens.size10),
                      Text((_controller.profileDetail?.fullName)!, style: Styles.subTitleStyle),
                      Text((_controller.profileDetail?.email)!, style: Styles.textStyle),
                    ],
                  ),
                ),
              _tabSelection(context),

            ],
          ),
      ),
    ),
        )
      // child: Scaffold(
      //   backgroundColor: UIColors.bgColor,
      //   body: SingleChildScrollView(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         CommonAppBar(
      //           title: (StringResources.myAccount.tr(context)),
      //           automaticallyImplyLeading: true,
      //         ),
              // Center(
              //   child: Stack(
              //     children: <Widget>[
              //       CircleAvatar(
              //         radius: UIDimens.size55,
              //         backgroundColor: Colors.transparent,
              //         child: Padding(
              //           padding: const EdgeInsets.all(UIDimens.size10),
              //           child: image != null
              //               ? ClipOval(
              //                   child: Image.file(
              //                   image!,
              //                   width: UIDimens.size160,
              //                   height: UIDimens.size160,
              //                   fit: BoxFit.cover,
              //                 ))
              //               : Image.asset("assets/temp/person-profile.png"),
              //         ),
              //       ),
              //       Positioned(
              //         bottom: UIDimens.size20,
              //         right: UIDimens.size20,
              //         child: InkWell(
              //           onTap: () {
              //             showModalBottomSheet(
              //                 context: context,
              //                 builder: ((builder) => Column(
              //                       mainAxisSize: MainAxisSize.min,
              //                       children: [
              //                         ListTile(
              //                             leading: const Icon(Icons.camera_alt),
              //                             title: Text(StringResources.camera
              //                                 .tr(context)),
              //                             onTap: () =>
              //                                 pickImage(ImageSource.camera)),
              //                         ListTile(
              //                           leading: const Icon(Icons.image),
              //                           title: Text(StringResources.gallery
              //                               .tr(context)),
              //                           onTap: () =>
              //                               pickImage(ImageSource.gallery),
              //                         ),
              //                       ],
              //                     )));
              //           },
              //           child: const Icon(
              //             Icons.camera_alt,
              //             color: UIColors.greyColor,
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),

              //const Space(),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: UIDimens.size20),
              //   child: Row(
              //     children: [
              //       Text(
              //         StringResources.defaultAddress.tr(context),
              //         style: Styles.textStyle3,
              //       ),
              //     ],
              //   ),
              // ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget _tabSelection(BuildContext context){
    print(
        'Current Index: ${DefaultTabController.of(context)?.index}');
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: StringResources.billingAddress.tr(context),
              ),
              Tab(
                text: StringResources.shippingAddress.tr(context),
              ),
            ],
          ),),
          Container(
            height: MediaQuery.of(context).size.height/1.2,
            child: TabBarView(
                controller: _tabController,
                children: [
                  MyBillingAddress(),
                  MyShippingAddress(),
                ],
              ),
          ),
        ],
      ),
      );
  }
}