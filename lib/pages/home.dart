import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftp_connect_wifi/utils/style.dart';
import 'package:ftp_connect_wifi/widgets/button_custom.dart';
import 'package:ftp_connect_wifi/widgets/input_custom.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ftpconnect/ftpconnect.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  TextEditingController _inputDominioController = new TextEditingController();
  TextEditingController _inputUserController = new TextEditingController();
  TextEditingController _inputPassController = new TextEditingController();

  final FocusNode _dominioFocus = FocusNode();
  final FocusNode _userFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();

  String nameFile = '', host, user, pass;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(10.w, 60.h, 10.w, 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FTP Connect',
                    style: StyleGeneral.styleTextTitlePage,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20.h),
                  InputCustom(
                    focusNode: _dominioFocus,
                    controller: _inputDominioController,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _dominioFocus, _userFocus);
                    },
                    hintText: 'Ingresa tu dominio',
                    validator: (value) {
                      if (value.isEmpty) return 'El Dominio es obligatorio';
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 15.h,
                  ),
                  InputCustom(
                    focusNode: _userFocus,
                    controller: _inputUserController,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _userFocus, _passFocus);
                    },
                    hintText: 'Ingresa tu usuario',
                    validator: (value) {
                      if (value.isEmpty) return 'El Usuario es obligatorio';
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 15.h,
                  ),
                  InputCustom(
                    focusNode: _passFocus,
                    controller: _inputPassController,
                    textInputAction: TextInputAction.done,
                    hintText: 'Ingresa tu contraseña',
                    validator: (value) {
                      if (value.isEmpty) return 'La contraseña es obligatorio';
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 25.h,
                  ),
                  ButtonCustom(
                    text: 'Elegir archivo',
                    fullscreen: true,
                    onTap: () async {
                      FilePickerResult result = await FilePicker.platform.pickFiles();

                      if(result != null) {
                        PlatformFile file = result.files.first;
                        print(file.name);
                        print(file.bytes);
                        print(file.size);
                        print(file.extension);
                        print(file.path);

                        setState(() {
                          nameFile = file.name;
                        });
                      } else {
                        // User canceled the picker
                      }
                    },
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  Center(
                    child: Text(
                      nameFile,
                      style: StyleGeneral.styleTextSmall,
                      textAlign: TextAlign.center,
                    )
                  ),

                  SizedBox(
                    height: 65.h,
                  ),

                  GestureDetector(
                    onTap: (){
                      _sendFiles();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w , vertical: 10.h),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height:55.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.w),
                          color: StyleGeneral.GREEN,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text('Enviar' , style: StyleGeneral.styleTextButtonCustom),
                        ),
                      ),
                    ),
                  ),

                  Center(
                      child: Text(
                        error,
                        style: StyleGeneral.styleTextSmall,
                        textAlign: TextAlign.center,
                      )
                  ),


                ],
              ),
            ),
          ),


        ],
      )
    );
  }

  _sendFiles() async {

    host = _inputDominioController.text.trim();
    user = _inputUserController.text.trim();
    pass = _inputPassController.text.trim();

    FTPConnect ftpConnect = FTPConnect(host , user:user , pass:pass);
    print(ftpConnect);
    try {
      File fileToUpload = File(nameFile);
      await ftpConnect.connect();
      await ftpConnect.uploadFile(fileToUpload);
      await ftpConnect.disconnect();
    } catch (e) {
      //error
      print("error: "+e);
      setState(() {
        error = e.toString();
      });
    }

  }

  _fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}