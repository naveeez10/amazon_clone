import 'dart:convert';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/auth/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void SignInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(Uri.parse('$url/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'charset': 'UTF-8'
          });
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            // ignore: use_build_context_synchronously
            Provider.of<Userprovider>(context, listen: false)
                .setUser(response.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(response.body)['token']);

            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
              (route) => false,
            );
          });
      void getUserData(
        BuildContext context,
      ) async {
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? token = prefs.getString('x-auth-token');

          if (token == null) {
            prefs.setString('x-auth-screen', '');
          }

          var tokenRes = await http
              .post(Uri.parse('$url/isTokenValid'), headers: <String, String>{
            'Content-Type': "application/json; charset=UTF-8",
            'x-auth-token': token!,
          });

          var response = jsonDecode(tokenRes.body);

          if (response == true) {
            // implement api to get user data
          }
        } catch (e) {}
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
