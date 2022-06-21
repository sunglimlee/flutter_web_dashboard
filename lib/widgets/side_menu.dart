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
                const SizedBox(height: 40,),
                Row(
                  children: [
                    SizedBox(width: width / 48),
                    Padding(padding: const EdgeInsets.only(right: 12),
                    child: Image.asset("assets/icons/logo.png"),),
                    Flexible(child: CustomText(
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
            children: sideMenuItems.map((itemName) => SideMenuItem(
              itemName: itemName == authenticationPageRoute ? "Log Out" : itemName,
              onTap: () {
                if (itemName == authenticationPageRoute) {
                  // TODO : go to authentication page
                }
                if (!menuController.isActive(itemName)) {
                  menuController.changeActiveItemTo(itemName);
                  if (ResponsiveWidget.isSmallScreen(context)) {
                    Get.back();
                  }
                  // TODO : go to Item Name Route
                }
              },),
            ).toList(),

          )

        ],),
    );
  }
}
