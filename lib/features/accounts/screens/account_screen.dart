import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/accounts/widgets/below_nav_bar.dart';
import 'package:amazon_clone/features/accounts/widgets/orders.dart';
import 'package:amazon_clone/features/accounts/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Image.asset(
                "assets/images/amazon_in.png",
                width: 120,
                height: 45,
                color: Colors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15, left: 30, top: 11),
              child: Row(children: const [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.notifications_outlined),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.search_outlined),
                )
              ]),
            ),
          ]),
        ),
      ),
      body: Column(children: const [
        BelowAppbar(),
        SizedBox(
          height: 10,
        ),
        TopButtons(),
        SizedBox(
          height: 20,
        ),
        Orders()
      ]),
    );
  }
}
