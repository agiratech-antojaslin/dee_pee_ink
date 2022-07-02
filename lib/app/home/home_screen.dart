import 'package:badges/badges.dart';
import 'package:dee_pee_ink/app/authentication/login_screen.dart';
import 'package:dee_pee_ink/app/product_details/product_details_page.dart';
import 'package:dee_pee_ink/common_widgets/carousel/carousel_slider.dart';
import 'package:dee_pee_ink/common_widgets/common_icon.dart';
import 'package:dee_pee_ink/common_widgets/custom_chip.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/home_screen_controller.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:dee_pee_ink/utils/app_configuration.dart';
import 'package:dee_pee_ink/utils/app_preferences.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/carousel/feature_product_card.dart';
import '../../common_widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenController _controller;
  final _carousalController = CarouselController();

  @override
  void initState() {
    _controller = HomeScreenController();
    _controller.addListener(_listener);
    _controller.init(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    refreshOnly();
    super.didChangeDependencies();
  }

  void _listener() {
    setState(() {});
  }

  refreshOnly() async {
    print("refreshOnly");
    _controller.refreshCartCount();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: UIColors.bgColor,
          appBar: AppBar(
            backgroundColor: UIColors.bgColor,
            elevation: UIDimens.size2,
            iconTheme: const IconThemeData(color: Colors.black),
            actions: <Widget>[
              const Spacer(),
              CommonIcon(
                  path: Assets.search,
                  onPressed: () {
                    Navigator.pushNamed(context, RouteConstants.search);
                  }),
              _controller.cartCount == ""
                  ? CommonIcon(
                      path: Assets.cart,
                      onPressed: () {
                        Navigator.pushNamed(context, RouteConstants.cartDetails)
                            .then((val) {
                          val != null ? refreshOnly() : null;
                        });
                      })
                  : GestureDetector(
                      child: Badge(
                          badgeContent: Text(_controller.cartCount,
                              style:
                                  const TextStyle(color: UIColors.whiteColor)),
                          position: BadgePosition.bottomEnd(bottom: 1, end: 4),
                          badgeColor: UIColors.primaryColor,
                          child: CommonIcon(
                              path: Assets.cart,
                              onPressed: () {
                                Navigator.pushNamed(
                                        context, RouteConstants.cartDetails)
                                    .then((val) {
                                  val != null ? refreshOnly() : null;
                                });
                              })),
                      onTap: () {
                        Navigator.pushNamed(context, RouteConstants.cartDetails)
                            .then((val) {
                          val != null ? refreshOnly() : null;
                        });
                      }),
            ],
          ),
          drawer: _sideDrawer,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(UIDimens.size10),
                  child: _controller.featureProducts != null
                      ? Text(StringResources.findYourProducts.tr(context),
                          style: Styles.titleStyle)
                      : Container(),
                ),
                if (_controller.categories.isNotEmpty) _tabBar,
                Stack(clipBehavior: Clip.none, children: [
                  _controller.featureProducts != null
                      ? _bannerProducts
                      : Container(),
                  Positioned(
                    child: buildButtons,
                    right: 10,
                    left: 10,
                    bottom: 10,
                    top: 1,
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(UIDimens.size10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringResources.mostPopular.tr(context),
                          style: Styles.subTitleStyle),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                                  context, RouteConstants.allProducts)
                              .then((val) {
                            val != null ? refreshOnly() : null;
                          });
                          ;
                        },
                        child: Text(StringResources.seeAll.tr(context),
                            style: Styles.seeAllStyle),
                      ),
                    ],
                  ),
                ),
                _controller.featureProducts != null
                    ? _popularProducts
                    : _generateEmptyPage()
              ],
            ),
          )),
    );
  }

  Widget _generateEmptyPage() {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * UIDimens.padding75,
          // margin: const EdgeInsets.only(left: 30),
          decoration: const BoxDecoration(
              // color: Colors.grey[800],
              ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get buildButtons => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonIcon(
              size: 50,
              path: Assets.before,
              onPressed: () {
                _carousalController.nextPage();
              }),
          CommonIcon(
              size: 50,
              path: Assets.next,
              onPressed: () {
                _carousalController.previousPage();
              }),
        ],
      );

  Widget get _sideDrawer => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            if (_controller.profileDetail != null)
              DrawerHeader(
                decoration: const BoxDecoration(color: UIColors.primaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: UIDimens.size80),
                    Text(_controller.name,
                        style: Styles.subTitleStyle
                            .copyWith(color: UIColors.whiteColor)),
                    Text((_controller.profileDetail?.email)!,
                        style: Styles.textStyle
                            .copyWith(color: UIColors.whiteColor)),
                  ],
                ),
              ),
            ListTile(
              title: Text(StringResources.myAccount.tr(context),
                  style: Styles.textStyle2),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pushNamed(context, RouteConstants.accountDetails);
              },
            ),
            ListTile(
              title: Text(StringResources.myQuotes.tr(context),
                  style: Styles.textStyle2),
              leading: const Icon(Icons.shopping_basket_outlined),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pushNamed(context, RouteConstants.quotes).then((val) {
                  val != null ? refreshOnly() : null;
                });
                ;
              },
            ),
            ListTile(
              title: Text(StringResources.settings.tr(context),
                  style: Styles.textStyle2),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pushNamed(context, RouteConstants.settings);
              },
            ),
            ListTile(
              title: Text(StringResources.logout.tr(context),
                  style: Styles.textStyle2),
              leading: const Icon(Icons.logout),
              onTap: () async {
                AppConfiguration().setUserIsLoggedOut();

                await AppPreferences.setCurQuoteId("");
                await AppPreferences.setCartCount("");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              },
            ),
          ],
        ),
      );

  Widget get _popularProducts => SizedBox(
        height: MediaQuery.of(context).size.height * 0.30,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  id: (_controller.products[index].id as int))))
                      .then((val) {
                    val != null ? refreshOnly() : null;
                  });
                },
                child: ProductCard(_controller.products[index]));
          },
          itemCount: _controller.products.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      );

  Widget get _bannerProducts => CarouselSlider(
        carouselController: _carousalController,
        items: _controller.featureProducts!.data!.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetails(id: (i.product!.id as int))))
                        .then((val) {
                      val != null ? refreshOnly() : null;
                    });
                    ;
                  },
                  child: FeatureProductCard(i.product!));
              ;
            },
          );
        }).toList(),
        onLastItemScrolled: () async {},
        options: CarouselOptions(
            autoPlay: true,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            pauseAutoPlayOnManualNavigate: true,
            height: MediaQuery.of(context).size.height * 0.40,
            enlargeCenterPage: false,
            autoPlayInterval: const Duration(seconds: 3),
            enableInfiniteScroll: true,
            initialPage: 0,
            onPageChanged: (index, reason) async {}),
      );

  Widget get _tabBar => SizedBox(
        height: UIDimens.size70,
        child: ListView.builder(
          padding: const EdgeInsets.all(UIDimens.size10),
          scrollDirection: Axis.horizontal,
          itemCount: _controller.categories.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                CommonChip(
                    title: _controller.categories[index].name ?? "",
                    isEnabled: _controller.categories[index].isEnabled,
                    onPressed: () {
                      _controller.updateCategory(index);
                    }),
                const HorizontalSpace(
                  isSmall: true,
                ),
              ],
            );
          },
          shrinkWrap: true,
        ),
      );

  Widget _bannerProductCard(String imagePath, String title, String price) {
    return Column(
      children: [
        Expanded(
          child: Container(
              height: UIDimens.size230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(UIDimens.size20),
              ),
              padding: const EdgeInsets.all(UIDimens.size10),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ],
              )),
        ),
        const Space(
          isSmall: true,
        ),
        Text(
          title,
          style: Styles.textStyle2,
        ),
        const Space(
          isSmall: true,
        ),
        Text.rich(TextSpan(
            text: StringResources.approx.tr(context),
            style: Styles.textStyle3,
            children: [
              TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2),
              TextSpan(
                text: '\u{20B9}',
                style: Styles.textStyle.copyWith(fontSize: UIDimens.size18),
              ),
              TextSpan(
                  text: price,
                  style: Styles.textStyle3.copyWith(fontSize: UIDimens.size18)),
            ]))
      ],
    );
  }
}
