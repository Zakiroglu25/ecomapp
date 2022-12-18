import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/category_tree.dart';
import '../model/response/product_option_model.dart';
import '../model/response/search_items.dart';
import '../model/response/status_dynamic.dart';

class CategoryProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic<List<CategoryTree>>> getCategoryTree() async {
    StatusDynamic<List<CategoryTree>> statusDynamic =
        StatusDynamic<List<CategoryTree>>();
    const api = ApiKeys.categoryTree;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final comeJson = response.data;
      List<CategoryTree> categoryTreeList =
          (response.data as List).map((e) => CategoryTree.fromJson(e)).toList();
      statusDynamic.data = categoryTreeList;
    } else {
      eeee("GetCategoryTree:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic> getAllManufacturers() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.getAllManufacturers;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final comeJson = response.data;
      SearchItems model = SearchItems.fromJson(comeJson);
      statusDynamic.data = model.products;
    } else {
      eeee("AllManufacturers List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }
}
