// strings
import 'dart:math';
import 'package:flutter/material.dart';

// variables
// bool showFab = true;

// bool? allowHomeBack = true;

const String appName = "UPI";
const String noInternetMessage = "please check internet connection, try again";

// app const
int? selectedAccount = 0;
int requestTimeout = 5;

getUniqId() {
  var rng = Random();
  return List.generate(1, (_) => rng.nextInt(999999999));
}

// fonts
const String appFont = 'Rubik-Regular';

// Colors
Color primaryColor = const Color(0xFF21084a);
Color primaryBackgroundLightColor = const Color(0xFFF8F3FF);

Color btnGreenColor = const Color(0xFF0D9644);
Color btnSelectAccount = const Color(0xFF3B1D6C);
Color chatsendBackground = const Color(0xFFEBE0FB);

Color txtColor = Colors.white;
Color txtDarkColor = const Color(0xFF161950);
Color txtLightColor = const Color(0xFF5B5D88);
Color txtHintColor = const Color(0xFF9395BE);
Color txtCheckBalanceColor = const Color(0xFF5518B5);
Color txtAmountSuccessColor = const Color(0xff2ECC71);
Color txtAmountPendingColor = const Color(0xffF39C12);
Color txtDebitColor = Colors.orange;
Color txtRejectColor = const Color(0xffD63031);
Color txtAmountSelectBackgroundColor = const Color(0xffF8F3FF);

Color txtInputBorderColor = const Color(0xFFE1E2F2);

Color iconUnSelectedColor = const Color(0xFFC2BDDC);
Color iconSelectedColor = const Color(0xFF21084A);
Color iconSelectAccountColor = const Color(0xFFAB94D0);
Color DisabledColor = Color(0xFF747474);
// images
// const String logoEquitasRound = "assets/images/equitas_logo_round.svg";
// const String iconSendMoney = "assets/images/send_money.svg";
// const String iconRequestMoney = "assets/images/recive_money.svg";
// const String iconPayToContact = "assets/images/pay_to_contact.svg";
// const String iconAddUpiScreen = "assets/images/add_upi_logo.svg";
// const String iconHome = "assets/images/home_icon_svg.svg";
// const String iconTransaction = "assets/images/transaction_icon_svg.svg";
// const String iconTransactionSelected =
//     "assets/images/transaction_icon_selected_svg.svg";
// const String iconAddUpi = "assets/images/add_upi_icon_svg.svg";
// const String iconDottedLine = "assets/images/dotted_line.svg";
// const String iconRequest = "assets/images/request_icon_svg.svg";
// const String iconBeneficiary = "assets/images/beneficiary_icon_svg.svg";
// const String iconAlertDialog = "assets/images/alert_icon.svg";
// const String iconRupeeSelected = "assets/images/rupee_icon_selected_svg.svg";
// const String iconRupee = "assets/images/rupee_icon_svg.svg";
// const String iconSuccessGreen = "assets/images/success_green.svg";
const String iconPendingAlert = "assets/images/pending_alert.svg";
const String icontick = "assets/images/tick_svg.svg";
const String iconReceiver = "assets/images/receiver_bg_svg.svg";
const String iconSender = "assets/images/sender_bg_svg.svg";

// const String iconPersonPng = "assets/images/person_png.png";
// const String iconEquitasLogoPng = "assets/images/equitas_logo_png.png";
// const String iconPowerdByPng = "assets/images/powerd_by_upi_png.png";
// const String iconPapersPng = "assets/images/clrpappers.png";
// const String iconTickPng = "assets/images/tickmark.png";
// const String iconFailurPng = "assets/images/icon_failur_png.png";
// const String iconEquitasLogoRoundPng =
//     "assets/images/equitas_logo_round_png.png";
