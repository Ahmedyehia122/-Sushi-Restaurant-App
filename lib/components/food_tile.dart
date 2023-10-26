import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_restaurant_app/model/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  void Function()? onTap;
  FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            Image.asset(
              food.imagePath,
              height: 140,
            ),

            //text
            Text(food.name, style: GoogleFonts.dmSerifDisplay(fontSize: 20)),

            //price + rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text(
                    '\$' + food.price,
                  ),

                  Row(
                    children: [
                      //rating
                      Icon(Icons.star, color: Colors.yellow[900]),
                      Text(food.rating,
                          style: TextStyle(color: Colors.grey[700]))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
