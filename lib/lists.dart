import 'categorymodel.dart';

class ItemLists {

  final List<String> sliders =[
    "assets/slider/Slider 1.png",
    "assets/slider/Slider 2.png",
    "assets/slider/Slider 3.png",
  ];

  final List<CategoryModel> category = [
    CategoryModel(
      name: "Fruits",
      image: "assets/category/fruits.png",
    ),
    CategoryModel(
      name: "Vegetables",
      image: "assets/category/vegetables.png",
    ),
    CategoryModel(
      name: "Meat",
      image: "assets/category/meats.png",
    ),
    CategoryModel(
      name: "Milk&egg",
      image: "assets/category/milk.png",
    ),
    CategoryModel(
      name: "Beverages",
      image: "assets/category/beverages.png",
    ),


  ];

  final List<CardModel> fruititems =[
    CardModel(
        price: "3.99",
        rate: "4.8",
        ratecount: "287",
        name: "Banana",
        image: "assets/fruits/banana.png"
    ),
    CardModel(
        price: "3.99",
        rate: "4.8",
        ratecount: "287",
        name: "Peach",
        image: "assets/fruits/peach.png"
    ),
    CardModel(
        price: "3.99",
        rate: "4.8",
        ratecount: "287",
        name: "Mango",
        image: "assets/fruits/mango.png"
    ),
    CardModel(
        price: "3.99",
        rate: "4.8",
        ratecount: "287",
        name: "Orange",
        image: "assets/fruits/orange.png"
    ),
    CardModel(
        price: "3.45",
        rate: "4.8",
        ratecount: "287",
        name: "Lemon",
        image: "assets/fruits/lemon.png"
    ),CardModel(
        price: "3.45",
        rate: "4.8",
        ratecount: "287",
        name: "Strawberry",
        image: "assets/fruits/strawberry.png"
    ),CardModel(
        price: "3.45",
        rate: "4.8",
        ratecount: "287",
        name: "Watermelon",
        image: "assets/fruits/watermelon.png"
    ),
  ];

  final List<CardModel> vegetableitems = [
    CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Pepper",
        image: "assets/vegetables/pepper.png"
    ),
    CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Carrot",
        image: "assets/vegetables/carrot.png"
    ),CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Beet",
        image: "assets/vegetables/beet.png"
    ),CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Garlic",
        image: "assets/vegetables/garlic.png"
    ),CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Green-leaf",
        image: "assets/vegetables/green-leaf.png"
    ),CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Red-cabbages",
        image: "assets/vegetables/red-cabbages.png"
    ),CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Tomato",
        image: "assets/vegetables/tomato.png"
    ),
  ];

  final List<CardModel> meatitems = [
    CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Chicken",
        image: "assets/meats/chicken.png"
    ),CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Fish",
        image: "assets/meats/fish.png"
    ),CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Meat",
        image: "assets/meats/meat.png"
    ),CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "Salmon",
        image: "assets/meats/salmon.png"
    ),CardModel(
        price: "2.99",
        rate: "4.8",
        ratecount: "287",
        name: "shrimps",
        image: "assets/meats/shrimps.png"
    ),
  ];

  static List basketlist = [];
}