import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../constants/style.dart';
import 'custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function()? onTap; // 여기 보이나? Function 도 변수처럼 선언이 가능하다는걸...
  const VerticalMenuItem({Key? key, required this.itemName, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value ?
        menuController.onHover(itemName) :
        menuController.onHover("not hovering");
      },
      child: Obx(() => Container(
        color: menuController.isHovering(itemName) ? lightGrey.withOpacity(0.1) : Colors.transparent,
        child: Row(
          children: [
            Visibility(visible: menuController.isHovering(itemName) || menuController.isActive(itemName),maintainSize: true,
              maintainState: true,maintainAnimation: true,
              child: Container(width: 3, height: 72, color: dark,),),
            Expanded(child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: const EdgeInsets.all(16), child: menuController.returnIconFor(itemName)),
                if (!menuController.isActive(itemName))
                  Flexible(child: CustomText(text: itemName, color: menuController.isHovering(itemName) ? dark : lightGrey,))
                else
                  Flexible(child: CustomText(text: itemName, color: dark, size: 18, weight: FontWeight.bold,),)

              ],
            ))
          ],
        ),
      )),

    );
  }
}
