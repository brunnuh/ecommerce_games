import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(190);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ola, Bem-vindo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Icon(
                Icons.shopping_cart_outlined,
                size: 25,
                color: Colors.grey,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 55,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Buscar Jogo",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.blue.shade100,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
