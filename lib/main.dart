
import 'package:boarding1/services/bottom_provider.dart';
import 'package:boarding1/services/provider.dart';
import 'package:boarding1/services/slider_provider.dart';
import 'package:boarding1/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarouselIndexProvider()),
        ChangeNotifierProvider(create: (_)=> BottomNavIndexProvider()),
        ChangeNotifierProvider(create: (_)=>ProductProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
