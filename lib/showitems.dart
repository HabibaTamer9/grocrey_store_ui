import 'package:flutter/material.dart';
import 'package:grocrey_store/categorymodel.dart';

import 'itemscard.dart';
import 'lists.dart';

class ShowItems extends StatefulWidget {
  const ShowItems({super.key, required this.items});
  final List<CardModel> items ;

  @override
  State<ShowItems> createState() => _ShowItemsState();
}

class _ShowItemsState extends State<ShowItems> {
  void addToCart(CardModel item){
    setState(() {
      ItemLists.basketlist.add(item);
      print(ItemLists.basketlist);
    });
    print(ItemLists.basketlist);
  }

  void removeFromCard(CardModel item){
    setState(() {
      ItemLists.basketlist.remove(item);
    });
  }
  bool isSelected(CardModel item)=> ItemLists.basketlist.contains(item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      width: MediaQuery.of(context).size.width,
      height: 251,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.items.length,
          itemBuilder: (context ,i){
            return ItemsCard(
              name: widget.items[i].name,
              image: widget.items[i].image,
              rate: widget.items[i].rate,
              ratecount: widget.items[i].ratecount,
              price: widget.items[i].price,
              isSelected: isSelected(widget.items[i]),
              onadd: ()=>addToCart(widget.items[i]),
              onremove: ()=>removeFromCard(widget.items[i]),
            );
          }
      ),
    );
  }}
