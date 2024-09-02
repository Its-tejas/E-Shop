import 'package:e_shop/Models/Product.dart';
import 'package:e_shop/Screens/Detail/widgets/add_to_cart.dart';
import 'package:e_shop/Screens/Detail/widgets/detail_app_bar.dart';
import 'package:e_shop/Screens/Detail/widgets/detail_description.dart';
import 'package:e_shop/Screens/Detail/widgets/detail_image_slider.dart';
import 'package:e_shop/Screens/Detail/widgets/detail_items.dart';
import 'package:e_shop/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      // for add to cart
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    children: [
            const DetailAppBar(),
            DetailImageSlider(
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
                image: widget.product.image),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                        duration: const Duration(microseconds: 300),
                        width: currentImage == index ? 15 : 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentImage == index
                                ? Colors.black
                                : Colors.transparent,
                            border: Border.all(
                              color: Colors.black,
                            )),
                      )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              padding: const EdgeInsets.only(
                  left: 20, bottom: 100, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // for product name, price, rating and seller
                  DetailItems(product: widget.product),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Color',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: List.generate(
                          widget.product.colors.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentColor = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentColor == index
                                      ? Colors.white
                                      : widget.product.colors[index],
                                  border: currentColor == index
                                      ? Border.all(
                                          color: widget.product.colors[index])
                                      : null),
                              padding: currentColor == index
                                  ? const EdgeInsets.all(2)
                                  : null,
                              margin: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: widget.product.colors[index],
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // for desc
                  DetailDescription(desc: widget.product.description),
                ],
              ),
            )
                    ],
                  ),
          )),
    );
  }
}
