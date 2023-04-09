import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_chat_box/chatMessageModel.dart';
import 'package:simple_chat_box/utils/commen.dart';
import 'package:simple_chat_box/utils/const.dart';
import 'package:simple_chat_box/utils/utils.dart';

class ChatUI extends StatefulWidget {
  ChatUI({super.key});

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Received from Ganesh",
        messageType: "receiver",
        amt: '₹500',
        exttime: '04:31 pm'),
    ChatMessage(
        messageContent: "Received from Ganesh",
        messageType: "receiver",
        amt: '₹400',
        exttime: '04:33 pm'),
    ChatMessage(
        messageContent: "Request from you",
        messageType: "sender",
        amt: '₹300',
        exttime: '04:33 pm'),
    ChatMessage(
        messageContent: "Payment to you",
        messageType: "receiver",
        amt: '₹1000',
        exttime: '04:33 pm'),
    ChatMessage(
        messageContent: "Payment to you",
        messageType: "sender",
        amt: '₹5000',
        exttime: '04:33 pm'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const CircleAvatar(
                  // backgroundImage: ,
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Akash",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                color: primaryBackgroundLightColor,
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            child: messages[index].messageType == "receiver"
                                ? SvgPicture.asset(
                                    iconReceiver,
                                  )
                                : SvgPicture.asset(iconSender),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              messages[index].messageContent,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: width(context) * 0.05,
                                  fontFamily: 'Rubik-Regular',
                                  fontWeight: FontWeight.w400,
                                  color: txtLightColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: width(context) * 0.05,
                              top: height(context) * 0.08,
                            ),
                            child: Text(
                              messages[index].amt,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: width(context) * 0.08,
                                  fontFamily: 'Rubik-Regular',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          Positioned(
                            bottom: messages[index].messageType == "receiver"
                                ? height(context) * 0.15
                                : height(context) * 0.05,
                            left: 10,
                            child: Row(
                              children: [
                                ClipRRect(
                                  child:
                                      messages[index].messageType == "receiver"
                                          ? SvgPicture.asset(iconPendingAlert)
                                          : SvgPicture.asset(icontick),
                                ),
                                horizondalSpacer(5),
                                Text(
                                  messages[index].messageType == "receiver"
                                      ? "Expires at"
                                      : "Paid",
                                  style: TextStyle(
                                      fontSize: width(context) * 0.04,
                                      color: txtHintColor),
                                ),
                                horizondalSpacer(5),
                                Text(
                                  messages[index].exttime,
                                  style: TextStyle(
                                      fontSize: width(context) * 0.04,
                                      color: txtLightColor),
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsetsDirectional.only(
                          //       start: 1.0, end: 1.0),
                          //   height: 5.0,
                          //   color: Colors.red,
                          // ),
                          Visibility(
                            visible: messages[index].messageType == "receiver",
                            child: Positioned(
                              bottom: height(context) * 0.10,
                              left: 10,
                              right: 10,
                              child: SizedBox(
                                  width: width(context) * 0.8,
                                  height: 30,
                                  child: Divider(
                                    thickness: 1,
                                    color: divideColor,
                                    indent: 16,
                                    endIndent: 16,
                                  )),
                            ),
                          ),

                          // ),

                          Padding(
                            padding: EdgeInsets.only(
                                left: width(context) * 0.042,
                                top: height(context) * 0.23,
                                right: width(context) * 0.042),
                            child: Container(
                              width: width(context) * 0.55,
                              child: Visibility(
                                  visible:
                                      messages[index].messageType == "receiver",
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Reject",
                                          style: TextStyle(
                                            color: Color(0xffD63031),
                                            fontSize: width(context) * 0.042,
                                            fontFamily: 'Rubik-Regular',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xfffbeaea)),
                                      )),
                                      horizondalSpacer(width(context) * 0.052),
                                      Expanded(
                                          child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Send",
                                          style: TextStyle(
                                            color: Color(0xff2ECC71),
                                            fontSize: width(context) * 0.042,
                                            fontFamily: 'Rubik-Regular',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffeafaf1)),
                                      )),
                                    ],
                                  )),
                            ),
                          ),
                          // decoration: BoxDecoration(
                          //   image: DecorationImage(
                          //     image: messages[index].messageType == "receiver"
                          //         ? SvgPicture.asset(
                          //             iconReceiver,
                          //           ) as ImageProvider
                          //         : SvgPicture.asset(iconSender) as ImageProvider,
                          //   ),
                          // ),
                          // messages[index].messageType == "receiver"
                          //     ? SvgPicture.asset(
                          //         iconReceiver,
                          //       )
                          //     : SvgPicture.asset(iconSender),
                        ],
                      ),
                      // height: (messages[index].messageType == "receiver"
                      //     ? height(context) * 0.4
                      //     : height(context) * 0.3649),
                      // // ),w
                      // width: width(context) * 0.8,
                    )

                    /*  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ), */
                    ),
              );
            },
          )
        ],
      ),
    );
  }
}
