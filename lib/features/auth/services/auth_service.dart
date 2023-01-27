import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void SignUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          password: password,
          address: '',
          type: '',
          token: '',
          email: email);
      http.Response response = await http.post(Uri.parse('$url/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'charset': 'UTF-8'
          });
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackbar(
              context,
              "Account has been Created. Login with the Same credentials",
            );
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
