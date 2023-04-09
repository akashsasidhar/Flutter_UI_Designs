import 'package:flutter/material.dart';
import 'package:simple_chat_box/chatMessageModel.dart';
import 'package:simple_chat_box/utils/commen.dart';
// import 'package:upi_module/utils/commen.dart';
// import 'package:upi_module/utils/const.dart';
// import 'package:upi_module/utils/utils.dart';
// import 'package:upi_module/views/transaction/chat_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_chat_box/utils/const.dart';

import '../utils/utils.dart';

class IndivialTransaction extends StatefulWidget {
  const IndivialTransaction({super.key});

  @override
  State<IndivialTransaction> createState() => _IndivialTransaction();
}

class _IndivialTransaction extends State<IndivialTransaction> {
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Request from Ganesh",
        messageType: "receiver",
        amt: '₹500',
        exttime: '04:33 pm'),
    ChatMessage(
        messageContent: "Request from Ganesh",
        messageType: "receiver",
        amt: '₹400',
        exttime: '04:33 pm'),
    ChatMessage(
        messageContent: "Received from Ganesh",
        messageType: "sender",
        amt: '₹300',
        exttime: '04:33 pm'),
    ChatMessage(
        messageContent: "Request from Ganesh",
        messageType: "receiver",
        amt: '₹1000',
        exttime: '04:33 pm'),
    ChatMessage(
        messageContent: "Received from Ganesh",
        messageType: "sender",
        amt: '₹5000',
        exttime: '04:33 pm'),
  ];

  divideLine() {
    return Divider(
      thickness: 1,
      color: Color(0xffE1E2F2),
      indent: 10,
      endIndent: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: "Haiii"),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: messages.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 15, bottom: 10),
                  color: primaryBackgroundLightColor,
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      child: ClipRRect(
                        child: messages[index].messageType == "receiver"
                            ? SvgPicture.asset(
                                iconReceiver,
                              )
                            : SvgPicture.asset(iconSender),
                      ),
                      // height: (messages[index].messageType == "receiver"
                      //     ? height(context) * 0.319
                      //     : height(context) * 0.2449),
                      // // ),w
                      // width: width(context) * 0.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: SvgPicture.asset(
                            iconReceiver,
                          ) as ImageProvider,
                        ),
                      ),
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10),
                      //   color: (messages[index].messageType == "receiver"
                      //       ? Colors.white
                      //       : chatsendBackground),
                      // ),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Padding(
                      //           padding: EdgeInsets.all(width(context) * 0.05),
                      //           child: Text(
                      //             messages[index].messageContent,
                      //             overflow: TextOverflow.ellipsis,
                      //             style: TextStyle(
                      //                 fontSize: width(context) * 0.05,
                      //                 fontFamily: 'Rubik-Regular',
                      //                 fontWeight: FontWeight.w400,
                      //                 color: txtLightColor),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding:
                      //               EdgeInsets.only(left: width(context) * 0.05),
                      //           child: Text(
                      //             messages[index].amt,
                      //             textAlign: TextAlign.left,
                      //             style: TextStyle(
                      //                 fontSize: width(context) * 0.08,
                      //                 fontFamily: 'Rubik-Regular',
                      //                 fontWeight: FontWeight.w400,
                      //                 color: Colors.black),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: EdgeInsets.all(width(context) * 0.05),
                      //           child: Row(
                      //             children: [
                      //               ClipRRect(
                      //                 child:
                      //                     messages[index].messageType == "receiver"
                      //                         ? SvgPicture.asset(iconPendingAlert)
                      //                         : SvgPicture.asset(icontick),
                      //               ),
                      //               horizondalSpacer(5),
                      //               Text(
                      //                 messages[index].messageType == "receiver"
                      //                     ? "Expires at"
                      //                     : "Paid",
                      //                 style: TextStyle(
                      //                     fontSize: width(context) * 0.04,
                      //                     color: txtHintColor),
                      //               ),
                      //               horizondalSpacer(5),
                      //               Text(
                      //                 messages[index].exttime,
                      //                 style: TextStyle(
                      //                     fontSize: width(context) * 0.04,
                      //                     color: txtLightColor),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         divideLine(),
                      //         Padding(
                      //           padding: EdgeInsets.only(
                      //               left: width(context) * 0.042,
                      //               right: width(context) * 0.042),
                      //           child: Visibility(
                      //               visible:
                      //                   messages[index].messageType == "receiver",
                      //               child: Row(
                      //                 children: [
                      //                   Expanded(
                      //                       child: ElevatedButton(
                      //                     onPressed: () {},
                      //                     child: Text(
                      //                       "Reject",
                      //                       style: TextStyle(
                      //                         color: Color(0xffD63031),
                      //                         fontSize: width(context) * 0.042,
                      //                         fontFamily: 'Rubik-Regular',
                      //                         fontWeight: FontWeight.w600,
                      //                       ),
                      //                     ),
                      //                     style: ElevatedButton.styleFrom(
                      //                         backgroundColor: Color(0xfffbeaea)),
                      //                   )),
                      //                   horizondalSpacer(width(context) * 0.052),
                      //                   Expanded(
                      //                       child: ElevatedButton(
                      //                     onPressed: () {},
                      //                     child: Text(
                      //                       "Send",
                      //                       style: TextStyle(
                      //                         color: Color(0xff2ECC71),
                      //                         fontSize: width(context) * 0.042,
                      //                         fontFamily: 'Rubik-Regular',
                      //                         fontWeight: FontWeight.w600,
                      //                       ),
                      //                     ),
                      //                     style: ElevatedButton.styleFrom(
                      //                         backgroundColor: Color(0xffeafaf1)),
                      //                   )),
                      //                 ],
                      //               )),
                      //         ),
                      //         Padding(
                      //           padding: messages[index].messageType == "receiver"
                      //               ? EdgeInsets.only(top: height(context) / 64)
                      //               : EdgeInsets.only(top: height(context) / 300),
                      //           child: Stack(children: [
                      //             Positioned(
                      //               child: SvgPicture.asset(iconDottedLine),
                      //             ),
                      //           ]),
                      //         ),
                      //       ],
                      //     ),
                      // ),
                    ),
                  ),
                );
              },
            ),
            Container(
              color: primaryBackgroundLightColor,
            )
          ],
        ),
      ),
    );
  }
}
