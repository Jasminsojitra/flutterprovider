import 'dart:convert';

UserDetail userDetailFromJson(String str) => UserDetail.fromJson(json.decode(str));

String userDetailToJson(UserDetail data) => json.encode(data.toJson());

class UserDetail {
  UserDetail({
    this.firstName,
    this.lastName,
    this.userAvatar,
    this.dob,
    this.name,
    this.userId,
    this.userGuid,
    this.email,
    this.appDetails,
    this.status,
    this.gender,
    this.role,
    this.history,
    this.questionnaire,
    this.apptLength,
    this.apptStartTime,
    this.apptEndTime,
    this.secureMessage,
    this.patientCreditCardRequired,
    this.connectionRequests,
    this.apptRequests,
    this.phone,
    this.lastActive,
    this.ccPaymentAccepted,
    this.historyUpdatedAt,
    this.questionnaireUpdatedAt,
    this.userDetail,
    this.paymentAccountInfo,
    this.connectionStatus,
    this.favorite,
    this.maManageOrders,
    this.isRpmEnabled,
    this.isCustomizedVitalsThresholds,
    this.vitals,
    this.orders,
    this.documents,
    this.calls,
  });

  String? firstName;
  String? lastName;
  String? userAvatar;
  String? dob;
  String? name;
  int? userId;
  String? userGuid;
  String? email;
  AppDetails? appDetails;
  String? status;
  String? gender;
  String? role;
  List<History>? history;
  Questionnaire? questionnaire;
  dynamic? apptLength;
  dynamic? apptStartTime;
  dynamic? apptEndTime;
  bool? secureMessage;
  bool? patientCreditCardRequired;
  bool? connectionRequests;
  bool? apptRequests;
  String? phone;
  DateTime? lastActive;
  bool? ccPaymentAccepted;
  DateTime? historyUpdatedAt;
  DateTime? questionnaireUpdatedAt;
  UserDetailClass? userDetail;
  PaymentAccountInfo? paymentAccountInfo;
  String? connectionStatus;
  bool? favorite;
  bool? maManageOrders;
  bool? isRpmEnabled;
  bool? isCustomizedVitalsThresholds;
  List<Call>? vitals;
  List<Call>? orders;
  List<Call>? documents;
  List<Call>? calls;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    firstName: json["first_name"],
    lastName: json["last_name"],
    userAvatar: json["user_avatar"],
    dob: json["dob"],
    name: json["name"],
    userId: json["user_id"],
    userGuid: json["user_guid"],
    email: json["email"],
    appDetails: AppDetails.fromJson(json["app_details"]),
    status: json["status"],
    gender: json["gender"],
    role: json["role"],
    history: List<History>.from(json["history"].map((x) => History.fromJson(x))),
    questionnaire: Questionnaire.fromJson(json["questionnaire"]),
    apptLength: json["appt_length"],
    apptStartTime: json["appt_start_time"],
    apptEndTime: json["appt_end_time"],
    secureMessage: json["secure_message"],
    patientCreditCardRequired: json["patient_credit_card_required"],
    connectionRequests: json["connection_requests"],
    apptRequests: json["appt_requests"],
    phone: json["phone"],
    lastActive: DateTime.parse(json["last_active"]),
    ccPaymentAccepted: json["cc_payment_accepted"],
    historyUpdatedAt: DateTime.parse(json["history_updated_at"]),
    questionnaireUpdatedAt: DateTime.parse(json["questionnaire_updated_at"]),
    userDetail: UserDetailClass.fromJson(json["user_detail"]),
    paymentAccountInfo: PaymentAccountInfo.fromJson(json["payment_account_info"]),
    connectionStatus: json["connection_status"],
    favorite: json["favorite"],
    maManageOrders: json["ma_manage_orders"],
    isRpmEnabled: json["is_rpm_enabled"],
    isCustomizedVitalsThresholds: json["is_customized_vitals_thresholds"],
    vitals: List<Call>.from(json["vitals"].map((x) => Call.fromJson(x))),
    orders: List<Call>.from(json["orders"].map((x) => Call.fromJson(x))),
    documents: List<Call>.from(json["documents"].map((x) => Call.fromJson(x))),
    calls: List<Call>.from(json["calls"].map((x) => Call.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "user_avatar": userAvatar,
    "dob": dob,
    "name": name,
    "user_id": userId,
    "user_guid": userGuid,
    "email": email,
    "app_details": appDetails!.toJson(),
    "status": status,
    "gender": gender,
    "role": role,
    "history": List<dynamic>.from(history!.map((x) => x.toJson())),
    "questionnaire": questionnaire!.toJson(),
    "appt_length": apptLength,
    "appt_start_time": apptStartTime,
    "appt_end_time": apptEndTime,
    "secure_message": secureMessage,
    "patient_credit_card_required": patientCreditCardRequired,
    "connection_requests": connectionRequests,
    "appt_requests": apptRequests,
    "phone": phone,
    "last_active": lastActive!.toIso8601String(),
    "cc_payment_accepted": ccPaymentAccepted,
    "history_updated_at": historyUpdatedAt!.toIso8601String(),
    "questionnaire_updated_at": questionnaireUpdatedAt!.toIso8601String(),
    "user_detail": userDetail!.toJson(),
    "payment_account_info": paymentAccountInfo!.toJson(),
    "connection_status": connectionStatus,
    "favorite": favorite,
    "ma_manage_orders": maManageOrders,
    "is_rpm_enabled": isRpmEnabled,
    "is_customized_vitals_thresholds": isCustomizedVitalsThresholds,
    "vitals": List<dynamic>.from(vitals!.map((x) => x.toJson())),
    "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
    "documents": List<dynamic>.from(documents!.map((x) => x.toJson())),
    "calls": List<dynamic>.from(calls!.map((x) => x.toJson())),
  };
}

class AppDetails {
  AppDetails({
    this.version,
    this.platform,
  });

  String? version;
  String? platform;

  factory AppDetails.fromJson(Map<String, dynamic> json) => AppDetails(
    version: json["version"],
    platform: json["platform"],
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "platform": platform,
  };
}

class Call {
  Call({
    this.count,
    this.lastValue,
    this.lastDate,
    this.type,
  });

  int? count;
  dynamic? lastValue;
  DateTime? lastDate;
  String? type;

  factory Call.fromJson(Map<String, dynamic> json) => Call(
    count: json["count"],
    lastValue: json["last_value"],
    lastDate: json["last_date"] == null ? null : DateTime.parse(json["last_date"]),
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "last_value": lastValue,
    "last_date": lastDate == null ? null : lastDate!.toIso8601String(),
    "type": type == null ? null : type,
  };
}

class LastValueClass {
  LastValueClass({
    this.directionsQuantity,
    this.directionsSelectOne,
    this.directionsSelectTwo,
    this.dispenseQuantity,
    this.doNotSubstitute,
    this.label,
    this.refillQuantity,
    this.rxDrugName,
    this.rxForm,
    this.rxMetric,
    this.rxStrength,
  });

  int? directionsQuantity;
  DirectionsSelectOneEnum? directionsSelectOne;
  DirectionsSelectTwoEnum? directionsSelectTwo;
  int? dispenseQuantity;
  bool? doNotSubstitute;
  bool? label;
  int? refillQuantity;
  String? rxDrugName;
  String? rxForm;
  RxMetric? rxMetric;
  int? rxStrength;

  factory LastValueClass.fromJson(Map<String, dynamic> json) => LastValueClass(
    directionsQuantity: json["directions_quantity"],
    directionsSelectOne: directionsSelectOneEnumValues.map![json["directions_select_one"]],
    directionsSelectTwo: directionsSelectTwoEnumValues.map![json["directions_select_two"]],
    dispenseQuantity: json["dispense_quantity"],
    doNotSubstitute: json["do_not_substitute"],
    label: json["label"],
    refillQuantity: json["refill_quantity"],
    rxDrugName: json["rx_drug_name"],
    rxForm: json["rx_form"],
    rxMetric: rxMetricValues.map![json["rx_metric"]],
    rxStrength: json["rx_strength"],
  );

  Map<String, dynamic> toJson() => {
    "directions_quantity": directionsQuantity,
    "directions_select_one": directionsSelectOneEnumValues.reverse![directionsSelectOne],
    "directions_select_two": directionsSelectTwoEnumValues.reverse![directionsSelectTwo],
    "dispense_quantity": dispenseQuantity,
    "do_not_substitute": doNotSubstitute,
    "label": label,
    "refill_quantity": refillQuantity,
    "rx_drug_name": rxDrugName,
    "rx_form": rxForm,
    "rx_metric": rxMetricValues.reverse![rxMetric],
    "rx_strength": rxStrength,
  };
}

enum DirectionsSelectOneEnum { PO, PR, INHALATION, TOPICAL }

final directionsSelectOneEnumValues = EnumValues({
  "Inhalation": DirectionsSelectOneEnum.INHALATION,
  "PO": DirectionsSelectOneEnum.PO,
  "PR": DirectionsSelectOneEnum.PR,
  "Topical": DirectionsSelectOneEnum.TOPICAL
});

enum DirectionsSelectTwoEnum { QD, PRN }

final directionsSelectTwoEnumValues = EnumValues({
  "PRN": DirectionsSelectTwoEnum.PRN,
  "QD": DirectionsSelectTwoEnum.QD
});

enum RxMetric { MG, MCG }

final rxMetricValues = EnumValues({
  "mcg": RxMetric.MCG,
  "mg": RxMetric.MG
});

class History {
  History({
    this.isYes,
    this.question,
    this.reason,
  });

  bool? isYes;
  String? question;
  String? reason;

  factory History.fromJson(Map<String, dynamic> json) => History(
    isYes: json["isYes"],
    question: json["question"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "isYes": isYes,
    "question": question,
    "reason": reason,
  };
}

class PaymentAccountInfo {
  PaymentAccountInfo({
    this.isCcCaptured,
    this.isDefaultCardValid,
    this.savedCardsCount,
  });

  bool? isCcCaptured;
  bool? isDefaultCardValid;
  int? savedCardsCount;

  factory PaymentAccountInfo.fromJson(Map<String, dynamic> json) => PaymentAccountInfo(
    isCcCaptured: json["is_cc_captured"],
    isDefaultCardValid: json["is_default_card_valid"],
    savedCardsCount: json["saved_cards_count"],
  );

  Map<String, dynamic> toJson() => {
    "is_cc_captured": isCcCaptured,
    "is_default_card_valid": isDefaultCardValid,
    "saved_cards_count": savedCardsCount,
  };
}

class Questionnaire {
  Questionnaire({
    this.medication,
    this.surgeries,
    this.pastMedicalHistory,
  });

  Medication? medication;
  PastMedicalHistory? surgeries;
  PastMedicalHistory? pastMedicalHistory;

  factory Questionnaire.fromJson(Map<String, dynamic> json) => Questionnaire(
    medication: Medication.fromJson(json["Medication"]),
    surgeries: PastMedicalHistory.fromJson(json["Surgeries"]),
    pastMedicalHistory: PastMedicalHistory.fromJson(json["Past Medical History"]),
  );

  Map<String, dynamic> toJson() => {
    "Medication": medication!.toJson(),
    "Surgeries": surgeries!.toJson(),
    "Past Medical History": pastMedicalHistory!.toJson(),
  };
}

class Medication {
  Medication({
    this.items,
  });

  List<MedicationItem>? items;

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
    items: List<MedicationItem>.from(json["items"].map((x) => MedicationItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class MedicationItem {
  MedicationItem({
    this.direction,
    this.directionType1,
    this.directionType2,
    this.drugName,
    this.strength,
    this.unit,
  });

  String? direction;
  DirectionsSelectOneEnum? directionType1;
  DirectionsSelectTwoEnum? directionType2;
  String? drugName;
  String? strength;
  RxMetric? unit;

  factory MedicationItem.fromJson(Map<String, dynamic> json) => MedicationItem(
    direction: json["direction"],
    directionType1: directionsSelectOneEnumValues.map![json["directionType1"]],
    directionType2: directionsSelectTwoEnumValues.map![json["directionType2"]],
    drugName: json["drugName"],
    strength: json["strength"],
    unit: rxMetricValues.map![json["unit"]],
  );

  Map<String, dynamic> toJson() => {
    "direction": direction,
    "directionType1": directionsSelectOneEnumValues.reverse![directionType1],
    "directionType2": directionsSelectTwoEnumValues.reverse![directionType2],
    "drugName": drugName,
    "strength": strength,
    "unit": rxMetricValues.reverse![unit],
  };
}

class PastMedicalHistory {
  PastMedicalHistory({
    this.items,
  });

  List<PastMedicalHistoryItem>? items;

  factory PastMedicalHistory.fromJson(Map<String, dynamic> json) => PastMedicalHistory(
    items: List<PastMedicalHistoryItem>.from(json["items"].map((x) => PastMedicalHistoryItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class PastMedicalHistoryItem {
  PastMedicalHistoryItem({
    this.additionalInformation,
    this.title,
  });

  String? additionalInformation;
  String? title;

  factory PastMedicalHistoryItem.fromJson(Map<String, dynamic> json) => PastMedicalHistoryItem(
    additionalInformation: json["additionalInformation"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "additionalInformation": additionalInformation,
    "title": title,
  };
}

class UserDetailClass {
  UserDetailClass({
    this.signature,
    this.data,
  });

  dynamic? signature;
  Data? data;

  factory UserDetailClass.fromJson(Map<String, dynamic> json) => UserDetailClass(
    signature: json["signature"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "signature": signature,
    "data": data!.toJson(),
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap! == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
