import 'package:cityfood/model/cards/cardcategory.dart';
import 'package:flutter/material.dart';

class ListCategoryard extends StatelessWidget {
  ListCategoryard({super.key, required this.cardCatrgory, required this.onTap});
  List<CardCatrgory> cardCatrgory = [];
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: cardCatrgory
          .map((e) => Categoryard(
                cardCatrgory: e,
                onTap: onTap,
              ))
          .toList(),
    );
  }
}

class Categoryard extends StatefulWidget {
  Categoryard({super.key, required this.cardCatrgory, required this.onTap});
  CardCatrgory cardCatrgory;

  final onTap;
  @override
  State<Categoryard> createState() => _CategoryardState();
}

class _CategoryardState extends State<Categoryard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 150,
        // height: 120,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  widget.cardCatrgory.imgs,
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.cardCatrgory.nameOfItem,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
