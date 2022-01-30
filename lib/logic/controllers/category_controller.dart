import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModel>[].obs;
  var isLoading = false.obs;
  var isAllCategories = false.obs;

  List<String> categoryImage = [
    "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
    getCategoryFromServices();
  }

  void getCategoryFromServices() async {
    var categoryName = await CategoryServices.getCategory();
    try {
      isLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isLoading(false);
    }
  }
  // this method for waiting data until loading
  getAllCategoryFromServices(String nameCategory) async {
    isAllCategories(true);
     categoryList.value = await AllCategoriesServices.getAllCategories(nameCategory);
    isAllCategories(false);
  }
 // this method for waiting load indexes until loading

  getCategoryIndex(int index) async {
    var categoryName =
    await getAllCategoryFromServices(categoryNameList[index]);

    if (categoryName.isNotEmpty) {
      categoryList.value = categoryName;
    }
  }
}
