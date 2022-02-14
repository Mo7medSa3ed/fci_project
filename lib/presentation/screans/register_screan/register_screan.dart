import 'package:fci_project/bussniss_logic/auth_provider.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/login_screan/login_screan.dart';

import 'package:fci_project/presentation/screans/register_screan/widgets/click_text.dart';
import 'package:fci_project/presentation/shared_widgets/app_logo.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_inputfield.dart';
import 'package:fci_project/presentation/shared_widgets/primary_round_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScrean extends StatefulWidget {
  const RegisterScrean({Key? key}) : super(key: key);

  @override
  _RegisterScreanState createState() => _RegisterScreanState();
}

class _RegisterScreanState extends State<RegisterScrean> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  late AuthProvider _pro;
  @override
  void initState() {
    _pro = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: kpadding, vertical: kpadding * 2),
          children: [
            AppLogo(),
            SizedBox(height: defultPadding * 4),
            PrimaryText(
              text: 'انشاء حساب',
              color: kblack,
              fontWeight: FontWeight.bold,
            ),
            PrimaryText(
              text: ' ادخل المطلوب بالاسفل للاستمرار',
              color: kgrey,
              fontSizeRatio: 0.8,
            ),
            SizedBox(height: defultPadding * 2),
            PrimaryInputField(
              controller: _nameController,
              hintText: 'ادخل اسم المستخدم',
              headerText: 'اسم المستخدم',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: defultPadding),
            Selector<AuthProvider, bool>(
                selector: (p0, p1) => p1.egyptSelected,
                builder: (ctx, egyptSelected, c) {
                  return Row(
                    children: [
                      Expanded(
                        child: PrimaryInputField(
                          controller: _phoneController,
                          hintText: 'ادخل رقم الهاتف',
                          headerText: 'رقم الهاتف',
                          max: egyptSelected ? 11 : 13,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(width: kpadding),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PrimaryRoundButton(
                            child: PrimaryText(text: '\u{1F1F8}\u{1F1E6}'),
                            borderColor: egyptSelected ? kwgrey : kprimary,
                            onTap: () => _pro.changeSelected(false),
                          ),
                          SizedBox(height: kpadding),
                          PrimaryRoundButton(
                            child: PrimaryText(text: '\u{1F1FE}\u{1F1EA}'),
                            borderColor: egyptSelected ? Colors.red : kwgrey,
                            onTap: () {
                              if (_phoneController.text.trim().length > 11) {
                                _phoneController.clear();
                              }
                              _pro.changeSelected(true);
                            },
                          ),
                        ],
                      )
                    ],
                  );
                }),
            SizedBox(height: defultPadding),
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
            SizedBox(height: defultPadding),
            ClickText(
              firstText: 'بالاستمرار انت توافق على',
              clickText: 'شروط الخدمة و سياسة الاستخدام',
              sizeRatio: 0.5,
              center: false,
            ),
            SizedBox(height: defultPadding * 2),
            PrimaryButton(
                text: 'انشاء حساب',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    _pro.register(
                        email: _emailController.text.trim(),
                        name: _nameController.text.trim(),
                        pass: _passController.text.trim(),
                        phone: _phoneController.text.trim(),
                        country: _pro.egyptSelected ? 'مصر' : 'السعودية');
                  }
                }),
            SizedBox(height: defultPadding / 1.5),
            ClickText(
              clickText: 'تسجيل',
              firstText: 'لديك حساب؟',
              sizeRatio: 0.7,
              onClick: () => Nav.goToScreanWithReplaceMent(LoginScrean()),
            )
          ],
        ),
      )),
    );
  }
}
