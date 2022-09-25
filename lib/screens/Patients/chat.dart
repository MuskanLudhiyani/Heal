import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal/database.dart';
import 'package:heal/authentication.dart';
import 'package:provider/provider.dart';
import '../../database.dart';
import '../../models/chat.dart';

class ChatBubble extends StatefulWidget {
  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<chat>>.value(
      value: DatabaseService().messages,
      initialData: [],
      builder: (context, chats) {
        return chatList(context);
      },
    );
  }
}

  Widget chatList(BuildContext context) {
    TextEditingController message = TextEditingController();
    final String _uid = FirebaseAuth.instance.currentUser.uid;
    print(_uid);
    final m = Provider.of<List<chat>>(context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height - 200,
                child: ListView.builder(
                    itemCount: m.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                      print(m[index].senderId.toString());
                      print(_uid.toString());
                      print(m[index].senderId.toString() == _uid.toString());
                      return Column(
                        children: [
                          Padding(
// asymmetric padding
                            padding: EdgeInsets.fromLTRB(
                              m[index].senderId == _uid ? 64.0 : 16.0,
                              4,
                              m[index].senderId == _uid ? 16.0 : 64.0,
                              4,
                            ),
                            child: Align(
// align the child within the container
                              alignment: m[index].senderId == _uid ? Alignment.centerRight : Alignment.centerLeft,
                              child: DecoratedBox(
// chat bubble decoration
                                decoration: BoxDecoration(
                                  color: m[index].senderId == _uid ? Color(0xff4C3C88) : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    m[index].message,
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                                        color: m[index].senderId == _uid ? Colors.white : Colors.black87),
                                  ),
                                ),
                              ),
                            ),
                          ),

                         // m.length == index+1?



                        ],

                      );
                    }


                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Theme(
                        data: ThemeData(
                          primaryColor: Color(0xffFFFFFF),
                          primaryColorDark: Color(0xffFFFFFF),
                        ),
                        child: TextField(
                            controller: message,
                            cursorColor: Color(0xff90E5BF),
                            decoration: InputDecoration(
                                filled: true,
                                hintText: "Message",
                                suffixIcon: GestureDetector(
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      color: Color(0xff90E5BF),
                                    ),
                                  ),
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                                fillColor: Color(0xffFFFFFF),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ))),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: ()async {
                        DateTime time = DateTime.now();
                        await DatabaseService().updateChatData(
                            message.text, _uid , Timestamp.fromDate(time)
                        );
                      },
                      child: Icon(Icons.arrow_right))
                ],
              )
            ],
          ),
        ),
      ));

  }

