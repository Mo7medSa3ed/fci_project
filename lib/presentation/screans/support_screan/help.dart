import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/helper/alert_dialog.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_image.dart';
import 'package:fci_project/presentation/shared_widgets/primary_inputfield.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpScrean extends StatefulWidget {
  const HelpScrean({Key? key}) : super(key: key);

  @override
  State<HelpScrean> createState() => _HelpScreanState();
}

class _HelpScreanState extends State<HelpScrean> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final msgController = TextEditingController();
  String subject = 'سؤال';
  late UserProvider pro;

  _onSubmit() async {
    if (formKey.currentState!.validate()) {
      final res = await pro.contactUs(
        nameController.text.trim(),
        phoneController.text.trim(),
        msgController.text.trim(),
        subject,
      );
      if (res) {
        msgController.clear();
        Alert.showSuccessDialog(
            title: 'تواصل معنا',
            desc: 'تم استقبال طلبك بنجاح',
            ontap: () {
              Nav.pop();
              Nav.pop();
            });
      }
    }
  }

  @override
  void initState() {
    pro = Provider.of<UserProvider>(context, listen: false);
    nameController.text = currantUser.name ?? '';
    phoneController.text = (currantUser.phone ?? '').replaceAll('+2', '');
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    msgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: kprimary,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kprimary),
            padding: MaterialStateProperty.all(EdgeInsets.all(8)),
          ),
          onPressed: _onSubmit,
          child: Text('ارسال'),
        ),
      ),
      body: SafeArea(
        child: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            children: [
              PrimaryImage(
                url: 'assets/images/customers_service.png',
                height: MediaQuery.of(context).size.height * 0.29,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              PrimaryText(
                text: 'اخبرنا كيف يمكننا مساعدتك',
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                fontSizeRatio: 1.2,
              ),
              SizedBox(height: 10),
              PrimaryText(
                text: 'فريقنا على أهبة الاستعداد \n للخدمة والدعم.',
                color: kblack.withOpacity(0.8),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              StatefulBuilder(
                builder: (_, setState) => Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                          activeColor: kprimary,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: PrimaryText(text: 'سؤال'),
                          value: 'سؤال',
                          groupValue: subject,
                          onChanged: (String? val) {
                            subject = val!;
                            setState(() {});
                          }),
                    ),
                    Expanded(
                      child: RadioListTile(
                          activeColor: kprimary,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: PrimaryText(text: 'شكوى'),
                          value: 'شكوى',
                          groupValue: subject,
                          onChanged: (String? val) {
                            subject = val!;
                            setState(() {});
                          }),
                    ),
                    Expanded(
                      child: RadioListTile(
                          activeColor: kprimary,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: PrimaryText(text: 'اقتراح'),
                          value: 'اقتراح',
                          groupValue: subject,
                          onChanged: (String? val) {
                            subject = val!;
                            setState(() {});
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: kprimary),
                    borderRadius: BorderRadius.circular(8)),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryInputField(
                          headerText: 'الاسم :',
                          hintText: 'ادخل اسمك',
                          controller: nameController,
                        ),
                        SizedBox(height: defultPadding / 2),
                        PrimaryInputField(
                          headerText: 'رقم الهاتف :',
                          hintText: 'ادخل رقمك',
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          max: 11,
                        ),
                        SizedBox(height: defultPadding / 2),
                        PrimaryInputField(
                          headerText: 'رسالتك :',
                          hintText: 'ادخل الرسالة',
                          controller: msgController,
                          maxLines: 3,
                          hideBorder: true,
                        ),
                      ],
                    )),
              ),
              SizedBox(height: defultPadding),
            ]),
      ),
    );
  }
}
