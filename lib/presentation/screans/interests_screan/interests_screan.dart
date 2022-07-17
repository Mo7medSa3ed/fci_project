import 'package:fci_project/bussniss_logic/auth_provider.dart';
import 'package:fci_project/bussniss_logic/product_provider.dart';
import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/browse_screan/widgets/category_card.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InterestsScrean extends StatefulWidget {
  const InterestsScrean({this.showBack = false, Key? key}) : super(key: key);
  final bool showBack;
  @override
  State<InterestsScrean> createState() => _InterestsScreanState();
}

class _InterestsScreanState extends State<InterestsScrean> {
  late ProductProvider _pro;
  List<String> seleccted = [];

  @override
  void initState() {
    seleccted = [...(currantUser.interests ?? [])];
    _pro = Provider.of<ProductProvider>(context, listen: false);
    super.initState();
  }

  onSubmit() async {
    await Provider.of<AuthProvider>(context, listen: false)
        .saveInterests(seleccted, widget.showBack);
    if (!widget.showBack) {
      currantUser.interests = [...seleccted];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('حدد اهتماماتك', back: widget.showBack),
      bottomNavigationBar: Container(
        color: kprimary,
        child: PrimaryButton(
          text: 'حفظ',
          onTap: onSubmit,
        ),
      ),
      body: PrimaryFutureWidget<List<Category>>(
          future: _pro.getAllCategories(),
          data: (data) {
            if (data.isEmpty) {
              return Center(child: PrimaryText(text: 'لا يوجد تصنيفات'));
            }

            return GridView.builder(
                padding: EdgeInsets.all(kpadding * 2),
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: kheight * 0.25,
                  crossAxisSpacing: kpadding * 2,
                  mainAxisSpacing: kpadding * 2,
                ),
                itemBuilder: (ctx, idx) {
                  return StatefulBuilder(builder: (_, set) {
                    return CategoryCard(
                        category: data[idx],
                        isForInterest: true,
                        isSelected: seleccted.contains(data[idx].id),
                        onPress: () {
                          if (seleccted.contains(data[idx].id)) {
                            seleccted.remove(data[idx].id);
                          } else {
                            seleccted.add(data[idx].id!);
                          }
                          set(() {});
                        });
                  });
                });
          }),
    );
  }
}
