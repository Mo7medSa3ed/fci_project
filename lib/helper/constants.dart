import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String baseUrl = 'https://fci-proj.herokuapp.com/api';
const String storeName = "Sala";

// Error Messages
const generalErrorMsg = 'حدث خطأ ما. برجاء المحاولة لاحقا';
const serverNotResponsedErrorMsg = 'API not responded in time';
const noInternetErrorMsg = 'No Internet Connection !!';
const validateError = 'Error in api!!';

// time out Duration
const int timeOutDuration = 20000;

const String user = "user";
const String token = "token";
const String isFirst = "isFirst";
const String cart = "cart";

initSizeUtilsForApp(BoxConstraints boxConstraints) {
  kheight = boxConstraints.maxHeight;
  kweidth = boxConstraints.maxWidth;
  iconSize = (kweidth + kheight) / 100;
  isWeb = kweidth > 500 ? true : false;
  kpadding = isWeb ? 16.0 : 8.0;
}

setStatusColor({color, isDark = false}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color ?? kwhite,
    statusBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
  ));
}

List<Map> convertMapToList(Map data) {
  List<Map> convertedData = [];
  data.forEach((key, value) {
    convertedData.add({key: value});
  });
  return convertedData;
}

AppBar customAppBar(String title, {bool back = false}) {
  return AppBar(
      toolbarHeight: 50,
      centerTitle: true,
      backgroundColor: kwhite,
      automaticallyImplyLeading: back,
      iconTheme: IconThemeData(color: kblack),
      elevation: 0,
      title: PrimaryText(
        text: title,
        fontWeight: FontWeight.bold,
      ));
}
