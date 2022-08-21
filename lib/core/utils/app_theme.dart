import 'package:flutter/material.dart';
import 'package:quetos/core/utils/app_colors.dart';
import 'package:quetos/core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
primaryColor: AppColors.primaryColor,
highlightColor: AppColors.hintColor ,
brightness: Brightness.light,
backgroundColor: AppColors.backgroundColorDark,
fontFamily: AppString.fontFamily,
textTheme:  const TextTheme(
bodyMedium:  TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, height: 1.3,)
),

appBarTheme: const  AppBarTheme(centerTitle: true,elevation: 0, backgroundColor: Colors.transparent,titleTextStyle:TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.black))
  );
}
