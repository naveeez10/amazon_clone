import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';

class Userprovider extends ChangeNotifier {
  User _user = User(
    id: "",
    name: "",
    password: "",
    address: "",
    type: "",
    token: "",
    email: "",
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
