import 'package:flutter/material.dart';
import 'package:grocrey_store/lists.dart';

import 'categorymodel.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  void addToCart(CardModel item){
    setState(() {
      int index = ItemLists.basketlist.indexWhere((i) => i.name == item.name);
      if (index != -1) {
        ItemLists.basketlist[index].count++;
      } else {
        ItemLists.basketlist.add(item);
      }
    });
  }

  void removeFromCart(CardModel item){
    setState(() {
      int index = ItemLists.basketlist.indexWhere((i) => i.name == item.name);
      if (ItemLists.basketlist[index].count != 1) {
        ItemLists.basketlist[index].count--;
      } else {
        ItemLists.basketlist.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.9,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: ItemLists.basketlist.length,
              itemBuilder: (context,i){
                return Stack(
                  children:[ Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white38,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                    child: Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.shade200,
                              ),
                              padding: EdgeInsets.all(15),
                              height: 110,
                              width: 110,

                              child: Image.asset(ItemLists.basketlist[i].image),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${ItemLists.basketlist[i].count}k of ${ItemLists.basketlist[i].name}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Text(
                                    "\$ ${ItemLists.basketlist[i].price}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        Positioned(
                            right: 5,
                            bottom:6,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: ()=>removeFromCart(ItemLists.basketlist[i]),
                                    icon:ItemLists.basketlist[i].count!=1 ?
                                    Icon(Icons.remove):
                                    Icon(Icons.delete_forever_outlined)
                                  ),
                                  
                                  Text("${ItemLists.basketlist[i].count}"),
                                  IconButton(
                                    onPressed: ()=>addToCart(ItemLists.basketlist[i]),
                                    icon: Icon(Icons.add),
                                  ),
                                   
                                ],
                              ),
                            )
                        )
                      ],
                    )
                  ),

                  ]
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
