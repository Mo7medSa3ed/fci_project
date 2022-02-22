import 'package:fci_project/data/api_service/api.dart';

class UserRepository {
  static ApiServices? _apiServices;

  UserRepository() {
    _apiServices ??= ApiServices.getInstance()!;
  }

  Future addProductToFav(id) async {
    final res = await _apiServices!
        .post(url: '/users/fav', data: {"productId": id}, showAlert: false);
    return res;
  }

  Future getAllFavouriteProducts() async {
    final res =
        await _apiServices!.get(url: '/users/all/fav', showAlert: false);
    return res;
  }

  
}
