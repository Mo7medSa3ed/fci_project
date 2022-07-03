import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/login_screan/widgets/complaints_suggestions_card.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplaintsAndSuggestionsScrean extends StatelessWidget {
  const ComplaintsAndSuggestionsScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('كل الشكاوى و المقترحات'),
        body: PrimaryFutureWidget<List>(
            future: Provider.of<UserProvider>(context, listen: false)
                .getAllContacts(),
            data: (data) {
              if (data.isEmpty) {
                return Center(
                    child: PrimaryText(text: 'ليس لديك اى شكاوى او مقترح'));
              }
              return ListView.builder(
                  padding: EdgeInsets.all(kpadding),
                  physics: BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (_, i) {
                    return ComplaintsAndSuggestionsCard(data[i]);
                  });
            }));
  }
}
