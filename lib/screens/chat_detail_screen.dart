import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../widgets/custom_avatar.dart';
import '../widgets/ios_status_bar.dart';

class ChatDetailScreen extends StatefulWidget {
  final String chatTitle;

  const ChatDetailScreen({
    super.key,
    this.chatTitle = 'kkiya',
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      final hasText = _textController.text.trim().isNotEmpty;
      if (hasText != _hasText) {
        setState(() {
          _hasText = hasText;
        });
      }
    });
  }

  final List<ChatMessage> _messages = [
    const ChatMessage(
      id: '1',
      text: 'untuk tugas metopen km udah belum',
      time: '11.54',
      isMe: false,
    ),
    const ChatMessage(
      id: '2',
      text: 'belum lagii',
      time: '11.54',
      isMe: false,
    ),
    const ChatMessage(
      id: '3',
      
      text: 'bentar lagi selesai',
      time: '11.54',
      isMe: true,
      isRead: true,
    ),
    const ChatMessage(
      id: '4',
      text: 'paling nanti sore ku lanjutin lagi',
      time: '11.55',
      isMe: true,
      isRead: true,
    ),
    const ChatMessage(
      id: '5',
      text: 'aga susah jujur',
      time: '11.55',
      isMe: true,
      isRead: true,
    ),
    const ChatMessage(
      id: '6',
      text: 'susah apaa',
      time: '12.00',
      isMe: false,
    ),
    const ChatMessage(
      id: '7',
      text: 'susah cari niatnya',
      time: '12.03',
      isMe: true,
      isRead: true,
    ),
    const ChatMessage(
      id: '8',
      text: 'aelahh',
      time: '12.03',
      isMe: false,
    ),
  ];

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    final now = TimeOfDay.now();
    final timeStr = '${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')}';

    setState(() {
      _messages.add(
        ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: text,
          time: timeStr,
          isMe: true,
          isRead: false,
        ),
      );
      _textController.clear();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendVoiceNote() {
    final now = TimeOfDay.now();
    final timeStr = '${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')}';

    setState(() {
      _messages.add(
        ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: 'Pesan Suara',
          time: timeStr,
          isMe: true,
          isRead: false,
          isVoiceNote: true,
          duration: '0:07',
        ),
      );
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.mic, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text('Pesan suara (0:07) berhasil dikirim!'),
          ],
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const skyBlueBackground = Color(0xFF8CAED8);

    return Scaffold(
      backgroundColor: skyBlueBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const IosStatusBar(time: '08.33'),
            _buildCustomHeader(context),
            Expanded(
              child: Stack(
                children: [
          // Background Gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF8CAED8), Color(0xFF9ABDE2)],
              ),
            ),
          ),

          // Messages List
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  itemCount: _messages.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // Keterangan tanggal di atas chat dengan format 3 huruf hari: Rab, 14/10
                      return Column(
                        children: [
                          const SizedBox(height: 4),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.22),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                'Rab, 14/10',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                      );
                    }

                    final message = _messages[index - 1];
                    return _buildMessageRow(message, index - 1);
                  },
                ),
              ),

              // Bottom Input Bar
              _buildBottomInputBar(),
            ],
          ),

          // Scroll to bottom floating button
          Positioned(
            right: 16,
            bottom: 68,
            child: GestureDetector(
              onTap: () {
                if (_scrollController.hasClients) {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                }
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_downward,
                  size: 20,
                  color: Colors.black87,
                ),
              ),
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

  Widget _buildCustomHeader(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.chevron_left, color: Colors.black87, size: 28),
                Text(
                  '99+',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.chatTitle,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87, size: 22),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.phone_outlined, color: Colors.black87, size: 22),
            onPressed: () {},
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.calendar_today_outlined, color: Colors.black87, size: 20),
                onPressed: () {},
              ),
              const Positioned(
                bottom: 18,
                left: 17,
                child: Text(
                  '31',
                  style: TextStyle(
                    fontSize: 7.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00C300),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'N',
                    style: TextStyle(
                      fontSize: 7.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87, size: 24),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMessageRow(ChatMessage message, int index) {
    if (message.isMe) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (message.isRead)
                  const Text(
                    'Baca',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF4A6572),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                Text(
                  message.time,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF4A6572),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF73E233), // LINE Green
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: message.isVoiceNote
                    ? _buildVoiceNoteContent(message)
                    : Text(
                        message.text,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.5,
                          height: 1.25,
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
    } else {
      // Left incoming message
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAvatar(type: 'kkiya', size: 36, assetPath: 'assets/images/kkiya.jpg',),
            const SizedBox(width: 8),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      child: Text(
                        message.text,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.5,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    message.time,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF4A6572),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildBottomInputBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.add, color: Colors.black87, size: 24),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined, color: Colors.black87, size: 24),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.image_outlined, color: Colors.black87, size: 24),
              onPressed: () {},
            ),
            Expanded(
              child: Container(
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F3F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        onSubmitted: (_) => _sendMessage(),
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                        decoration: const InputDecoration(
                          hintText: 'Aa',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                      icon: const Icon(Icons.sentiment_satisfied_alt_outlined, color: Colors.grey, size: 20),
                      splashRadius: 16,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 4),
            IconButton(
              icon: Icon(
                _hasText ? Icons.send : Icons.mic_none_outlined,
                color: _hasText ? const Color(0xFF00C300) : Colors.black87,
                size: 24,
              ),
              onPressed: _hasText ? _sendMessage : _sendVoiceNote,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoiceNoteContent(ChatMessage message) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: const BoxDecoration(
            color: Colors.black87,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.play_arrow, color: Colors.white, size: 17),
        ),
        const SizedBox(width: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (final h in [4.0, 9.0, 15.0, 7.0, 13.0, 17.0, 11.0, 6.0, 14.0, 8.0, 4.0])
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
                width: 2.5,
                height: h,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(1.5),
                ),
              ),
          ],
        ),
        const SizedBox(width: 8),
        Text(
          message.duration ?? '0:07',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
