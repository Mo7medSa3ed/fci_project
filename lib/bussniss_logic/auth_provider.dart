import 'dart:convert';

import 'package:fci_project/data/repositories/auth_repository.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/helper/localstorage.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/presentation/screans/home_screan/home_screan.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final _authRepository = AuthRepository();
  bool egyptSelected = true;

  changeSelected(selected) {
    egyptSelected = selected;
    notifyListeners();
  }

  login({required String email, required String pass}) async {
    if (email.isEmpty || pass.isEmpty) return;
    Map<String, dynamic> data = {'email': email, 'password': pass};
    final response = await _authRepository.loginUser(data);
    if (response != null) {
      await LocalStorage.setString(token, jsonEncode(response['token']));
      await LocalStorage.setString(user, jsonEncode(response['user']));
      Nav.goToScreanAndRemoveUntill(HomeScrean());
      return;
    }
  }

  register(
      {required String email,
      required String name,
      required String phone,
      required String country,
      required String pass}) async {
    if (email.isEmpty ||
        pass.isEmpty ||
        name.isEmpty ||
        country.isEmpty ||
        phone.isEmpty) return;
    Map<String, dynamic> data = {
      'email': email,
      'password': pass,
      'phone': phone,
      'country': country,
      'name': name
    };
    final user = await _authRepository.createUser(data);
    if (user != null) {
      await LocalStorage.setString(user, jsonEncode(user));
      Nav.goToScreanAndRemoveUntill(HomeScrean());
      return;
    }
  }
}
