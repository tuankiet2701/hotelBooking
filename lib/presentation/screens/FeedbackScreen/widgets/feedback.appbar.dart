import 'package:flutter/material.dart';
import 'package:hotel_booking/app/constants/app.colors.dart';

AppBar feedbackAppBar({required bool themeFlag}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Feedback",
            style: TextStyle(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ),
  );
}
