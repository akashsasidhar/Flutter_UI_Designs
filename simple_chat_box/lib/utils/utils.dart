// ignore_for_file: unnecessary_string_escapes

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:simple_chat_box/utils/const.dart';

bool showFab = true;
// home screen
var bottomSheetController;
// request screen
var amountPayBottomsheetController;
var accountSelectBottomsheetController;
Color? fabColor = iconUnSelectedColor;

// hide softkeyboar programatically
hideKeyboard() => SystemChannels.textInput.invokeMethod('TextInput.hide');

isUpiValid(upiId) {
  return RegExp("[a-zA-Z0-9\.\-]\@[a-zA-Z][a-zA-Z]").hasMatch(upiId);
}

//password validation method
isPasswordValid(password) {
  //return true if the length of the password is more than or equal to 8 characters else returns false
  return password.length >= 8;
}

// get device height width Dimentions
height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;
deviceAspectRatio(context) => MediaQuery.of(context).size.aspectRatio;

myDateFormat(
    {@required date,
    @required month,
    @required year,
    @required hour,
    @required min,
    @required sec,
    required String format}) {
  switch (format) {
    case "DD/MM/YYYY":
      return "$date/$month/$year";
    case "DD-MM-YYYY":
      return "$date-$month-$year";
    case "H/M/S":
      return "$hour:$min:$sec";
  }
  return date + month + year;
}

// named route navigation functions
formshow(context, routeName) => Navigator.pushNamed(context, routeName);
formshowReplace(context, routeName) =>
    Navigator.pushReplacementNamed(context, routeName);
formshowData(context, routeName, arg) =>
    Navigator.pushNamed(context, routeName, arguments: arg);
formshowReplaceData(context, routeName, arg) =>
    Navigator.pushReplacementNamed(context, routeName, arguments: arg);
formshowUntil(context, routeName) =>
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
goBack(context) => Navigator.pop(context);
