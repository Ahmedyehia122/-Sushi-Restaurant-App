import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant_app/components/food_tile.dart';
import 'package:sushi_restaurant_app/components/my_button.dart';
import 'package:sushi_restaurant_app/model/shop.dart';
import 'package:sushi_restaurant_app/pages/cart_page.dart';
import 'package:sushi_restaurant_app/pages/food_details_page.dart';
import 'package:sushi_restaurant_app/theme/colors.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    //get the shop and menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    //Navigate to food item detail page
    void navigateToFoodDetails(int index) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FoodDetailsPage(food: foodMenu[index]),
      ));
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        actions: [
          //cart button
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('cartpage');
              },
              icon: const Icon(Icons.shopping_cart)),
        ],
        leading: const Icon(
          Icons.menu,
        ),
        elevation: 0,
        title: const Text(
          'Tokyo',
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    //promo message
                    Text(
                      'Get 32% promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //redeem button
                    MyButton(
                      name: 'Redeem',
                      onTap: () {},
                    )
                  ],
                ),
                //image
                Image.asset(
                  'lib/images/many_sushi.png',
                  height: 100,
                )
              ],
            ),
          ),

          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, size: 30),
                prefixIconColor: Colors.grey,
                hintText: 'Search here..',
                hintStyle: const TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white)),
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          //menu list
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
            child: Text(
              'Food Menu',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) {
                return FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetails(index),
                );
              },
            ),
          ),

          //popular food
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //image
                    Image.asset(
                      'lib/images/salmon_eggs.png',
                      height: 60,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text('Salmon Eggs',
                            style: GoogleFonts.dmSerifDisplay(fontSize: 18)),
                        //price
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$ 21.00',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),
                //heart icon
                const Icon(Icons.favorite_outline)
              ],
            ),
          )
        ],
      ),
    );
  }
}
