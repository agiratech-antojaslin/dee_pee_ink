import 'dart:convert';

import 'package:dee_pee_ink/common_widgets/app_snack_bar.dart';
import 'package:dee_pee_ink/model/feature_product_response.dart';
import 'package:dee_pee_ink/model/product_details_response.dart';
import 'package:dee_pee_ink/model/product_filter.dart';
import 'package:dee_pee_ink/model/product_list_response.dart';
import 'package:dee_pee_ink/model/category_response.dart' as categoryResponse;
import 'package:dee_pee_ink/utils/api_config.dart';
import 'package:dee_pee_ink/utils/app_constants.dart';
import 'package:dee_pee_ink/web_service/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/category_response.dart';

class ProductsRepository {
  final WebserviceHelper _webserviceHelper = WebserviceHelper();

  Future<List<Products>> fetchProductList(context, ProductFilter filter) async {
    Map<String, dynamic> jsonData = await _webserviceHelper.post(
        ApiConfig.baseUrl + ApiConstants.productsList,
        body: filter.toJson());
    ProductListResponse response = ProductListResponse.fromJson(jsonData);
    print(response.data?.products?.length.toString());
    return response.data?.products ?? [];
  }

  Future<List<categoryResponse.Categories>?> fetchCategoriesList(context) async {
    debugPrint(ApiConstants.categoriesList);
    debugPrint("category ${ApiConfig.baseUrl + ApiConstants.categoriesList}");
    Map<String, dynamic> jsonData = await _webserviceHelper.get(
      ApiConfig.baseUrl + ApiConstants.categoriesList,
      onError: (bool) {
        return [];
      },
    );
    CategoryResponse response = CategoryResponse.fromJson(jsonData);
    List<categoryResponse.Categories> list = response.data![0].product?.categories??[];
    list.insert(
        0,
        categoryResponse.Categories(
            id: 0, isActive: true, name: "ALL", isEnabled: true));
    print(response.data?.length.toString());
    return response.data![0].product?.categories??[];
  }

  Future<ProductDetailResponse?> getProductDetails(context, String id) async {
    String finalUrl = ApiConfig.baseUrl + ApiConstants.productsDetail + id;
    print("ProductDetailurl " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.get(finalUrl, onError: (bool) {});
    ProductDetailResponse response = ProductDetailResponse.fromJson(jsonData);
    print(response.data?.toString());
    if (response.code == WebserviceHelper.successErrorProductDetailStatusCode) {
      return response;
    } else {
      ProductDetailErrorResponse response =
          ProductDetailErrorResponse.fromJson(jsonData);
      if (response.code == WebserviceHelper.errorProductDetailStatusCode) {
        AppSnackBar(
                message: response.message.toString(),
                color: Theme.of(context).errorColor)
            .showAppSnackBar(context);
      }

      return null;
    }
  }

  Future<FeatureProductResponse?> getFeaturedProduct(context) async {
    String finalUrl = ApiConfig.baseUrl + ApiConstants.featuredProducts ;
    print("FeaturedProducts " + finalUrl);
    Map<String, dynamic> jsonData =
    await _webserviceHelper.get(finalUrl, onError: (bool) {});
    FeatureProductResponse response = FeatureProductResponse.fromJson(jsonData);
    print(response.data?.toString());
    if (response.code == WebserviceHelper.featureProductSuccessCode) {
      return response;
    }
      return null;
  }
}


