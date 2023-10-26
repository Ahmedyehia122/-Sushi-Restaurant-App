import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_restaurant_app/components/my_button.dart';
import 'package:sushi_restaurant_app/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            //shop name
            Text(
              'SUSHIMAN',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //icon
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 25,
              ),
              child: Image.asset(
                'lib/images/salmon_eggs.png',
              ),
            ),

            //title
            Text(
              'THE TASTE OF JAPANESE FOOD',
              // textAlign: TextAlign.center,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //subtitle
            Text(
              'Feel the taste of the most popular food from anywhere and anytime',
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //get started button
            MyButton(
              name: 'Get Started',
              onTap: () {
                //go to menu page
                Navigator.of(context).pushReplacementNamed('menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
