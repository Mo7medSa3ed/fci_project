import 'package:fci_project/data/api_service/api.dart';

class ProductRepository {
  static ApiServices? _apiServices;

  ProductRepository() {
    _apiServices ??= ApiServices.getInstance()!;
  }

  Future getOneOrAllCategories({id}) async {
    final res =
        await _apiServices!.get(url: '/categories', id: id, showAlert: false);
    return res;
  }
  

  Future getOneOrAllProducts({id}) async {
    final res =
        await _apiServices!.get(url: '/products', id: id, showAlert: false);
    return res;
  }

  Future searchProduct(String term) async {
    final res = await _apiServices!
        .get(url: '/products/filter/name?text=$term', showAlert: false);
    return res;
  }

  Future searchProductByCategory(String term) async {
    final res = await _apiServices!.get(
        url: '/products/filter/category?categoryId=$term', showAlert: false);
    return res;
  }
  Future getProductsByTerm(String term) async {
    final res = await _apiServices!.get(
        url: '/products/filter/home?sort=$term', showAlert: false);
    return res;
  }

  Future rateProduct(String id, Map<String, dynamic> data) async {
    final res = await _apiServices!
        .post(url: '/products/rate', id: id, data: data, showAlert: true);
    return res;
  }

  
}
