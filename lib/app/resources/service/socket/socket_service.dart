import 'package:socket_io_client/socket_io_client.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/resources/service/socket/socket_constant.dart';
import 'package:werewolf_client/app/utils/app_pref.dart';

import 'socket_listener.dart';

enum SocketListenType { welcome, villager, wolf, die }

enum ResultInviteType { accept, reject }

class SocketService {
  SocketService._();

  static SocketService _socketService;
  Socket _socketIO;
  SocketListener _listener;

  static Future<SocketService> instance([listener]) async {
    if (_socketService == null) {
      _socketService = SocketService._();
      await _socketService.initSocket(listener);
    }
    return _socketService;
  }

  initSocket([listener]) async {
    String uri = AppEndpoint.BASE_URL_SOCKET;
    _socketIO = io(
        uri,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setQuery({'accessToken': AppPref.accessToken})
            .build());
    _setListener(listener ?? SocketListener());
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

  emitFindRoom() {
    print("==========> EMIT FIND ROOM");
    _socketIO.emit(SocketConstant.emitFindRoom, [
      {'type': 'normal'}
    ]);
  }

  emitReady() {
    print("==========> EMIT READY");
    _socketIO.emit(SocketConstant.emitReadyPlayer, []);
  }

  emitLeaveRoom() {
    print("==========> EMIT LEAVE ROOM");
    _socketIO.emit(SocketConstant.emitLeaveRoom, []);
  }

  registerListener({SocketListenType type, SocketListener listener}) {
    _setListener(listener);
    switch (type) {
      case SocketListenType.welcome:
        _socketIO.on(
            SocketConstant.onMessageSystem, _listener.onSocketMessageSystem);
        _socketIO.on(
            SocketConstant.onMessageRoom, _listener.onSocketMessageRoom);

        _socketIO.on(SocketConstant.onInfoRoom, _listener.onSocketInfoRoom);
        _socketIO.on(SocketConstant.onReadyRoom, _listener.onSocketReadyRoom);
        _socketIO.on(SocketConstant.onRolePlayer, _listener.onSocketRolePlayer);
        _socketIO.on(SocketConstant.onPlayRoom, _listener.onSocketPlayRoom);
        break;
      case SocketListenType.villager:
        _socketIO.on(
            SocketConstant.onTimeControl, _listener.onSocketTimeControl);
        _socketIO.on(SocketConstant.onVillagerVoteStart,
            _listener.onSocketVillagerVoteStart);
        _socketIO.on(SocketConstant.onVillagerVoteEnd,
            _listener.onSocketVillagerVoteEnd);
        break;

      case SocketListenType.wolf:
        _socketIO.on(
            SocketConstant.onTimeControl, _listener.onSocketTimeControl);
        _socketIO.on(
            SocketConstant.onWolfVoteStart, _listener.onSocketWolfVoteStart);
        _socketIO.on(
            SocketConstant.onWolfVoteEnd, _listener.onSocketWolfVoteEnd);
        break;

      case SocketListenType.die:
        _socketIO.on(SocketConstant.onMessageDie, _listener.onSocketMessageDie);
        break;
      default:
        break;
    }
  }

  unListener(SocketListenType type) async {
    switch (type) {
      case SocketListenType.welcome:
        _socketIO.off(SocketConstant.onMessageRoom);

        _socketIO.off(SocketConstant.onInfoRoom);
        _socketIO.off(SocketConstant.onReadyRoom);
        _socketIO.off(SocketConstant.onRolePlayer);
        _socketIO.off(SocketConstant.onPlayRoom);
        break;
      case SocketListenType.villager:
        _socketIO.off(SocketConstant.onTimeControl);
        _socketIO.off(SocketConstant.onVillagerVoteStart);
        _socketIO.off(SocketConstant.onVillagerVoteEnd);
        break;

      case SocketListenType.wolf:
        _socketIO.off(SocketConstant.onTimeControl);
        _socketIO.off(SocketConstant.onWolfVoteStart);
        _socketIO.off(SocketConstant.onWolfVoteEnd);
        break;

      case SocketListenType.die:
        _socketIO.off(SocketConstant.onMessageDie);
        break;
      default:
        break;
    }
  }
}
