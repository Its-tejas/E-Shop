import 'package:e_shop/Models/Product.dart';
import 'package:e_shop/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailItems extends StatelessWidget{
  final Product product;

  const DetailItems({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 25,
        ),),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$ ${product.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),),
                const SizedBox(height: 10),
                // for rating
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kprimaryColor
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 3),
                          Text(product.rate.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white
                            ),),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(product.review,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                      ),),
                  ],
                )
              ],
            ),
            const Spacer(),
            const Text.rich(TextSpan(
              text: 'Seller: ',
              style: TextStyle(fontSize: 16)
            )),
            Text.rich(TextSpan(
                text: product.seller,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
            )),

          ],
        )
      ],
    );
  }

}