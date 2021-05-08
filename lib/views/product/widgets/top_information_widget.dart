import 'package:ecommerce_games/helpers/extensions.dart';
import 'package:ecommerce_games/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TopInformationWidget extends StatelessWidget {
  final Product product;

  TopInformationWidget({this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(product.image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.price.toReal(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: RatingBarIndicator(
                  itemSize: 20,
                  itemBuilder: (_, __) => Icon(
                    Icons.star_border_outlined,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  rating: product.score.scoreStar(),
                  unratedColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
