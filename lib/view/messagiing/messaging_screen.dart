// ignore_for_file: must_be_immutable, library_prefixes

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/model/messegemodel/get_message_model.dart';
import 'package:founder_app/model/messegemodel/send_message_model.dart';
import 'package:founder_app/services/message_service/message_service.dart';
import 'package:founder_app/view/drawer/drawer_home.dart';
import 'package:founder_app/view/messagiing/replycard.dart';
import 'package:founder_app/view/messagiing/sendcard.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessagingUser extends StatefulWidget {
  MessagingUser({super.key, this.selectedId, this.userId});

  String? selectedId;
  String? userId;
  List<GetMessgRes>? msgs = [];
  @override
  State<MessagingUser> createState() => _MessagingUserState();
}

class _MessagingUserState extends State<MessagingUser> {
  TextEditingController msgController = TextEditingController();
  late IO.Socket socket;

@override
  void dispose() {
    super.dispose();
   socket.disconnect();
   socket.emit('disconnect',widget.userId);
  }

  @override
  void initState() {
    super.initState();
    connect();
    getMessage();
  }

  void connect() {
    socket = IO.io('http://10.4.2.144:8080', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    log("connected");
    socket.emit("addUser", widget.userId);
    socket.on("msg-receive", (data) {
      GetMessgRes model = GetMessgRes(
          myself: false, message: data, time: DateTime.now().toString());
      log("emmited");
      setState(() {
        widget.msgs!.add(model);
      });
      setState(() {});
    });
  }

  getMessage() async {
    await MessageService().getMessageService(widget.selectedId!).then((value) => {
              setState(() {
                widget.msgs = value;
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorConst,
      endDrawer: const HomeDrawer(),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        toolbarHeight: 70,
        backgroundColor: Colors.white,

        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: iconcolor,
            )),
        title: const Text(
          "Messager Name",
          style: TextStyle(
            color: Color.fromARGB(255, 50, 103, 137),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: widget.msgs!.isEmpty
                  ? const Center(child: Text("No messages"))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: widget.msgs!.length,
                        itemBuilder: (context, index) {
                          if (widget.msgs![index].myself == true) {
                            return sendcard(
                                context, widget.msgs![index].message!);
                          } else {
                            return replaycard(
                                context, widget.msgs![index].message!);
                          }
                        },
                      ),
                    ),
            ),
            TextField(
              controller: msgController,
              // cursorColor: color1(),
              keyboardType: TextInputType.multiline,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(17),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'message',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 50, 103, 137),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 121, 161, 191),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {
                        sendMessage(msgController.text);
                        msgController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        size: 25,
                        color: Colors.black,
                      ),
                      splashColor: Colors.transparent,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(String msg) async {
    GetMessgRes model = GetMessgRes(myself: true, message: msg);
    SendMessageModel sendModel =
        SendMessageModel(to: widget.selectedId, message: msg);
    setState(() {
      widget.msgs!.add(model);
    });
    socket.emit("send-msg", {"to": widget.selectedId, "message": msg});
    log("send messaged");

    await MessageService().sendMessageService(sendModel);
  }
}
