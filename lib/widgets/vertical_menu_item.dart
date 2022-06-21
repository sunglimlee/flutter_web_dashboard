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
      onTap: onTap, // 실제로 외부에서 받는 onTap 을 그대로 여기에서 사용하고 있다는 것.
      onHover: (value) { // onHover 도 여기서 바로 사용할 수 있다. 왜냐면
        value ?
        menuController.onHover(itemName) : // 여기서 보듯이 현재 이 객체가 가지고 있는 itemName 을 가지고 비교를 하니깐.
        menuController.onHover("not hovering");
      },
      child: Obx(() => Container( // 이제 obs 값을 따라서 실시간으로 Container 값을 변경하고 싶다는 거지. 그걸 가능하게 하는게 Obx()
        color: menuController.isHovering(itemName) ? lightGrey.withOpacity(0.1) : Colors.transparent,
        child: Row(
          children: [
            Visibility(visible: menuController.isHovering(itemName) || menuController.isActive(itemName),maintainSize: true,
              maintainState: true,maintainAnimation: true, // 여기 Visibility 부분은 잘 모르겠다.
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
