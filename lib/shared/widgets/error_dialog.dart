import 'dart:io';

import '../models/custom_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void errorDialog(BuildContext context, CustomError e) {
  Map<String, String> errors = {
    '500': 'Internal server error',
    '404': 'Not found',
  };
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(errors[e.code] ?? 'Error'),
          content: Text(e.message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(errors[e.code] ?? 'Error'),
            content: Text(e.message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'))
            ],
          );
        });
  }
}
