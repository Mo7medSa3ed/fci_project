import 'dart:convert';

import 'package:fci_project/data/models/user.dart';
import 'package:fci_project/data/repositories/auth_repository.dart';
import 'package:fci_project/helper/alert_dialog.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/helper/localstorage.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/home_screan/home_screan.dart';
import 'package:fci_project/presentation/screans/interests_screan/interests_screan.dart';
import 'package:fci_project/presentation/screans/login_screan/login_screan.dart';
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
      await LocalStorage.setString(token, response['token']);
      await LocalStorage.setString(user, jsonEncode(response['user']));
      tok = response['token'];
      isAuth = true;
      currantUser = User.fromJson(response['user']);
      if (currantUser.interests != null && currantUser.interests!.isNotEmpty) {
        Nav.goToScreanAndRemoveUntill(HomeScrean());
      } else {
        Nav.goToScreanAndRemoveUntill(InterestsScrean(showBack: false));
      }

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
      'phone': phone.startsWith('0') ? phone : '0' + phone,
      'country': country,
      'name': name
    };
    final newUser = await _authRepository.createUser(data);
    if (newUser != null) {
      await LocalStorage.setString(user, jsonEncode(newUser));
      currantUser = User.fromJson(newUser);
      Nav.goToScreanWithReplaceMent(LoginScrean());
      return;
    }
  }

  editUser(
      {required String email,
      required String name,
      required String phone,
      required String country,
      required String address,
      required String pass}) async {
    if (email.isEmpty || name.isEmpty || country.isEmpty || phone.isEmpty) {
      return;
    }
    User updatedUser = User(
      email: email,
      password: pass,
      phone: phone,
      country: country,
      address: address,
      name: name,
    );
    final res = await _authRepository.editUser(updatedUser.toJson());
    if (res != null) {
      currantUser = User.fromJson(res);
      await LocalStorage.setString(user, jsonEncode(currantUser.toJson()));
      Alert.showSuccessDialog(
        title: 'تعديل حسابك',
        desc: 'تم تعديل حسابك بنجاح',
        ontap: () => Nav.pop(),
      );

      return;
    }
  }

  Future<void> saveInterests(List<String> interests, bool isFromProfile) async {
    final res =
        await _authRepository.editUser(User.toJsonForSaveInterests(interests));
    if (res != null) {
      Alert.showSuccessDialog(
        title: 'تعديل اهتماماتك',
        desc: 'تم تعديل اهتماماتك بنجاح',
        ontap: () {
          Nav.pop();
          if (isFromProfile) {
            Nav.pop();
          } else {
            Nav.goToScreanAndRemoveUntill(HomeScrean());
          }
        },
      );
      return;
    }
  }
}
