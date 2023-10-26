import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant_app/components/my_button.dart';
import 'package:sushi_restaurant_app/model/food.dart';
import 'package:sushi_restaurant_app/model/shop.dart';
import 'package:sushi_restaurant_app/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //remove from cart
    void removeFromCart(Food food) {
      //get acess to shop

      final shop = context.read<Shop>();
      //remove from cart
      shop.removeFromCart(food);
    }

    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                title: const Text('My CArt'),
                centerTitle: true,
                elevation: 0,
                backgroundColor: primaryColor,
              ),
              body: Column(
                children: [
                  //customer cart
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) {
                        //get food from cart
                        final Food food = value.cart[index];

                        //get food name
                        final String foodName = food.name;

                        //get food price
                        final String foodPrice = food.price;

                        //return list tile
                        return Container(
                          margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            title: Text(
                              foodName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              foodPrice,
                              style: TextStyle(
                                color: Colors.grey[200],
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () => removeFromCart(food),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey[300],
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                  //pay button

                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: MyButton(
                      name: 'Pay Now',
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ));
  }
}
