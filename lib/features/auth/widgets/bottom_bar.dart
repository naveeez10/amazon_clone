import 'package:amazon_clone/constants/global_variables.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom-bar';
  const BottomBar({super.key});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomnavbarwidth = 42;
  double bottomnavbarborderwidth = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomnavbarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomnavbarborderwidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomnavbarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomnavbarborderwidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outline_outlined,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomnavbarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomnavbarborderwidth,
                  ),
                ),
              ),
              child: const Badge(
                badgeContent: Text("2"),
                badgeStyle: BadgeStyle(
                    badgeColor: GlobalVariables.backgroundColor, elevation: 0),
                child: Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
