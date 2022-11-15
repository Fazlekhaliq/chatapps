import 'package:chatuiapps/model/message_model.dart';
import 'package:chatuiapps/utils/contact.dart';
import 'package:flutter/material.dart';

import '../utils/category_selector.dart';
import '../utils/chat_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30,
          color: Colors.white,
          onPressed: (){},
        ),
        title: Center(
          child: Text("Chats",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search),
            iconSize: 30,
            color: Colors.white,
          )
        ],

      ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
             
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                children: [
                 MyContact(),
                 ChatScreen(),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
