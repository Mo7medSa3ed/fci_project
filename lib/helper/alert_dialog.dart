import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/presentation/screans/login_screan/login_screan.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:fci_project/main.dart';

class Alert {
  static showLoading() {
    return CoolAlert.show(
      context: navKey.currentContext!,
      type: CoolAlertType.loading,
      loopAnimation: true,
      animType: CoolAlertAnimType.scale,
      text: "تحميل \nبرجاء الانتظار....",
    );
  }

  static showConfirmDialog({title, desc, onTap}) {
    return CoolAlert.show(
        context: navKey.currentContext!,
        type: CoolAlertType.warning,
        loopAnimation: true,
        animType: CoolAlertAnimType.scale,
        onConfirmBtnTap: onTap,
        confirmBtnText: 'نعم',
        barrierDismissible: false,
        cancelBtnText: 'لا',
        confirmBtnColor: kprimary,
        onCancelBtnTap: () => Nav.pop(),
        showCancelBtn: true,
        text: desc ?? '',
        title: title ?? '');
  }

  static showSuccessDialog({title, desc, ontap}) {
    return CoolAlert.show(
        context: navKey.currentContext!,
        type: CoolAlertType.success,
        loopAnimation: true,
        animType: CoolAlertAnimType.scale,
        showCancelBtn: false,
        cancelBtnText: 'الغاء',
        confirmBtnText: 'تم',
        onConfirmBtnTap: ontap,
        text: desc ?? '',
        title: title ?? '');
  }

  static showErrorDialog({title, desc}) {
    return CoolAlert.show(
      context: navKey.currentContext!,
      type: CoolAlertType.error,
      loopAnimation: true,
      animType: CoolAlertAnimType.scale,
      confirmBtnText: 'الغاء',
      title: title ?? 'خطأ',
      text: desc ?? 'حدث خطا فى شئ ما',
    );
  }

  static showSnackBar(String msg) {
    var snackBar = SnackBar(
        content: PrimaryText(
          text: msg,
          color: Colors.white,
        ),
        backgroundColor: kprimary);
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(snackBar);
  }

  static showAuthAlert() {
    return Alert.showConfirmDialog(
        title: 'تسجيل الدخول',
        desc: 'يجب عليك تسجيل الدخول اولاً',
        onTap: () => Nav.goToScreanAndRemoveUntill(const LoginScrean()));
  }
}
