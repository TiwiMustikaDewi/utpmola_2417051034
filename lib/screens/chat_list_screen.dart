import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../widgets/custom_avatar.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/ios_status_bar.dart';
import 'chat_detail_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  static final List<ChatItem> _chats = [
    const ChatItem(
      id: '1',
      name: 'Physical & Digital Marketing 2026 (124)',
      lastMessage: '1. Kak Rindi — 088286047961 2. Kak Putri — 082281239409 3. Kak Kiran — 089660379832...',
      time: '08.03',
      unreadCount: 6,
      avatarType: 'group',
      assetPath: 'assets/images/marketing.jpg',
    ),
    const ChatItem(
      id: '2',
      name: 'FGL 911 🚨 (83)',
      lastMessage: 'hi fgl @sultana (9am-9pm) ive put 1 MoM trough EwA legality tracker, kindly checkit yu...',
      time: 'Kemarin',
      unreadCount: 0,
      avatarType: 'cat',
      assetPath: 'assets/images/fgl.jpg',
    ),
    const ChatItem(
      id: '3',
      name: 'AIESEC in UNILA 2026 (123)',
      lastMessage: 'terima kasih semuanyaaa, doa baik kembali untuk kalian juga yaa🥺',
      time: 'Sabtu',
      unreadCount: 0,
      avatarType: 'aiesec_blue',
      assetPath: 'assets/images/blue.jpg',
    ),
    const ChatItem(
      id: '4',
      name: 'Brandguard 🥷 💙 (64)',
      lastMessage: 'hai ka @Fariz | mid exam i have revised at row 1295,kindly check it thankuu',
      time: 'Sabtu',
      unreadCount: 4,
      avatarType: 'heart',
      assetPath: 'assets/images/brandfiltering.jpg',
    ),
    const ChatItem(
      id: '5',
      name: 'kkiya',
      lastMessage: 'aelahh',
      time: 'Rabu',
      unreadCount: 0,
      avatarType: 'person_kkiya',
      assetPath: 'assets/images/kkiya.jpg',
    ),
    const ChatItem(
      id: '6',
      name: 'Noval Stevan Rosi',
      lastMessage: 'hi kak',
      time: 'Rabu',
      unreadCount: 0,
      avatarType: 'person_noval',
      assetPath: 'assets/images/noval.jpg',
    ),
    const ChatItem(
      id: '7',
      name: 'Management Board 2026 AIESEC i... (35)',
      lastMessage: 'guys, yuk datang ke welpart probies masih sepi banget, lihatlah calon anak anak kalian @All',
      time: '11/10',
      unreadCount: 0,
      avatarType: 'aiesec_runner',
      assetPath: 'assets/images/aiesec.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const IosStatusBar(time: '08.32'),
            // Top App Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Row(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Obrolan',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_drop_down, color: Colors.black87, size: 24),
                    ],
                  ),
                  const Spacer(),
                  _buildHeaderIcon(Icons.format_line_spacing),
                  const SizedBox(width: 14),
                  _buildHeaderIcon(Icons.folder_open_outlined),
                  const SizedBox(width: 14),
                  _buildCalendarIconWithBadge(),
                  const SizedBox(width: 14),
                  _buildHeaderIcon(Icons.chat_bubble_outline),
                ],
              ),
            ),

            // Search Bar
            const LineSearchBar(hintText: 'Cari'),

            // Notification Banner
            _buildNotificationBanner(),

            const SizedBox(height: 4),

            // Chat list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 90),
                itemCount: _chats.length + 1,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  thickness: 0.5,
                  indent: 72,
                  color: Color(0xFFF0F0F0),
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildRequestRow();
                  }

                  final chat = _chats[index - 1];
                  return _buildChatListItem(context, chat);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Icon(icon, size: 22, color: Colors.black87);
  }

  Widget _buildCalendarIconWithBadge() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(Icons.calendar_today_outlined, size: 20, color: Colors.black87),
        const Positioned(
          top: 3,
          left: 4,
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
          top: -3,
          right: -5,
          child: Container(
            width: 13,
            height: 13,
            decoration: const BoxDecoration(
              color: Color(0xFF00C300),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              'N',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Lihat pemberitahuan terbaru dari LINE >',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          Icon(Icons.campaign_outlined, color: Colors.grey.shade400, size: 26),
        ],
      ),
    );
  }

  Widget _buildRequestRow() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
          color: Color(0xFF00C300),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: const Icon(Icons.chat, color: Colors.white, size: 24),
      ),
      title: const Text(
        'Tak Ada Permintaan Obrolan Baru',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        'Tidak ada permintaan yang belum dibaca',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }

  Widget _buildChatListItem(BuildContext context, ChatItem chat) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: () {
        if (chat.name.toLowerCase().contains('kiya')) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ChatDetailScreen(
                chatTitle: 'kkiya',
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Obrolan ${chat.name} tidak aktif. Ketuk chat kkiya untuk membaca obrolan.'),
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
        }
      },
      leading: CustomAvatar(
        type: chat.avatarType,
        size: 50,
        assetPath: chat.assetPath,
      ),
      title: Text(
        chat.name,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Text(
          chat.lastMessage,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: SizedBox(
        width: 55,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              chat.time,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 4),
            if (chat.unreadCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF00C300),
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                alignment: Alignment.center,
                child: Text(
                  '${chat.unreadCount}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            else
              const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
