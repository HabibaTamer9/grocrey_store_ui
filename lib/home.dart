import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocrey_store/cart.dart';
import 'package:grocrey_store/lists.dart';
import 'package:grocrey_store/section.dart';
import 'package:grocrey_store/showitems.dart';
import 'categorymodel.dart';
import 'itemscard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> sliders =ItemLists().sliders;

  final List<CategoryModel> category = ItemLists().category;

  final List<CardModel> fruititems =ItemLists().fruititems;

  final List<CardModel> vegetableitems = ItemLists().vegetableitems;

  final List<CardModel> meatitems = ItemLists().meatitems;

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

  void removeFromCard(CardModel item){
    setState(() {
      int index = ItemLists.basketlist.indexWhere((i) => i.name == item.name);
      if (ItemLists.basketlist[index].count != 1) {
        ItemLists.basketlist[index].count--;
      } else {
        ItemLists.basketlist.remove(item);
      }
    });
  }
  bool isSelected(CardModel item)=> ItemLists.basketlist.contains(item);

  int basketcount(){
    int count = 0 ;
    for(int i =0;i<ItemLists.basketlist.length;i++){
      count = (count + ItemLists.basketlist[i]!.count!).toInt() ;
    }
    return count;
  }

  void showCartSheet(BuildContext context) {
    setState(() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return DraggableScrollableSheet(
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: ItemLists.basketlist.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset(
                              ItemLists.basketlist[index].image, width: 50,),
                            title: Text(ItemLists.basketlist[index].name),
                            subtitle: Text(
                                '\$${ItemLists.basketlist[index].price}'),
                            trailing: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                  color: Colors.white
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                  icon:ItemLists.basketlist[index].count!=1 ?
                                  Icon(Icons.remove):
                                  Icon(Icons.delete_forever_outlined),
                                    onPressed: () {
                                      removeFromCard(
                                          ItemLists.basketlist[index]);
                                    },
                                  ),
                                  Text('${ItemLists.basketlist[index].count}'),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      addToCart(ItemLists.basketlist[index]);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Text('You are \$3.50 away from free delivery'),
                      SizedBox(height: 10),
                      LinearProgressIndicator(value: 0.7),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text('Go to Cart ',style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/Vector2.svg"),
            SizedBox(width: 10),
            Text("61 Hopper street.."),
            Icon(Icons.keyboard_arrow_down,size: 28,),
          ],
        ),
        actions: [
          SvgPicture.asset("assets/icons/Vector.svg"),
          SizedBox(width: 20,)
        ],
      ),
      body: Stack(
        children:[ SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: sliders.length,
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Image.asset(
                        sliders[itemIndex],
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width*0.9,),
                  options: CarouselOptions(
                        height: 200,
                        viewportFraction: 0.9,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10,left: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context,i){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.circle
                              ),
                              padding: EdgeInsets.all(8),
                              width: 65,
                              height: 65,
                              child: Image.asset(category[i].image),
                            ),
                            SizedBox(height: 10,),
                            Text(category[i].name)
                          ],
                        ),
                      );
                    }
                  ),
                ),
                Section(name: "Fruits"),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  width: MediaQuery.of(context).size.width,
                  height: 251,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fruititems.length,
                      itemBuilder: (context ,i){
                        return ItemsCard(
                          name: fruititems[i].name,
                          image: fruititems[i].image,
                          rate: fruititems[i].rate,
                          ratecount: fruititems[i].ratecount,
                          price: fruititems[i].price,
                          isSelected: isSelected(fruititems[i]),
                          onadd: ()=>addToCart(fruititems[i]),
                          onremove: ()=>removeFromCard(fruititems[i]),
                        );
                      }
                  ),
                ),
                Section(name: "Vegetables"),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  width: MediaQuery.of(context).size.width,
                  height: 251,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vegetableitems.length,
                      itemBuilder: (context ,i){
                        return ItemsCard(
                          name: vegetableitems[i].name,
                          image: vegetableitems[i].image,
                          rate: vegetableitems[i].rate,
                          ratecount: vegetableitems[i].ratecount,
                          price: vegetableitems[i].price,
                          isSelected: isSelected(vegetableitems[i]),
                          onadd: ()=>addToCart(vegetableitems[i]),
                          onremove: ()=>removeFromCard(vegetableitems[i]),
                        );
                      }
                  ),
                ),
                Section(name: "Meats"),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  width: MediaQuery.of(context).size.width,
                  height: 251,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: meatitems.length,
                      itemBuilder: (context ,i){
                        return ItemsCard(
                          name: meatitems[i].name,
                          image: meatitems[i].image,
                          rate: meatitems[i].rate,
                          ratecount: meatitems[i].ratecount,
                          price: meatitems[i].price,
                          isSelected: isSelected(meatitems[i]),
                          onadd: ()=>addToCart(meatitems[i]),
                          onremove: ()=>removeFromCard(meatitems[i]),
                        );
                      }
                  ),
                ),
                SizedBox(
                  height: 80,
                )

              ],
            ),
          ),
        ),
          ItemLists.basketlist.isNotEmpty ?
          Positioned(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                  color: Color(0xFF0CA201)
              ),
              height: 70,
              width: MediaQuery.of(context).size.width*0.95,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width*0.5,
                      child: ListView.builder(
                        reverse: true,
                        padding: EdgeInsets.only(right: 5),
                        scrollDirection: Axis.horizontal,
                        itemCount:  ItemLists.basketlist.length,
                        itemBuilder: (context , i){
                          return Center(
                            child: Badge(
                              largeSize: 20,
                              backgroundColor: ItemLists.basketlist[i].count !=1 ? Color(0xFFE30320):Color(0xFF0CA201),
                              label:ItemLists.basketlist[i].count !=1 ? Text(ItemLists.basketlist[i].count.toString(),style: TextStyle(fontSize: 13),) : null,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                height: 40,
                                width: 40,
                                child: Image.asset( ItemLists.basketlist[i].image),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                    VerticalDivider(
                      width: 2,
                      color: Colors.white,
                      thickness: 1,
                      indent: 12,
                      endIndent: 12,
                    ),
                    TextButton(
                      onPressed: () =>  showCartSheet(context),
                      child: Text(
                        "View Basket",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                      )
                    ),
                    Badge(
                      backgroundColor: Color(0xFFE30320),
                      label: Text(basketcount().toString(),style: TextStyle(fontSize: 13),),
                      largeSize: 13,
                      child: SvgPicture.asset("assets/icons/Vector.svg",color: Colors.white,)),
                  ],
                ),
              ),
            ),
          ): SizedBox()

        ]
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        selectedItemColor: Colors.green,

      ),
    );
  }
}
