import 'package:flutter/material.dart';
import 'package:flutterprovider/Model/Dashboard.dart';
import 'package:flutterprovider/Model/UserDetail.dart';
import 'package:flutterprovider/Repository/UserRepo.dart';
import 'package:flutterprovider/network_module/api_response.dart';

class HomeProvider with ChangeNotifier {

  ApiResponse<Dashboard> dashboardDataInfo=ApiResponse<Dashboard>();
  ApiResponse<UserDetail> userDetail=ApiResponse<UserDetail>();

  ApiResponse<Dashboard> get DashboardInfo=> dashboardDataInfo;
  UserRepo _userrepo=UserRepo();

  HomeProvider(BuildContext context){
    _userrepo=UserRepo();
    dashboardData();
  }
  Future<void> dashboardData() async {
    try {
      dashboardDataInfo=ApiResponse.loading("Loading");
      notifyListeners();
      var datas= await _userrepo.getDashboardData();
      dashboardDataInfo=ApiResponse.completed(datas);
      notifyListeners();
    } catch (e) {
      dashboardDataInfo=ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> userData(String id) async {
    try {
      userDetail=ApiResponse.loading("Loading");
      notifyListeners();
      var datas= await _userrepo.getUserDetail(id);
      userDetail=ApiResponse.completed(datas);
      notifyListeners();
    } catch (e) {
      userDetail=ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}