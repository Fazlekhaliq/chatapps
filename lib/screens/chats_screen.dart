import 'package:chatuiapps/model/user_model.dart';
import 'package:flutter/material.dart';
class ChatPage extends StatefulWidget {
  final User user;
  const ChatPage({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Center(
          child: Text(widget.user.name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz),
            iconSize: 30,
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
        ),
      ),

    );
  }
}
