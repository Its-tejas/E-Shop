import 'package:e_shop/Models/Product.dart';
import 'package:e_shop/Provider/cart_provider.dart';
import 'package:e_shop/Screens/Cart/check_out_box.dart';
import 'package:e_shop/Screens/nav_bar_screen.dart';
import 'package:e_shop/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    // for quantity
    productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQuantity(index)
                : provider.decrementQuantity(index);
          });
        },
        child: Icon(icon, size: 20,),
      );
    }

    return Scaffold(
      backgroundColor: kcontentColor,
      bottomSheet: const CheckOutBox(),
      body: SafeArea(

          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(15)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavBarScreen(),
                          ));
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text('My Cart',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                const SizedBox(),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: finalList.length,
            itemBuilder: (context, index) {
              final cartItems = finalList[index];
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              color: kcontentColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(cartItems.image),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItems.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                cartItems.category,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey.shade400),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$${cartItems.price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 35,
                      top: 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                finalList.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete,
                                  color: Colors.red, size: 25)),

                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: kcontentColor,
                        border:
                            Border.all(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child:  Row(
                      children: [
                        const SizedBox(width: 10),
                        productQuantity(Icons.add, index),
                        Text(cartItems.quantity.toString(), style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                        const SizedBox(width: 10),
                        productQuantity(Icons.remove, index),
                      ],
                    )),
                      ],
                    ),
                  ),
                ],
              );
            },
          ))
        ],
      )),
    );
  }
}
