import 'package:fci_project/bussniss_logic/auth_provider.dart';
import 'package:fci_project/main.dart';

import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/presentation/screans/register_screan/register_screan.dart';
import 'package:fci_project/presentation/screans/register_screan/widgets/click_text.dart';
import 'package:fci_project/presentation/shared_widgets/app_logo.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_inputfield.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScrean extends StatefulWidget {
  const LoginScrean({Key? key}) : super(key: key);

  @override
  _LoginScreanState createState() => _LoginScreanState();
}

class _LoginScreanState extends State<LoginScrean> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.symmetric(
            horizontal: kpadding * 2, vertical: kpadding * 2),
        children: [
          AppLogo(),
          SizedBox(height: defultPadding * 4),
          PrimaryText(
            text: 'تسجيل الدخول',
            color: kblack,
            fontWeight: FontWeight.bold,
          ),
          PrimaryText(
            text: 'ادخل البريدالإلكترونى الخاص بك و كلمةالسر',
            color: kgrey,
            fontSizeRatio: 0.8,
          ),
          SizedBox(height: defultPadding * 2),
          Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryInputField(
                  controller: _emailController,
                  hintText: 'ادخل البريدالإلكترونى',
                  headerText: 'البريدالإلكترونى',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: defultPadding),
                PrimaryInputField(
                  controller: _passController,
                  hintText: 'ادخل كلمةالسر',
                  headerText: 'كلمةالسر',
                  isSecure: true,
                ),
              ],
            ),
          ),
          SizedBox(height: defultPadding * 3),
          PrimaryButton(
              text: 'تسجيل الدخول',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  Provider.of<AuthProvider>(context, listen: false).login(
                      email: _emailController.text.trim(),
                      pass: _passController.text.trim());
                }
              }),
          SizedBox(height: defultPadding / 1.5),
          ClickText(
            clickText: 'تسجيل حساب',
            firstText: 'ليس لديك حساب؟',
            sizeRatio: 0.7,
            onClick: () => Nav.goToScreanWithReplaceMent(RegisterScrean()),
          )
        ],
      )),
    );
  }
}
