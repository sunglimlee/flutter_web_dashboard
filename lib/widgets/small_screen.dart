import 'package:flutter/material.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(), // 주어진 사이즈에 맞게 최대로 늘려진다.
      color: Colors.green,

    );
  }
}
