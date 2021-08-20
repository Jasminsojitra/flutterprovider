
import 'package:flutter/foundation.dart';

class APIBase{
  static String get baseURL {
    if (kReleaseMode) {
      return "https://jsonplaceholder.typicode.com";
    } else {
      return "https://jsonplaceholder.typicode.com";
    }

  }
}