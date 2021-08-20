import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprovider/CommonWidgets/TextFormStyle.dart';
import 'package:flutterprovider/Constant/GlobalConst.dart';
import 'package:flutterprovider/Controller/HomeController.dart';
import 'package:flutterprovider/Model/Dashboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  final Result data;

  UserView(this.data);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  bool isNotification = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData()async{
    var id=widget.data.userGuid;
    var respo=await Provider.of<HomeProvider>(context, listen: false).userData(id!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: SafeArea(
          bottom: false,
          child: Scaffold(
              body: CustomScrollView(slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black54,
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black12
                    ),
                    child: FlexibleSpaceBar(
                      title: Text(widget.data.name!,
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        centerTitle: false,

                        background: Stack(
                          children: [
                            (widget.data.userAvatar == null)
                                ? Container()
                                : Container(
                              color: Colors.white,child: Image.network(
                              widget.data.userAvatar!,
                              fit: BoxFit.cover,
                            ),
                            ),
                            Positioned(
                              right: 1,
                              child: Container(height: 250,child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  (widget.data.paymentAccountInfo!.isDefaultCardValid&&widget.data.paymentAccountInfo!.isCcCaptured)?
                                  validatePaymentCard(Colors.green,Icons.credit_card_rounded):
                                  validatePaymentCard(Colors.red,CupertinoIcons.creditcard_fill),

                                  (widget.data.gender=="male")?
                                  FaIcon(FontAwesomeIcons.male,color: Colors.blue,):
                                  FaIcon(FontAwesomeIcons.female,color: Colors.purpleAccent,),
                                ],
                              ),)
                            ),
                            Positioned(
                                left: 1,
                                bottom: 1,
                                child: Column(
                                  children: [
                                    FaIcon(FontAwesomeIcons.male,color: Colors.blue,),
                                    FaIcon(FontAwesomeIcons.female,color: Colors.purpleAccent,),
                                  ],
                                )
                            )
                          ],
                        )
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Color(0xFFF5F6F9),
                    child: Column(
                      children: [
                        Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          elevation: 2,
                          child:
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:const EdgeInsets.all(15.0),
                                  child: Text(
                                    "About and email",
                                    style: TextStyle(fontSize: 16,color: mainColor),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                                    child: Text("Hy there, I am using NatApp",
                                      style: TextStyle(fontSize: 16,color: Colors.black87),
                                    )
                                ),
                                Divider(
                                  color: Colors.grey[200],
                                ),
                                Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Text(widget.data.name!,
                                      style: TextStyle(fontSize: 16),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                                    child: Text("Email",
                                      style: TextStyle(fontSize: 14,color: Colors.grey[400]),
                                    )
                                ),
                              ]
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15.0, 8, 15, 0),
                                child: Row(
                                  children: [
                                    Text("Mute notification",
                                        style: TextStyle(fontSize: 16)),
                                    Spacer(),
                                    (Platform.isAndroid)
                                        ? Switch(
                                      value: isNotification,
                                      onChanged: (bool val) {
                                        setState(() {
                                          isNotification = val;
                                        });
                                      },
                                    )
                                        : CupertinoSwitch(
                                      value: true,
                                      onChanged: (bool val) {
                                        setState(() {
                                          isNotification = val;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey[200],
                              ),

                              Padding(
                                padding:const EdgeInsets.all(15.0),
                                child: Text(
                                  "Custom notification",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),

                              Divider(
                                color: Colors.grey[200],
                              ),

                              Padding(
                                padding:const EdgeInsets.all(15.0),
                                child: Text(
                                  "Media Visibility",
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text("Disappearing messeges",
                                    style: TextStyle(fontSize: 16)),
                                subtitle: Text("Off",
                                  style: TextStyle(fontSize: 14,color: Colors.grey[400]),
                                ),
                                trailing: Icon(Icons.timelapse_rounded,color: mainColor,),
                                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              ),

                              Divider(
                                color: Colors.grey[200],
                              ),

                              ListTile(
                                title: Text("Encryption",
                                    style: TextStyle(fontSize: 16)),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Text("Messages and call are end-to-end encrypted. Tap to verify.",
                                    style: TextStyle(fontSize: 14,color: Colors.grey[400]),
                                  ),),
                                trailing: Icon(Icons.lock,color: mainColor,),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          elevation: 2,
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.block_outlined,
                                    color: Colors.redAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Block",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.redAccent))
                                ],
                              )),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          elevation: 2,
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.thumb_down_rounded,
                                    color: Colors.redAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Report contact",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.redAccent))
                                ],
                              )),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                )
              ]))),
    );
  }
}