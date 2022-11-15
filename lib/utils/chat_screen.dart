import 'package:chatuiapps/model/user_model.dart';
import 'package:flutter/material.dart';

import '../model/message_model.dart';
import '../screens/chats_screen.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),

          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int Index){
                final Message chat= chats[Index];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>ChatPage(

                    user: chat.sender,
                  ))),
                  child: Container(
                    margin: EdgeInsets.only(top: 5,bottom: 5,right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(
                      color: chat.unread?  Colors.grey.shade200: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            CircleAvatar(

                              radius: 30,
                              backgroundImage: AssetImage(chat.sender.imageUrl),
                            ),
                            SizedBox(width: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(chats[Index].sender.name,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.45,
                                  child: Text(chat.text,
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,

                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(chat.time,style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),),
                             SizedBox(height: 10,),
                           chat.unread ?  Container(

                               height: 20,
                               width: 40,
                               decoration: BoxDecoration(
                                 color: Colors.red,
                                 borderRadius: BorderRadius.circular(12),

                               ),
                                 alignment: Alignment.center,
                                 child: Text("New",style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 15,
                                 ),)): Text("Seen "),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              ),
        ),
      ),
    );
  }
}
