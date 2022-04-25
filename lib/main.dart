import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentang_anak/common/constant.dart';
import 'package:tentang_anak/dio/dio_client.dart';
import 'package:tentang_anak/home.dart';
import 'package:tentang_anak/home_viewmodel.dart';
import 'package:tentang_anak/network/api_service.dart';
import 'package:tentang_anak/repository/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(create: (_)=> HomeViewModel())
    //     ],
    //     child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       title: 'Tentang Anak',
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //       ),
    //       home: const HomeScreen(),
    //     ));
    return MultiProvider(
      providers: [
        Provider<Repository>.value(
            value: Repository(
                ApiService(DioClient(apiBaseUrl: Constant.API_BASE_URL))))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tentang Anak',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
    return Provider<Repository>.value(
      value:
          Repository(ApiService(DioClient(apiBaseUrl: Constant.API_BASE_URL))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tentang Anak',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
