import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
 int  SlectedIndex=0;
 final List<String>Category=['Message','Online','Groups','Request'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Category.length,
          itemBuilder: (BuildContext context, int Index){
        return GestureDetector(
          onTap: (){
            setState(() {
              SlectedIndex=Index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
            child: Text(Category[Index],
            style: TextStyle(
              color: Index==SlectedIndex? Colors.white: Colors.white60,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1.3,
            ),),
          ),
        );
      }
      ),
    );
  }
}
