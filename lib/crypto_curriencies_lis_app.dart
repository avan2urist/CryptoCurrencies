import 'package:crypto/router/router.dart';
import 'package:crypto/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCurriencisList extends StatelessWidget {
  const CryptoCurriencisList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darktheme,
      routes: routes,
    );
  }
}