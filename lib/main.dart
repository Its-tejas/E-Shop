import 'package:e_shop/Provider/cart_provider.dart';
import 'package:e_shop/Provider/favourite_provider.dart';
import 'package:e_shop/Screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context) => FavouriteProvider())
  ],
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NavBarScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
  
}
