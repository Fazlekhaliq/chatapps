import 'package:chatuiapps/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../screens/chats_screen.dart';
class MyContact extends StatelessWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Favourite Contact",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                  ),
                ),
                IconButton(onPressed: (){}, icon:
                Icon(Icons.more_horiz),
                  iconSize: 30,
                  color: Colors.blueGrey,
                )
              ],
            ),
          ),
          Container(
            height: 120,
            color: Colors.white60,

            child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
                itemBuilder:(BuildContext context, int Index){
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>ChatPage(

                      user: favorites[Index],
                    ))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,

                            backgroundImage: AssetImage(favorites[Index].imageUrl),

                          ),
                          SizedBox(height: 8,),
                          Text(favorites[Index].name),
                        ],
                      ),
                    ),
                  );

                }
            ),
          )
        ],
      ),
    );
  }
}
