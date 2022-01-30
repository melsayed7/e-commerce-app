import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<List<ProductModel>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      return throw Exception('Failed to load products !');
    }
  }
}
