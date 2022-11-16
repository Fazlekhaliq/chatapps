import 'package:chatuiapps/model/message_model.dart';
import 'package:chatuiapps/model/user_model.dart';
import 'package:flutter/material.dart';
class ChatPage extends StatefulWidget {
  final User user;
  const ChatPage({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  _buildMessage(Message message, bool isMe){
  return Row(
    children: [

      Container(

        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        width: MediaQuery.of(context).size.width*0.75,
        margin: isMe?  EdgeInsets.only(top: 8,bottom: 8,left: 80):
        EdgeInsets.only(top: 8,bottom: 8,),

        decoration: BoxDecoration(
            color: isMe?  Colors.grey.shade200: Colors.grey.shade300,
          borderRadius: BorderRadius.only(topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15))
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.time,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text(message.text,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
          ],
        ),
      ),

       !isMe ? IconButton(onPressed: (){}, icon: message.isLiked? Icon(Icons.favorite):Icon(Icons.favorite_border),
          iconSize: 30,
          color: message.isLiked ? Colors.red:Colors.blueGrey,
        ): SizedBox.shrink()

    ],
  );
  }
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 15),

                  itemCount: messages.length,
                    itemBuilder: (BuildContext context, int Index){
                    final Message message=messages[Index];
                    final bool isMe=message.sender.id==currentUser.id;
                  return _buildMessage(message, isMe);
                }),
              ),
            ),
          ),
          _buildComposorMessage(),
        ],
      ),

    );
  }

  _buildComposorMessage() {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon:
              Icon(Icons.photo_camera),
          ),
          Expanded(child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Send message...'
            ),
          )),
          IconButton(onPressed: (){}, icon:
          Icon(Icons.send),
          )

        ],
      ),

    );
  }
}
