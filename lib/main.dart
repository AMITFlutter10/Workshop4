import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workshop4/controller/remote/dio/dio_helper.dart';
import 'package:workshop4/view/pages/home_page.dart';

void main()async {
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
      return   MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
    );
        }
        );
  }
}
