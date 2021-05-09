import 'package:ecommerce_games/helpers/extensions.dart';
import 'package:ecommerce_games/models/product.dart';
import 'package:ecommerce_games/views/product/product_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductAboutWidget extends StatelessWidget {
  final Product product;

  ProductAboutWidget({this.product});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (_) => ProductView(
            product: product,
          ),
        ),
      ),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: _size.width,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 5),
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: _size.width * 0.21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: product.name.length > 20 ? 15 : 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      product.price.toReal(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          child: RatingBarIndicator(
                            itemSize: 16,
                            itemBuilder: (_, __) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            rating: product.score.scoreStar(),
                            unratedColor: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          product.score.scoreStar().toString().substring(0, 3),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
