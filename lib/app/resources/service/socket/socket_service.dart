import 'package:socket_io_client/socket_io_client.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/utils/app_pref.dart';

import 'socket_listener.dart';

enum SocketListenType { invite, pickImage, memory, general }

enum ResultInviteType { accept, reject }

class SocketService {
  SocketService._();

  static SocketService _socketService;
  Socket _socketIO;
  SocketListener _listener;

  static Future<SocketService> instance() async {
    if (_socketService == null) {
      _socketService = SocketService._();
      await _socketService.initSocket();
    }
    return _socketService;
  }

  initSocket() async {
    String uri = AppEndpoint.BASE_URL_SOCKET;
    _socketIO = io(
        uri,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setQuery({'accessToken': AppPref.accessToken})
            .build());
    _setListener(SocketListener());
    _socketIO.onConnect(_listener.onSocketConnect);
    _socketIO.onDisconnect(_listener.onSocketDisconnect);
    _socketIO.connect();
  }

  void destroy() {
    if (_socketIO != null) _socketIO.disconnect();
    _socketService = null;
    _listener = null;
  }

  String get id => _socketIO.id;

  bool get isConnected => _socketIO.connected;

  SocketListener get listener => _listener;

  _setListener(SocketListener value) {
    _listener = value ?? SocketListener();
  }

  emitChangeLanguageCode(String code) {
    print("==========> EMIT CHANGE LANGUAGE");
    _socketIO.emit("changeLanguageCode", [
      {'languageCode': code}
    ]);
  }

  registerListener({SocketListenType type, SocketListener listener}) {
    _setListener(listener);
    switch (type) {
      case SocketListenType.invite:
        // _socketIO.on("onRoomInvite", _listener.onSocketPickImageInvite);
        break;
      default:
        break;
    }
  }

  unListener(SocketListenType type) async {
    switch (type) {
      case SocketListenType.invite:
        _socketIO.off("onRoomInvite");
        break;
      default:
        break;
    }
  }
}
