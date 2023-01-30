import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';

class BelowAppbar extends StatelessWidget {
  const BelowAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userprovider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: "Hello, ",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: user.name.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
