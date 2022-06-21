import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/widgets/side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              color: Colors.red,
              child: const SideMenu(),
            )),
        Expanded(flex : 5, // 이걸로 총 6칸중에서 5칸을 할당받는구나.
            child: Container(
              color: Colors.blue,
            )),
      ],
    );
  }
}
