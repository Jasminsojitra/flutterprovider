
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterprovider/Model/UserRespo.dart';
import 'package:flutterprovider/Repository/UserRepo.dart';

import '../main.dart';

class LoginProvider with ChangeNotifier {

  UserRespo userRespo=UserRespo();
  UserRepo _userrepo= UserRepo();
  bool isLoading=false;
  LoginProvider(){
    _userrepo=UserRepo();
  }
  Future<bool> loginUser(String email,String Password) async {
    isLoading=true;
    notifyListeners();
    try {
      dynamic body =jsonEncode({
        "password":"$Password",
        "version":"2.9.8",
        "email":"$email"
      });
      userRespo = await _userrepo.loginUser(body);
      print(userRespo);
      notifyListeners();
      if(userRespo!=null){
        prefs.setBool("IsLogin", true);
        prefs.setString("Token",userRespo.token??"");
        isLoading=false;
        return true;
      }
      else {
        isLoading=false;
        return false;
      }
    } catch (e) {
      isLoading=false;
      notifyListeners();
      return false;
    }
  }
}