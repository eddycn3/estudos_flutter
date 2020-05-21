import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

final _firestore = Firestore.instance;
FirebaseUser _firebaseUser;

class ChatScreen extends StatefulWidget {
  static const id = "/chat";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  String message;

  TextEditingController textEditController = TextEditingController();

  Future<void> getLogedInUser() async {
    var user = await _auth.currentUser();
    if (user != null) {
      _firebaseUser = user;
      print(_firebaseUser.email);
    }
  }

  @override
  void initState() {
    super.initState();
    getLogedInUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.popAndPushNamed(context, LoginScreen.id);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ChatListView(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textEditController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      textEditController.clear();
                      if (message == null) return;
                      _firestore.collection("messages").add({
                        "sender": _firebaseUser.email,
                        "message": message,
                        "created_at": FieldValue.serverTimestamp(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection("messages")
            .orderBy("created_at", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          final messages = snapshot.data.documents.reversed;
          List<BubleMessage> _bubleMessages = [];

          for (var message in messages) {
            final bubleWidget = BubleMessage(
              sender: message["sender"],
              message: message["message"],
              isCurrentUser: _firebaseUser.email == message["sender"],
            );
            _bubleMessages.add(bubleWidget);
          }
          return Expanded(
              child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  children: _bubleMessages));
        });
  }
}

class BubleMessage extends StatelessWidget {
  final String message;
  final String sender;
  final bool isCurrentUser;

  BubleMessage({this.message, this.sender, this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          sender,
          style: TextStyle(color: Colors.black54),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 20),
          child: Material(
            elevation: 10,
            color: isCurrentUser ? Colors.lightBlue : Colors.white,
            borderRadius: isCurrentUser
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0))
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: TextStyle(
                    color: isCurrentUser ? Colors.white : Colors.black,
                    fontSize: 20),
              ),
            ),
          ),
        )
      ],
    );
  }
}
