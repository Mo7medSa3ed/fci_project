import 'package:fci_project/presentation/shared_widgets/primary_error.dart';
import 'package:fci_project/presentation/shared_widgets/primary_loading.dart';
import 'package:flutter/cupertino.dart';

class PrimaryFutureWidget<T> extends StatelessWidget {
  const PrimaryFutureWidget(
      {required this.future, this.beforeReturn, required this.data, Key? key})
      : super(key: key);
  final Future<T> future;
  final Function(T) data;
  final Function(T)? beforeReturn;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (beforeReturn != null) {
            Future.delayed(Duration.zero, () {
              beforeReturn!(snapshot.data!);
            });
          }
          return data(snapshot.data!);
        }
        if (snapshot.hasError) {
          print(snapshot.stackTrace);
          print(snapshot.error.toString());
          return PrimaryErrorWidget();
        }
        return PrimaryLoading();
      },
    );
  }
}
