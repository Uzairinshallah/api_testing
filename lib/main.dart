
import 'package:flutter/material.dart';
import 'package:api_testing/multipart_home.dart';

import 'homepage_fetch.dart';
import 'homepage_post.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePageFetch(),
      // home: const HomepagePost(),
      // home: MyHomePageFetch(),
    );
  }


}