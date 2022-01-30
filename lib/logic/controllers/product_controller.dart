import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var favouriteList = <ProductModel>[].obs;
  var searchList = <ProductModel>[].obs;
  TextEditingController searchController = TextEditingController();
  var isLoading = true.obs;
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();

    List? storageShopping = storage.read<List>('isFavouritesList');
    if (storageShopping != null) {
      favouriteList =
          storageShopping.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProductFromServices();
  }

  void getProductFromServices() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // logic fav items screen
  Future<void> manageFavourites(int productId) async {
    var index = favouriteList.indexWhere((element) => element.id == productId);
    if (index >= 0) {
      favouriteList.removeAt(index);
      storage.remove('isFavouritesList');
    } else {
      favouriteList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write('isFavouritesList', favouriteList);
    }
  }

  bool isFavourite(int productId) {
    return favouriteList.any((element) => element.id == productId);
  }

  // logic search screen

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  void clearSearch()
  {
    searchController.clear();
    addSearchToList("");
  }
}
