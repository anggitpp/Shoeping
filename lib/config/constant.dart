import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppSizes {
  static const double defaultMargin = 24;
  static double phoneWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double phoneWidthMargin(context) {
    return MediaQuery.of(context).size.width - 2 * defaultMargin;
  }

  static double phoneHeight(context) {
    return MediaQuery.of(context).size.height;
  }
}

final userCollection = FirebaseFirestore.instance.collection('users');
const baseURL = 'https://shoeping.buildwithapp.net';
const apiURL = '$baseURL/api';
const imageAPIURL = '$baseURL/storage/';
