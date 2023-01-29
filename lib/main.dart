import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/home/screens/home_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/auth/widgets/bottom_bar.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Userprovider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<Userprovider>(context).user.token.toString());
    print("hi");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazon Clone',
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.greyBackgroundColor,
            colorScheme: const ColorScheme.light(
              primary: GlobalVariables.secondaryColor,
            ),
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<Userprovider>(context).user.token.isNotEmpty
            ? const BottomBar()
            : const AuthScreen());
  }
}
