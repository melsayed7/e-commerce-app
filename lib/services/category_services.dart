import 'package:e_commerce_app/model/category_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      return categoryModelFromJson(response.body);
    } else {
      return throw Exception('Failed to load products !');
    }
  }
}

class AllCategoriesServices
{
  static Future<List<ProductModel>> getAllCategories(String categoryNames) async {
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      return throw Exception('Failed to load products !');
    }
  }
}
