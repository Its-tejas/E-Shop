import 'package:e_shop/Provider/favourite_provider.dart';
import 'package:e_shop/constants.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget{
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {

    final provider = FavouriteProvider.of(context);
    final finalList = provider.favourite;

  return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
          backgroundColor: kcontentColor,
          title: Text('Favourite', style: TextStyle(fontWeight: FontWeight.bold),), centerTitle: true),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  final favouriteItems = finalList[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 85,
                                width: 85,
                                decoration: BoxDecoration(
                                  color: kcontentColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(favouriteItems.image),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favouriteItems.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    favouriteItems.category,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey.shade400),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '\$${favouriteItems.price}',
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
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ))
        ],
      ),
    );
  }
}