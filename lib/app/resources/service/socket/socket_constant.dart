class SocketConstant {
  SocketConstant._();

  static const String emitFindRoom = 'on_find_room';
  static const String emitReadyPlayer = 'on_ready_player';
  static const String emitLeaveRoom = 'on_leave_room';

  static const String emitVillagerVote = 'on_villager_vote';
  static const String onWolfVote = 'on_wolf_vote';

  static const String emitVillagerChat = 'on_villager_chat';
  static const String emitWolfChat = 'on_wolf_chat';
  static const String emitDieChat = 'on_die_chat';

  static const String onInfoRoom = 'on_info_room';
  static const String onJoinRoom = 'on_join_room';
  static const String onReadyRoom = 'on_ready_room';
  static const String onRolePlayer = 'on_role_player';
  static const String onPlayRoom = 'on_play_room';

  static const String onTimeControl = 'on_time_control';
  static const String onVillagerVoteStart = 'on_villager_vote_start';
  static const String onVillagerVoteEnd = 'on_villager_vote_end';
  static const String onWolfVoteStart = 'on_wolf_vote_start';
  static const String onWolfVoteEnd = 'on_wolf_vote_end';

  static const String onMessageSystem = 'on_message_system';
  static const String onMessageRoom = 'on_message_room';
  static const String onMessageWolf = 'on_message_wolf';
  static const String onMessageDie = 'on_message_die';
}
