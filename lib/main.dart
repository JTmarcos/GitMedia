import 'package:flutter/material.dart';
import 'package:gitmedia/data/components/custom_text_form.dart';
import 'package:gitmedia/routes/routes.dart';
import 'package:gitmedia/screen/first_page.dart';
import 'package:gitmedia/screen/followers_page.dart';
import 'package:gitmedia/screen/search_page.dart';
import 'package:gitmedia/screen/unfided_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
        initialRoute: Routes.firstpage,
      routes: {
         Routes.searchpage : (_) => const HomePage(),
         Routes.firstpage : (_) => FirstPage(),
         Routes.unfindedpage : (_) =>  UnfindedPage(), 
         Routes.followerPage : (_) => const FollowersPage()
      },
    );
  }
}
