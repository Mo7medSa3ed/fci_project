import 'package:fci_project/data/api_service/api.dart';
import 'package:fci_project/main.dart';

class AuthRepository {
  static ApiServices? _apiServices;

  AuthRepository() {
    _apiServices ??= ApiServices.getInstance()!;
  }

  Future loginUser(Map<String, dynamic> data) async {
    final res = await _apiServices!
        .post(url: '/users/auth', data: data, showAlert: true);
    return res;
  }

  Future createUser(Map<String, dynamic> data) async {
    final res =
        await _apiServices!.post(url: '/users', data: data, showAlert: true);
    return res;
  }

  Future editUser(Map<String, dynamic> data) async {
    final res = await _apiServices!
        .patch(url: '/users', id: currantUser.id, data: data, showAlert: true);
    return res;
  }
}
