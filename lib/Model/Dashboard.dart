class Dashboard {
  bool? success;
  int? count;
  Null prev;
  String? next;
  List<Result>? result=[];

  Dashboard({this.success, this.count, this.prev, this.next, this.result});

  Dashboard.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    prev = json['prev'];
    next = json['next'];

    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['count'] = this.count;
    data['prev'] = this.prev;
    data['next'] = this.next;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? userId;
  String? userGuid;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? name;
  String? status;
  String? userAvatar;
  String? lastActive;
  String? dob;
  String? gender;
  String? role;
  bool? favorite=false;
  PaymentAccountInfo? paymentAccountInfo;

  Result(
      {this.userId,
        this.userGuid,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.name,
        this.status,
        this.userAvatar,
        this.lastActive,
        this.dob,
        this.gender,
        this.role,
        this.favorite,
        this.paymentAccountInfo});

  Result.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userGuid = json['user_guid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
    status = json['status'];
    userAvatar = json['user_avatar'];
    lastActive = json['last_active'];
    dob = json['dob'];
    gender = json['gender'];
    role = json['role'];
    favorite = json['favorite'];
    paymentAccountInfo = json['payment_account_info'] != null
        ? new PaymentAccountInfo.fromJson(json['payment_account_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_guid'] = this.userGuid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['status'] = this.status;
    data['user_avatar'] = this.userAvatar;
    data['last_active'] = this.lastActive;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['favorite'] = this.favorite;
    if (this.paymentAccountInfo != null) {
      data['payment_account_info'] = this.paymentAccountInfo!.toJson();
    }
    return data;
  }
}

class PaymentAccountInfo {
  bool isCcCaptured=false;
  bool isDefaultCardValid=false;
  int? savedCardsCount;

  PaymentAccountInfo(
      {required this.isCcCaptured, required this.isDefaultCardValid, this.savedCardsCount});

  PaymentAccountInfo.fromJson(Map<String, dynamic> json) {
    isCcCaptured = json['is_cc_captured'];
    isDefaultCardValid = json['is_default_card_valid'];
    savedCardsCount = json['saved_cards_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_cc_captured'] = this.isCcCaptured;
    data['is_default_card_valid'] = this.isDefaultCardValid;
    data['saved_cards_count'] = this.savedCardsCount;
    return data;
  }
}