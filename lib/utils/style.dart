import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class StyleGeneral {
  //Color
  static final Color BLACK = Color(0xFF303030);
  static final Color BLACK_DARK = Color(0xFF191919);
  static final Color WHITE = Colors.white;
  static final Color RED = Color(0xFFB20B32);
  static final Color YELLOW = Color(0xFFFFD200);
  static final Color ORANGE = Color(0xFFFF8B00);
  static final Color GREEN = Color(0xFF62C555);

  static final Color GREEN_LIGTH_50 = Color(0xFF96d68e);
  static final Color GREEN_LIGTH_25 = Color(0xFFbce3b7);
  static final Color BLUE = Color(0xFF1977F2);
  static final Color BLACK_LIGTH = Color(0xFF303030);
  static final Color BLACK_LIGTH_50 = Color(0xFF707070);
  static final Color BLACK_LIGTH_75 = Color(0xFF939393);
  static final Color BLACK_LIGTH_25 = Color(0xFFE0DEDE);
  static final Color GREY_LIGTH = Color(0xFF939393);
  static final Color GREY = Color(0xFFF8F8F8);
  static final Color RED_LIGTH = Color(0xFF9F0000);

  //////////////////////////////////////////////
  static final styleTextTitlePage = TextStyle(
      color: StyleGeneral.BLACK,
      letterSpacing: .5,
      fontSize: ScreenUtil().setSp(20),
      fontFamily: 'Poppins-Semi');

  static final styleTextSmall = TextStyle(
      color: StyleGeneral.BLACK,
      fontSize: ScreenUtil().setSp(14),
      fontFamily: 'Poppins-Semi');

  static final styleTextButtonCustom = TextStyle(
      color: StyleGeneral.WHITE,
      fontSize: ScreenUtil().setSp(15),
      fontFamily: 'Poppins-Semi');

}