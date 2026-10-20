import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../widgets/custom_avatar.dart';
import '../widgets/ios_status_bar.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  static final List<CallRecord> _calls = [
    const CallRecord(
      id: '1',
      name: 'farel arbi',
      date: '06/11/25',
      isMissed: true,
      isIncoming: true,
      avatarType: 'person_farel',
      assetPath: 'assets/images/farel.jpg',
    ),
    const CallRecord(
      id: '2',
      name: 'na',
      date: '13/08/25',
      isMissed: false,
      isIncoming: true,
      avatarType: 'person_blue',
    ),
    const CallRecord(
      id: '3',
      name: 'na (3)',
      date: '13/08/25',
      isMissed: true,
      isIncoming: true,
      count: 3,
      avatarType: 'person_blue',
    ),
    const CallRecord(
      id: '4',
      name: 'acha',
      date: '07/08/25',
      isMissed: false,
      isIncoming: false,
      avatarType: 'person_acha',
      assetPath: 'assets/images/acha.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const IosStatusBar(time: '08.33'),
            // Top Title
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Text(
                'Panggilan',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: -0.5,
                ),
              ),
            ),

            // Call history list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 90),
                itemCount: _calls.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  thickness: 0.5,
                  indent: 76,
                  color: Color(0xFFF0F0F0),
                ),
                itemBuilder: (context, index) {
                  final call = _calls[index];
                  return _buildCallItem(call);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallItem(CallRecord call) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      leading: CustomAvatar(
        type: call.avatarType,
        size: 48,
        assetPath: call.assetPath,
      ),
      title: Text(
        call.name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: call.isMissed ? const Color(0xFFE53935) : Colors.black87,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Row(
          children: [
            Icon(
              call.isIncoming ? Icons.call_received : Icons.call_made,
              size: 13,
              color: Colors.grey.shade500,
            ),
            const SizedBox(width: 4),
            Text(
              call.date,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.phone_outlined, size: 22, color: Colors.grey),
        onPressed: () {},
      ),
    );
  }
}
