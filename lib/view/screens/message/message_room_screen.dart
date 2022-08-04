import 'package:flutter/material.dart';
import 'package:woogoods/models/user_model.dart';

import 'wigets/chat_composer.dart';
import 'wigets/conversation.dart';

class MessageRoomScreen extends StatelessWidget {
  static const routeName = 'message_room';
  const MessageRoomScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Name'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Conversation(user: User()),
          ),
          const ChatComposer()
        ],
      ),
    );
  }
}
