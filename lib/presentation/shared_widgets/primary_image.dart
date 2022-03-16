import 'package:fci_project/presentation/shared_widgets/primary_error.dart';
import 'package:fci_project/presentation/shared_widgets/primary_loading.dart';
import 'package:flutter/material.dart';

class PrimaryImage extends StatelessWidget {
  final String url;
  final double radius;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const PrimaryImage(
      {required this.url,
      this.radius = 0.0,
      this.fit = BoxFit.cover,
      this.height,
      this.borderRadius ,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.contains('https')) {
      return ClipRRect(
          borderRadius:borderRadius?? BorderRadius.circular(radius.toDouble()),
          child: Image.network(
            url,
            fit: fit,
            height: height,
            width: height != null ? height! * 1.1 : height,
            errorBuilder: (context, error, stackTrace) {
              return PrimaryErrorWidget(iconRatiaSize: 2.5, hasText: false);
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                  height: height,
                  width: height != null ? height! * 1.1 : height,
                  child: PrimaryLoading());
            },
          ));
    }
    return Image.asset(
      url,
      fit: fit,
      height: height,
    );
  }
}
