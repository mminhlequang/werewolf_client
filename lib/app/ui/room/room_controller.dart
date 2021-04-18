import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/ui/base/base_controller.dart';
import 'package:werewolf_client/app/utils/utils.dart';

class RoomController extends BaseController with SocketListener {
  final ScrollController messageController = ScrollController();
  SocketService service;
  final members = [].obs;
  final roles = [].obs;
  final messages = [].obs;

  final roomTimeState = SocketRoomTimeState.morning.obs;
  final roomState = SocketRoomState.wait.obs;

  RoomModel room;
  RoleModel role;

  void sendMessage(String msg) {
    service.emitSendMessage(msg, SocketManagerChatChannel.villager);
  }

  void changeSoundSetting(bool val) {}

  void changeMusicSetting(bool val) {}

  @override
  void onInit() async {
    super.onInit();
    easyLoading(true);
    service = await SocketService.instance();
    service.registerListener(type: SocketListenType.welcome, listener: this);
    service.emitFindRoom();
  }

  @override
  void onSocketInfoRoom(data) async {
    super.onSocketInfoRoom(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
    room = RoomModel.fromJson(data);
    await service.emitReady();
    easyLoading(false);
  }

  @override
  void onSocketJoinRoom(data) {
    super.onSocketJoinRoom(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
    room = RoomModel.fromJson(data);

    members.value = room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members +
        room.members;
  }

  @override
  void onSocketReadyRoom(data) {
    super.onSocketReadyRoom(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
    roles.value = RoleModel.listFromJson(data['roles']);
  }

  @override
  void onSocketRolePlayer(data) {
    super.onSocketRolePlayer(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
    role = RoleModel.fromJson(data);
    if (role != null && (role.sectarians?.contains(2) ?? false))
      service.registerListener(type: SocketListenType.wolf);
  }

  @override
  void onSocketPlayRoom(data) {
    super.onSocketPlayRoom(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
  }

  @override
  void onSocketTimeControl(data) {
    super.onSocketTimeControl(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
  }

  @override
  void onSocketVillagerVoteStart(data) {
    super.onSocketVillagerVoteStart(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
  }

  @override
  void onSocketVillagerVoteEnd(data) {
    super.onSocketVillagerVoteEnd(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
  }

  @override
  void onSocketWolfVoteStart(data) {
    super.onSocketWolfVoteStart(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
  }

  @override
  void onSocketWolfVoteEnd(data) {
    super.onSocketWolfVoteEnd(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
  }

  @override
  void onSocketMessageSystem(data) {
    super.onSocketMessageSystem(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
  }

  @override
  void onSocketMessageRoom(data) {
    super.onSocketMessageRoom(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
    MessageRoomModel msg = MessageRoomModel.fromJson(data);
    messages.add(msg);
    messageController.animateTo(messageController.position.maxScrollExtent,
        duration: Duration(milliseconds: 350), curve: Curves.linear);
  }

  @override
  void onSocketMessageWolf(data) {
    super.onSocketMessageWolf(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
    MessageRoomModel msg =
        MessageRoomModel.fromJson(data, messageType: MessageRoomType.wolf);
    messages.add(msg);
    messageController.animateTo(messageController.position.maxScrollExtent,
        duration: Duration(milliseconds: 350), curve: Curves.linear);
  }

  @override
  void onSocketMessageDie(data) {
    super.onSocketMessageDie(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
    MessageRoomModel msg =
        MessageRoomModel.fromJson(data, messageType: MessageRoomType.die);
    messages.add(msg);
    messageController.animateTo(messageController.position.maxScrollExtent,
        duration: Duration(milliseconds: 350), curve: Curves.linear);
  }

  @override
  void onClose() {
    service.emitLeaveRoom();
    service.unListener(SocketListenType.welcome);
    if (role != null && (role.sectarians?.contains(2) ?? false))
      service.unListener(SocketListenType.wolf);
    super.onClose();
  }
}
