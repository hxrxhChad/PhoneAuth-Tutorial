// ignore_for_file: file_names, unused_import, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Next Task Sir ??!!",
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontWeight: FontWeight.w100, fontSize: 30),
        ),
      ),
    );
  }
}
