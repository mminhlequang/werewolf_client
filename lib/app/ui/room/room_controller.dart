import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/ui/base/base_controller.dart';
import 'package:werewolf_client/app/utils/utils.dart';

class RoomController extends BaseController with SocketListener {
  SocketService service;
  final members = [].obs;

  final roomMessages = [].obs;
  final wolfMessages = [].obs;
  final dieMessages = [].obs;

  final roomTimeState = SocketRoomTimeState.morning.obs;
  final roomState = SocketRoomState.wait.obs;

  RoomModel room;
  RoleModel role;

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
  void onSocketRolePlayer(data) {
    super.onSocketRolePlayer(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
    role = RoleModel.fromJson(data);
    if (role != null && (role.sectarians?.contains(2) ?? false))
      service.registerListener(type: SocketListenType.wolf);
  }

  @override
  void onSocketTimeControl(data) {
    // TODO: implement onSocketTimeControl
    super.onSocketTimeControl(data);
  }

  @override
  void onSocketReadyRoom(data) {
    // TODO: implement onSocketReadyRoom
    super.onSocketReadyRoom(data);
  }

  @override
  void onSocketPlayRoom(data) {
    // TODO: implement onSocketPlayRoom
    super.onSocketPlayRoom(data);
  }

  @override
  void onSocketVillagerVoteStart(data) {
    // TODO: implement onSocketVillagerVoteStart
    super.onSocketVillagerVoteStart(data);
  }

  @override
  void onSocketVillagerVoteEnd(data) {
    // TODO: implement onSocketVillagerVoteEnd
    super.onSocketVillagerVoteEnd(data);
  }

  @override
  void onSocketWolfVoteStart(data) {
    // TODO: implement onSocketWolfVoteStart
    super.onSocketWolfVoteStart(data);
  }

  @override
  void onSocketWolfVoteEnd(data) {
    // TODO: implement onSocketWolfVoteEnd
    super.onSocketWolfVoteEnd(data);
  }

  @override
  void onSocketMessageSystem(data) {
    // TODO: implement onSocketMessageSystem
    super.onSocketMessageSystem(data);
  }

  @override
  void onSocketMessageRoom(data) {
    super.onSocketMessageRoom(data);
  }

  @override
  void onSocketMessageWolf(data) {
    // TODO: implement onSocketMessageWolf
    super.onSocketMessageWolf(data);
  }

  @override
  void onSocketMessageDie(data) {
    // TODO: implement onSocketMessageDie
    super.onSocketMessageDie(data);
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
