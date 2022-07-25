import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingOverlay({Key? key, required this.child, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      ); // 轉圈圈
    }

    return child;
  }
}
