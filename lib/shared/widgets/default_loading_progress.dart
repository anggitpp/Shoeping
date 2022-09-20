import 'package:flutter/material.dart';

class DefaultLoadingProgress extends StatelessWidget {
  const DefaultLoadingProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
