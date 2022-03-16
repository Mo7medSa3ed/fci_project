import 'package:fci_project/data/api_service/api.dart';

class HomeRepository {
  static ApiServices? _apiServices;

  HomeRepository() {
    _apiServices ??= ApiServices.getInstance()!;
  }

  Future getHome() async {
    final res = await _apiServices!.get(url: '/home', showAlert: false);
    return res;
  }
}
