import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftp_connect_wifi/utils/style.dart';


class ButtonCustom extends StatelessWidget {

  final String text;
  final Function onTap;
  final Color color;
  final bool fullscreen;

  const ButtonCustom({
    @required this.text,
    this.onTap,
    this.color,
    this.fullscreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: (this.fullscreen) ? 0 : 80.w),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height:55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.w),
            color: StyleGeneral.RED,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(this.text, style: StyleGeneral.styleTextButtonCustom),
          ),
        ),
      ),
    );
  }
}
