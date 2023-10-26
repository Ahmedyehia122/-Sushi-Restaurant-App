import 'package:flutter/material.dart';
import 'package:sushi_restaurant_app/model/food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    //salmon sushi
    Food(
        name: 'Salmon Sushi',
        price: '21.00',
        imagePath: 'lib/images/salmon_sushi.png',
        rating: '4.5'),
    //tuna
    Food(
        name: 'Tuna',
        price: '15.00',
        imagePath: 'lib/images/tuna.png',
        rating: '4.9'),
    //sushi
    Food(
        name: 'Sushi',
        price: '25.00',
        imagePath: 'lib/images/sushi.png',
        rating: '4.1'),
    //small_sushi
    Food(
        name: 'Small Sushi',
        price: '22.00',
        imagePath: 'lib/images/small_sushi.png',
        rating: '4.3'),
  ];

  //customer cat
  List<Food> _cart = [];

  //getter methods

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
