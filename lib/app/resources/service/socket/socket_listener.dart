import 'dart:developer';

class SocketListener{

  void onSocketConnect(data){
    log("SocketListener \"onSocketConnect\": $data");
  }

  void onSocketDisconnect(data){
    log("SocketListener \"onSocketConnect\": $data");
  }
}