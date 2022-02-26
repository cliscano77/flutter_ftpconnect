import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftp_connect_wifi/utils/style.dart';

class InputCustom extends StatelessWidget {
  final String hintText;
  final Function validator;
  final FocusNode focusNode;
  final Function onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const InputCustom({
    Key key,
    this.hintText,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    @required this.focusNode,
    @required this.validator,
    @required this.controller,
  }) : super(key: key);

  static OutlineInputBorder borderinput = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.left,
      keyboardType:this.keyboardType ,
      textCapitalization: TextCapitalization.words,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 14.0, bottom: 18.w, top: 18.w),
        filled: true,
        fillColor: StyleGeneral.GREY,
        hintText: hintText,
        enabledBorder: borderinput,
        border: borderinput,
        focusedBorder: borderinput,
      ),
      style: new TextStyle(
        color: StyleGeneral.BLACK,
        fontSize: ScreenUtil().setSp(15),
        fontFamily: "Poppins-Regular",
      ),
      validator: validator,
    );
  }
}
