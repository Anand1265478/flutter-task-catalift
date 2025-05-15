import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff03045E),
      elevation: 2,
      title: Row(
        children: [
          Image.asset("assets/images/cataliftlogo.png", height: 21, width: 90),
          Spacer(),
        ],
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: Image.asset(
            "assets/images/profilelogo.png",
            height: 24,
            width: 27,
          ),
          onPressed: () {
            // Handle profile action
          },
        ),
        SizedBox(width: 10),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Image.asset(
            "assets/images/notificationlogo.png",
            height: 24,
            width: 27,
          ),
          onPressed: () {
            // Handle notification action
          },
        ),
        SizedBox(width: 10),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Image.asset(
            "assets/images/messagelogo.png",
            height: 24,
            width: 27,
          ),
          onPressed: () {
            // Handle message action
          },
        ),
        SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(51); // AppBar height
}
