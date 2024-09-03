import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Models/Product.dart';
import '../../../Provider/favourite_provider.dart';
import '../../../constants.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: kcontentColor,
                  padding: const EdgeInsets.all(15)),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          const Spacer(),
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: kcontentColor,
                  padding: const EdgeInsets.all(15)),
              onPressed: () {},
              icon: const Icon(Icons.share_outlined)),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: kcontentColor, padding: EdgeInsets.all(15)),
              onPressed: () {
                provider.toggleFavourite(product);
              },
              icon: Icon(provider.isExist(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.black,
              size: 25)
          ),
        ],
      ),
    );
  }
}
