

import 'package:flutterprovider/Model/Dashboard.dart';
import 'package:flutterprovider/Model/UserDetail.dart';
import 'package:flutterprovider/Model/UserRespo.dart';
import 'package:flutterprovider/network_module/http_client.dart';

class UserRepo {

  Future<UserRespo> loginUser(dynamic user) async {
    final response = await HttpClient.instance.postData("http://44.238.77.66:8082/login",user);
    //print("Response - $response");
    UserRespo userRespo = UserRespo.fromJson(response);
    return userRespo;
  }

  Future<Dashboard> getDashboardData() async {
    final response = await HttpClient.instance.fetchData('http://44.238.77.66:8082/api/associations-v2?paginate=true&page=1&page_size=4&medical_assistant=false');
    //print("Response - $response");
    var respo=Dashboard.fromJson(response);
    //final jsonData = response as List;
    //List<Dashboard> responses = jsonData.map((tagJson) => Dashboard.fromJson(tagJson)).toList();
    return respo;
  }

  Future<UserDetail> getUserDetail(String id) async {
    final response = await HttpClient.instance.fetchData('http://44.238.77.66:8082/api/users-v2/$id');
    //print("Response - $response");
    var respo=UserDetail.fromJson(response);
    //final jsonData = response as List;
    //List<Dashboard> responses = jsonData.map((tagJson) => Dashboard.fromJson(tagJson)).toList();
    return respo;

  }

}