import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_chat_box/utils/utils.dart';
import 'dart:math' as math;

import 'const.dart';

horizondalSpacer(double width) {
  return SizedBox(
    width: width,
  );
}

verticalSpacer(height) {
  return SizedBox(
    height: height,
  );
}

// commen Text
appText({@required data, color, @required size, weight, textAlign}) {
  return Text(
    data ?? '',
    style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size,
        fontWeight: weight ?? FontWeight.normal,
        fontFamily: appFont),
    textAlign: textAlign,
  );
}

//TransactionIndividual
//Ganesh
appTextReq({@required data, color, @required size, weight, textAlign}) {
  return Text(
    data ?? '',
    style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size,
        fontWeight: weight ?? FontWeight.normal,
        fontFamily: appFont),
    textAlign: textAlign ?? TextAlign.center,
  );
}

myAppBarReq(
    {@required context,
    @required title,
    List<Widget>? actions,
    backgroundColor,
    defaultBack}) {
  return AppBar(
    actions: actions != null
        ? actions.isNotEmpty
            ? actions
            : null
        : null,
    backgroundColor: backgroundColor ?? primaryColor,
    automaticallyImplyLeading: defaultBack ?? true,
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: primaryColor,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    title: appTextReq(
        data: title,
        size: width(context)(context) * 0.05,
        weight: FontWeight.w600,
        textAlign: TextAlign.center),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    elevation: 0,
  );
}

// commen appbar
myAppBar(
    {@required context,
    @required title,
    List<Widget>? actions,
    backgroundColor,
    defaultBack}) {
  return AppBar(
    actions: actions != null
        ? actions.isNotEmpty
            ? actions
            : null
        : null,
    backgroundColor: backgroundColor ?? primaryColor,
    automaticallyImplyLeading: defaultBack ?? true,
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: primaryColor,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    title: appText(
        data: title,
        size: width(context) * 0.05,
        weight: FontWeight.w600,
        textAlign: TextAlign.end),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    elevation: 0,
  );
}

myAppButton(
    {@required context, @required buttonName, margin, @required onpress}) {
  return Container(
    margin: margin ?? const EdgeInsets.all(0.0),
    child: ElevatedButton(
      onPressed: onpress,
      child: appText(
        data: buttonName,
        size: width(context) * 0.04,
        weight: FontWeight.w600,
        color: primaryBackgroundLightColor,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        minimumSize: Size(width(context), height(context) / 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

showSnackBar(msg, context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    behavior: SnackBarBehavior.floating,
    backgroundColor: txtDarkColor,
  ));
}

Color divideColor = const Color(0xffE1E2F2);
divideLine() {
  return Divider(
    thickness: 2,
    color: divideColor,
    indent: 16,
    endIndent: 16,
  );
}
