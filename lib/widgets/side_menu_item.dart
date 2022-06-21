import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/widgets/horizontal_menu_item.dart';
import 'package:flutter_web_dashboard/widgets/vertical_menu_item.dart';

// horizontally or vertically of the side menu with icons & names
class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap; // 여기 보이나? Function 도 변수처럼 선언이 가능하다는걸...
  const SideMenuItem({Key? key, required this.itemName, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 여기서 스크린 사이즈에 대해서 실시간으로 반응하고 있잖아..
    if (!ResponsiveWidget.isLargeScreen(context)) {
      return VerticalMenuItem(itemName: itemName, onTap: onTap,);
    }
    return HorizontalMenuItem(itemName: itemName, onTap: onTap,);
  }
}
