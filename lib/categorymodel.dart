class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name ,required this.image});

}

class CardModel {
  final String name;
  final String image;
  final String price;
  final String rate;
  final String ratecount;
  int count ;

  CardModel({
    required this.price,
    required this.rate,
    required this.ratecount,
    required this.name ,
    required this.image,
    this.count = 1
  });

}