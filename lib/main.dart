import 'package:assignment_first_login/Pages/Home/Home_Page.dart';
import 'package:assignment_first_login/Provider/List_Item_State.dart';
import 'package:assignment_first_login/Provider/Login_State.dart';
import 'package:assignment_first_login/Provider/Obscure_State.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginState()),
        ChangeNotifierProvider(create: (_) => ListItemState()),
        ChangeNotifierProvider(create: (_) => ObscureState()),
      ],
      child: MaterialApp(
        title: 'Assiment First',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
        home: const HomePage(),
        // home: const LogInPage(),
      ),
    );
  }
}
