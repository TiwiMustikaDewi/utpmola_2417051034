class ChatItem {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String avatarType;
  final String? subtitle;
  final String? assetPath;

  const ChatItem({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    required this.avatarType,
    this.subtitle,
    this.assetPath,
  });
}

class ChatMessage {
  final String id;
  final String text;
  final String time;
  final bool isMe;
  final bool isRead;
  final bool isVoiceNote;
  final String? duration;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.time,
    required this.isMe,
    this.isRead = true,
    this.isVoiceNote = false,
    this.duration,
  });
}

class CallRecord {
  final String id;
  final String name;
  final String date;
  final bool isMissed;
  final bool isIncoming;
  final int count;
  final String avatarType;
  final String? assetPath;

  const CallRecord({
    required this.id,
    required this.name,
    required this.date,
    required this.isMissed,
    this.isIncoming = true,
    this.count = 1,
    required this.avatarType,
    this.assetPath,
  });
}
