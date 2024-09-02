import 'package:e_shop/Screens/Home/Widget/category.dart';
import 'package:e_shop/Screens/Home/Widget/image_slider.dart';
import 'package:e_shop/Screens/Home/Widget/product_cart.dart';
import 'package:flutter/material.dart';

import 'package:e_shop/Screens/Home/Widget/custom_search_bar.dart';
import '../../Models/Product.dart';
import 'Widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              const CustomAppBar(),
              const SizedBox(height: 20,),
              const CustomSearchBar(),
              const SizedBox(height: 20,),
              ImageSlider(
                currentSlide: currentSlider,
                  onChange: (value) {
                    setState(() {
                      currentSlider = value;
                    });
                  }),
              const SizedBox(height: 20,),
              const Category(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Special For You', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),),
                  Text('See all', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                ],
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },

              )

            ],
          ),
        ),
      ),
    );
  }
}