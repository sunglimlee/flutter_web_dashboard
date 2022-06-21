import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

// 클래스 만들듯이 함수를 만들었다. 알잖아. AlertDialog1 만들었던거..
AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              // smallScreen 이 아니라면
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset(
                    'assets/icons/logo.png',
                    width: 28,
                  ), // 껏다 켜니깐 되는구나.
                )
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              },
            ),
      elevation: 0,
      title: Row(
        children: [
          Visibility(
              child: CustomText(
            text: "Dashboard",
            color: lightGrey,
            size: 20,
            weight: FontWeight.bold,
          )),
          Expanded(child: Container()), // 이거 때문에 중간에 공간을 꽉채우는거다.
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: dark.withOpacity(0.7),
            ),
          ),
          Stack( // notification 이 있다는 걸 알리기 위해서 Stack 을 사용했다.
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: dark.withOpacity(0.7),
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: active,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: light, width: 2)),
                ),
              )
            ],
          ),
          Container( // 세로줄
            alignment: Alignment.center,
            width: 1,
            height: 22,
            color: lightGrey,
          ),
          const SizedBox( // 공간을 주기 위해서 sizedBox 를 사용
            width: 24,
          ),
          CustomText(
            text: "Sunglim Lee",
            color: lightGrey,
          ),
          const SizedBox(
            width: 16,
          ),
          Container( // 아바타 넣는 부분
            decoration: BoxDecoration(
                color: Colors.white,  borderRadius: BorderRadius.circular(30), border: Border.all(width: 0.1)),
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2), // margin 의 사용에 대해서 다시보자.
              child: CircleAvatar(
                backgroundColor: light,
                child: Icon(
                  Icons.person_outline,
                  color: dark,
                ),
              ),
            ),
          )
        ],
      ),
      iconTheme: IconThemeData(color: dark,),
      backgroundColor: light,
    );
