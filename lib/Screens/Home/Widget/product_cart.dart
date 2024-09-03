import 'package:e_shop/Models/Product.dart';
import 'package:e_shop/Provider/favourite_provider.dart';
import 'package:e_shop/Screens/Detail/detail_screen.dart';
import 'package:e_shop/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(product: product,),));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: kcontentColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Hero(
                    tag: product.image,
                    child: Image.asset(product.image,
                        width: 130, height: 130, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '\$ ${product.price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    Row(
                        children: List.generate(
                      product.colors.length,
                      (index) => Container(
                        width: 18,
                        height: 18,
                        margin: EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                            color: product.colors[index],
                            shape: BoxShape.circle),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
          Positioned(child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(10),
                  )
                ),
              child: GestureDetector(onTap: () {
                provider.toggleFavourite(product);
              },
              child: Icon(provider.isExist(product) ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
                  size: 22),),
            ),
          ))
        ],
      ),
    );
  }
}
