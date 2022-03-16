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
  const RegisterScrean({this.edit = false, Key? key}) : super(key: key);
  final bool edit;
  @override
  _RegisterScreanState createState() => _RegisterScreanState();
}

class _RegisterScreanState extends State<RegisterScrean> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _passController = TextEditingController();
  late AuthProvider _pro;
  @override
  void initState() {
    _pro = Provider.of<AuthProvider>(context, listen: false);

    if (widget.edit) {
      _pro.egyptSelected = currantUser.country == 'مصر';
      _nameController.text = currantUser.name!;
      _phoneController.text = currantUser.phone!;
      _emailController.text = currantUser.email!;
    }
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
              horizontal: kpadding * 2, vertical: kpadding * 2),
          children: [
            AppLogo(),
            SizedBox(height: defultPadding * 2),
            PrimaryText(
              text: widget.edit ? 'تعديل حسابك' : 'انشاء حساب',
              color: kblack,
              fontWeight: FontWeight.bold,
            ),
            PrimaryText(
              text: widget.edit
                  ? 'عدل الذى تريده كما تشاء ...'
                  : ' ادخل المطلوب بالاسفل للاستمرار',
              color: kgrey,
              fontSizeRatio: 0.8,
            ),
            SizedBox(height: defultPadding * 2),
            PrimaryInputField(
              controller: _nameController,
              hintText: 'ادخل اسم المستخدم',
              headerText: 'اسم المستخدم',
              validator: (String? value) => null,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: defultPadding),
            Selector<AuthProvider, bool>(
                selector: (p0, p1) => p1.egyptSelected,
                builder: (ctx, egyptSelected, c) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: PrimaryInputField(
                          controller: _phoneController,
                          hintText: 'ادخل رقم الهاتف',
                          headerText: 'رقم الهاتف',
                          max: egyptSelected ? 10 : 13,
                          validator: (String? value) => null,
                          keyboardType: TextInputType.phone,
                          
                        ),
                      ),
                      SizedBox(width: kpadding),
                      PrimaryRoundButton(
                        child: PrimaryText(text: '\u{1F1FE}\u{1F1EA}'),
                        borderColor: egyptSelected ? Colors.red : kwgrey,
                      )
                    ],
                  );
                }),
            SizedBox(height: defultPadding),
            PrimaryInputField(
              controller: _emailController,
              hintText: 'ادخل البريدالإلكترونى',
              headerText: 'البريدالإلكترونى',
              validator: (String? value) => null,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: defultPadding),
            PrimaryInputField(
              controller: _addressController,
              hintText: 'ادخل العنوان',
              headerText: 'العنوان',
              validator: (String? value) => null,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: defultPadding),
            PrimaryInputField(
              controller: _passController,
              hintText: widget.edit
                  ? 'ادخل كلمةالسر الجديدة اذا اردت'
                  : 'ادخل كلمةالسر',
              headerText: widget.edit ? 'كلمةالسر الجديدة' : ' كلمةالسر',
              validator: (String? value) => null,
              isSecure: true,
            ),
            SizedBox(height: defultPadding),
            if (!widget.edit)
              ClickText(
                firstText: 'بالاستمرار انت توافق على',
                clickText: 'شروط الخدمة و سياسة الاستخدام',
                sizeRatio: 0.5,
                center: false,
              ),
            SizedBox(height: defultPadding * 2),
            PrimaryButton(
                text: widget.edit ? 'تعديل' : 'انشاء حساب',
                onTap: () async {
                  if (!widget.edit) {
                    if (formKey.currentState!.validate()) {
                      await _pro.register(
                          email: _emailController.text.trim(),
                          name: _nameController.text.trim(),
                          pass: _passController.text.trim(),
                          phone: _phoneController.text.trim(),
                          country: _pro.egyptSelected ? 'مصر' : 'السعودية');
                    }
                  } else {
                    await _pro.editUser(
                        address: _addressController.text.trim(),
                        email: _emailController.text.trim(),
                        name: _nameController.text.trim(),
                        pass: _passController.text.trim(),
                        phone: _phoneController.text.trim(),
                        country: _pro.egyptSelected ? 'مصر' : 'السعودية');
                  }
                }),
            SizedBox(height: defultPadding / 1.5),
            if (!widget.edit)
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
