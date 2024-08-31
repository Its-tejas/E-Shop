import 'package:e_shop/Models/category.dart';
import 'package:flutter/cupertino.dart';

class Category extends StatelessWidget{
  const Category({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 130,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:  AssetImage(categories[index].image),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              const SizedBox(height: 5,),
              Text(categories[index].title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
            ],
          );
        },
        separatorBuilder : (context, index) => const SizedBox(width: 20,),
    ),
    );
  }

}