import 'package:e_shop/Screens/Cart/cart_screen.dart';
import 'package:e_shop/Screens/Home/home_screen.dart';
import 'package:e_shop/Screens/favourite.dart';
import 'package:e_shop/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatefulWidget{
  const NavBarScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {

  int currentIndex = 2;
  List screens = const [
    Scaffold(),
    Favourite(),
    HomeScreen(),
    CartScreen(),
    Scaffold(),
  ];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(Icons.home, color: Colors.white, size: 35,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  icon: Icon(
                      Icons.grid_view_outlined,
                    size: 30,
                    color: currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
                  )
              ),

              IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
                  )
              ),
              const SizedBox(width: 15,),
              IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
                  )
              ),

              IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 4;
                    });
                  },
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    color: currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
                  )
              ),

            ],
        ),

      ),
      body: screens[currentIndex],
    );
  }

}