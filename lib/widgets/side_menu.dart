import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/side_menu_item.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 13,),
                Row(
                  children: [
                    SizedBox(width: width / 16,), // 이렇게 옆에 공간을 만들어주고
                    Padding(padding: const EdgeInsets.only(right: 12,),
                    child: Image.asset("assets/icons/logo.png"),),
                    Flexible(child: CustomText(
                      // Expanded = match_parent & get all constraint from parent, Flexible = wrap_content and keeping relation with parent.
                      text: "Dashboard", size: 20, weight: FontWeight.bold, color: active,
                    ),),
                    SizedBox(width: width / 48,)
                  ],
                ),

              ],
          ),
          Divider(color: lightGrey.withOpacity(0.1),),
          Column(
            mainAxisSize: MainAxisSize.min,
/*
            잘봐라. 여기서 SideMenuItem 생성자를 이용해서 itemName 과 onTap 함수를 넘겨주고 있는거다. 그 넘겨준거는 각각 children 이 되어서
            돌아오고 그게 List 로 바뀌어서 표현되게 되는거다. 결국 children list 는 위젯이라는 것. 어디서 나온 위젯이냐고?
            vertical_menu_item 과 horizontal_menu_item 에서 넘어오는 위젯이라는것.
*/
            children: sideMenuItems.map((itemName) => SideMenuItem(
              itemName: itemName == authenticationPageRoute ? "Log Out" : itemName,
              onTap: () {
                if (itemName == authenticationPageRoute) {
                  // TODO : go to authentication page
                }
                if (!menuController.isActive(itemName)) {
                  menuController.changeActiveItemTo(itemName);
                  if (ResponsiveWidget.isSmallScreen(context)) {
                    Get.back(); // 이렇게도 사이드 메뉴바를 없앨 수 있네.
                  }
                  navigationController.navigateTo(itemName); // 여기 onTap 에서 navigatTo 가 이루어진다.
                  // TODO : go to Item Name Route
                }
              },),
            ).toList(),

          )

        ],),
    );
  }
}
