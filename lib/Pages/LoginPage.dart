import 'package:flutter/material.dart';
import 'package:flutterprovider/Constant/GlobalConst.dart';
import 'package:flutterprovider/Controller/LoginController.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading=false;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController= TextEditingController();
  TextEditingController pwdInputController= TextEditingController();
  String? emailValidator(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if(value=="")
      return 'Please Enter Email';
    if (!regex.hasMatch(value!)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value) {
    Pattern pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{8,}$';
    RegExp regex = new RegExp(pattern.toString());
    if(value=="")
      return 'Please Enter Password';
    if (!regex.hasMatch(value!)) {
      return 'Password Must contain 8 character with 1 Upper case 1 Lower Case and 1 Digits';
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    emailInputController.clear();
    pwdInputController.clear();
    super.dispose();
  }

  bool isVisible=false;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    Size size = MediaQuery.of(context).size;
    return
      Scaffold(
        body: Form(
          key: _registerFormKey,
          child:Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: emailInputController,
                  cursorColor: mainColor,
                  validator: emailValidator,
                  onFieldSubmitted: (value){
                    focusNode.nextFocus();
                  },
                  textInputAction:TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),

                SizedBox(height: size.height * 0.03),
                TextFormField(
                  controller: pwdInputController,
                  obscureText: !isVisible,
                  validator: passwordValidator,
                  cursorColor: mainColor,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: (isVisible)?
                    GestureDetector(
                      child: Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onTap: (){
                        setState(() {
                          isVisible=!isVisible;
                        });
                      },
                    ):
                    GestureDetector(
                      child: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      ),
                      onTap: (){
                        setState(() {
                          isVisible=!isVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: mainColor
                  ),
                  height: 45,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width *0.70,
                  child:Provider.of<LoginProvider>(context, listen: true).isLoading?
                      Center(child: Padding(child: CircularProgressIndicator(color: Colors.white,),padding: EdgeInsets.all(5),))
                      :
                  TextButton(
                    child: Text("Login",style: TextStyle(color: Colors.white),),
                    onPressed: ()async{
                    if (_registerFormKey.currentState!.validate()) {
                      var respo=await Provider.of<LoginProvider>(context, listen: false).loginUser(emailInputController.text, pwdInputController.text);
                     if(respo){
                       Navigator.pushReplacement(
                           context, MaterialPageRoute(builder: (context) => HomePage()));
                     }
                     else{
                       final snackBar = SnackBar(content: Text('Email id and password is wrong!!'));
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                     }
                    }
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.03),

              ],
            ),
          ),
        ),
      );
  }
}
