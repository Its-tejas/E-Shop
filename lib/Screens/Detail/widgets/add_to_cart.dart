import 'package:e_shop/constants.dart';
import 'package:flutter/material.dart';

import '../../../Models/Product.dart';

class AddToCart extends StatefulWidget {
  final Product product;

  const AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        iconSize: 18,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      currentIndex.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        onPressed: () {},
                        iconSize: 18,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: const Text('Add to Cart',style:  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
