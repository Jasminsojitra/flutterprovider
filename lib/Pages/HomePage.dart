import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprovider/CommonWidgets/TextFormStyle.dart';
import 'package:flutterprovider/Constant/GlobalConst.dart';
import 'package:flutterprovider/Controller/HomeController.dart';
import 'package:flutterprovider/Pages/userInfo.dart';
import 'package:flutterprovider/network_module/api_response.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'LoginPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final focus = FocusNode();
  TextEditingController _textEditingControllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: false,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Consumer<HomeProvider>(builder: (context,myModel,child){
        if(myModel.dashboardDataInfo.status==Status.COMPLETED)
          return Column(
            children: [
              Container(
                margin: EdgeInsets.zero,
                color: mainColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  child: Container(
                    height: 48,
                    child: TextField(
                      controller: this._textEditingControllerSearch,
                      keyboardType:TextInputType.text,
                      autofocus: false,
                      onSubmitted: (v) {

                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),),
                          hintText: "Search"),
                    ),
                  ),
                ),
              ),
              Expanded(child: ListView.builder(
                  itemCount:myModel.dashboardDataInfo.data!.result!.length,
                  itemBuilder: (BuildContext contexts,int index){
                    var dashData=myModel.dashboardDataInfo.data!.result![index];
                    return Card(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                        elevation: 4,
                        child:
                        GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50,
                                    child: (dashData.userAvatar!=null)
                                        ?CachedNetworkImage(
                                      imageUrl: dashData.userAvatar!,
                                      placeholder: (context, url) => CupertinoActivityIndicator(),
                                      imageBuilder: (context, image) => CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 50,
                                        backgroundImage: image,
                                      ),
                                      errorWidget: (context, url, error) => nullImage(),
                                    ): nullImage(),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(dashData.name!,style: TextStyle(fontSize: 18),),
                                    SizedBox(height: 5,),
                                    Text("DoB :"+dashData.dob!,
                                      style: TextStyle(
                                          color: Colors.black54,fontSize: 14),),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: mainColor
                                        ),
                                        height: 40,
                                        margin: EdgeInsets.symmetric(vertical: 5),
                                        child:
                                        TextButton(
                                          onPressed: (){}, child:Padding(child:  Text("Add Feed(s)",style: TextStyle(color: Colors.white),),
                                            padding: EdgeInsets.only(left: 10,right: 10)),))
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    (dashData.paymentAccountInfo!.isDefaultCardValid
                                        && dashData.paymentAccountInfo!.isCcCaptured)?
                                    validatePaymentCard(Colors.green,Icons.credit_card_rounded):
                                    validatePaymentCard(Colors.red,CupertinoIcons.creditcard_fill),
                                    SizedBox(height: 10,),
                                    (dashData.gender=="male")?
                                    FaIcon(FontAwesomeIcons.male,color: Colors.blue,):
                                    FaIcon(FontAwesomeIcons.female,color: Colors.purpleAccent,),
                                  ],
                                )
                              ],
                            ),
                          ),
                          onTap: () async {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => UserView(dashData)));
                          },
                        )

                    );
                  }))
            ],
          );
        else if(myModel.dashboardDataInfo.status==Status.ERROR){
          if(myModel.dashboardDataInfo.message!.contains("Unauthorised")){
            prefs.setBool("IsLogin", false);
            prefs.setString("Token","");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
          }
          return Container();
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      }),
        drawer: Drawer(),
    );
  }
  Widget nullImage(){
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
