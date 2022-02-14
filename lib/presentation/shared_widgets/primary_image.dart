import 'package:flutter/material.dart';

class PrimaryImage extends StatelessWidget {
  final String url;
  const PrimaryImage({required this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.contains('http')) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(url, fit: BoxFit.cover));
    }
    return Image.asset(url);
  }
}
