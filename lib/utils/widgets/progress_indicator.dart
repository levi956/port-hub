import 'package:flutter/material.dart';

void showLoader(BuildContext context) {
  showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (_) => const Center(child: CircularProgressIndicator.adaptive()),
  );
}
