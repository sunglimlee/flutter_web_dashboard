
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap; // 여기 보이나? Function 도 변수처럼 선언이 가능하다는걸...
  const HorizontalMenuItem({Key? key, required this.itemName, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell( // 무슨 위젯이지?? hovering 을 위한 위젯이다.
      //[error] The argument type 'Function' can't be assigned to the parameter type 'void Function()?'.
      //[answer] put () when define Function variable like Function()
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
              child: Container(width: 6, height: 40, color: dark,),),
            SizedBox(width: width /80,),
            Padding(padding: const EdgeInsets.all(16), child: menuController.returnIconFor(itemName)),
            if (!menuController.isActive(itemName))
              Flexible(child: CustomText(text: itemName, color: menuController.isHovering(itemName) ? dark : lightGrey,))
            else
              Flexible(child: CustomText(text: itemName, color: dark, size: 18, weight: FontWeight.bold,),)
          ],
        ),
      )),

    );
  }
}
