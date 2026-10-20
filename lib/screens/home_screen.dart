import 'package:flutter/material.dart';
import '../widgets/custom_avatar.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/ios_status_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const IosStatusBar(time: '08.33'),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 90),
                children: [
                  // Top action bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTopIcon(Icons.bookmark_border),
                        const SizedBox(width: 14),
                        _buildTopIconWithDot(Icons.notifications_none),
                        const SizedBox(width: 14),
                        _buildTopIcon(Icons.person_add_alt),
                        const SizedBox(width: 14),
                        _buildTopIconWithDot(Icons.settings_outlined),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Profile Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tiwi MD',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '9am-9pm',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomAvatar(type: 'person_tiwi', size: 54, assetPath: 'assets/images/tiwi.jpg',),
                ],
              ),
            ),

            const SizedBox(height: 6),

            // Search Bar
            const LineSearchBar(hintText: 'Cari'),

            const SizedBox(height: 6),

            // Ad Banner Card
            _buildAdBanner(),

            const SizedBox(height: 14),

            // Section: Daftar Teman
            _buildSectionHeader(title: 'Daftar Teman', actionText: 'Lihat Semua'),
            _buildFriendListItem(
              avatarType: 'group_friends',
              title: 'Teman',
              subtitle: 'kkiya, Noval Stevan Rosi, eN | slr, Rama, Luthfi_...',
              trailingCount: '69',
              assetPath: 'assets/images/teman.jpg',
            ),
            _buildFriendListItem(
              avatarType: 'group',
              title: 'Grup',
              subtitle: 'Physical & Digital Marketing 2026(124), FGL 91...',
              trailingCount: '50',
              assetPath: 'assets/images/grup.jpg',
            ),

            const SizedBox(height: 14),

            // Section: Layanan
            _buildSectionHeader(title: 'Layanan', actionText: 'Lihat Semua'),
            _buildServicesRow(),

            const SizedBox(height: 18),

            // Section: Profil yang Baru Diupdate
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Profil yang Baru Diupdate',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 14),
            _buildUpdatedProfilesRow(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: 13, color: Colors.grey.shade500),
                  const SizedBox(width: 4),
                  Text(
                    'Teman yang mengupdate profil dalam 24 jam terakhir',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
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

  Widget _buildTopIcon(IconData icon) {
    return Icon(icon, size: 20, color: Colors.black87);
  }

  Widget _buildTopIconWithDot(IconData icon) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon, size: 20, color: Colors.black87),
        Positioned(
          top: -1,
          right: -2,
          child: Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF00C300),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pipa HDPE Fleksibel\n& Kuat',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Vinilon Group',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        'AD',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Learn More >',
                      style: TextStyle(
                        fontSize: 11.5,
                        color: Color(0xFF0066FF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  height: 86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF81D4FA), Color(0xFF0288D1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 8,
                        bottom: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              color: Colors.red.shade700,
                              child: const Text(
                                'Vinilon',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Pilih Pipa Vinilon\nKualitas No. 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        right: 8,
                        bottom: 8,
                        child: Icon(Icons.plumbing, color: Colors.white70, size: 36),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.info_outline, size: 10, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required String actionText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            actionText,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendListItem({
    required String avatarType,
    required String title,
    required String subtitle,
    required String trailingCount,
    String? assetPath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CustomAvatar(type: avatarType, size: 44, assetPath: assetPath),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11.5,
                    color: Colors.grey.shade500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              Text(
                trailingCount,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(width: 2),
              Icon(Icons.chevron_right, size: 16, color: Colors.grey.shade400),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServicesRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildServiceItem(
            icon: Icons.verified_user_outlined,
            label: 'Akun Resmi',
          ),
          _buildServiceItem(
            icon: Icons.account_balance_wallet_outlined,
            label: 'LINE Bank',
          ),
          _buildServiceItem(
            icon: Icons.accessibility_new_outlined,
            label: 'Tema',
          ),
          _buildServiceItem(
            icon: Icons.menu_book_outlined,
            label: 'LINE\nWEBTOON',
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem({
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 28, color: Colors.black87),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            height: 1.1,
          ),
        ),
      ],
    );
  }

  Widget _buildUpdatedProfilesRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Noval Stevan Rosi
          const SizedBox(
            width: 72,
            child: Column(
              children: [
                CustomAvatar(
                  type: 'person_noval',
                  size: 52,
                  assetPath: 'assets/images/noval.jpg',
                  hasGreenDot: true,
                ),
                SizedBox(height: 6),
                Text(
                  'Noval\nStevan Rosi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black87,
                    height: 1.15,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),

          // Edit Profil
          SizedBox(
            width: 72,
            child: Column(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: const Center(
                    child: Icon(Icons.edit_outlined, size: 22, color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Edit Profil',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black87,
                    height: 1.15,
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
