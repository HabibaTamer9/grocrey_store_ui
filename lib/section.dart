import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.name});
  final String name ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          TextButton(
              onPressed: (){},
              child: Text(
                "See all",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0CA201)
                ),
              )
          ),
        ],
      ),
    );
  }
}
