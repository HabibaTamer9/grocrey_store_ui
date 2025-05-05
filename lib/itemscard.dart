import 'package:flutter/material.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({super.key, required this.name, required this.image, required this.price, required this.rate, required this.ratecount, required this.isSelected, required this.onadd, required this.onremove});
  final String name;
  final String image;
  final String price;
  final String rate;
  final String ratecount;
  final bool isSelected;
  final Function onadd;
  final Function onremove;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 145,
              height: 130,
             // padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Stack(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(image,width: 135,),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: isSelected? 100 :40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                      ),
                      child:isSelected? Row(
                        children: [
                          IconButton(
                            onPressed: ()=>onremove(),
                            icon: Icon(Icons.delete_forever_outlined,size: 20,)
                          ),
                          IconButton(
                            onPressed: ()=>onadd(),
                            icon: Icon(Icons.add,size: 20,)
                          ),
                        ],
                      ):IconButton(onPressed: ()=>onadd(), icon: Icon(Icons.add,size: 20,)),
                    )
                  )
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/icons/star.png",width: 16,),
                      Text(
                        rate,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "($ratecount)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),

                  Text(
                    "\$$price",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
