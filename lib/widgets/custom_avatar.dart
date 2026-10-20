import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final String type;
  final double size;
  final bool hasGreenDot;
  final String? imageUrl;
  final String? assetPath;

  const CustomAvatar({
    super.key,
    required this.type,
    this.size = 50,
    this.hasGreenDot = false,
    this.imageUrl,
    this.assetPath,
  });

  // Default portrait URLs matching the screenshot personas
  static const Map<String, String> defaultNetworkImages = {
    // Tiwi MD (wanita berhijab)
    'person_tiwi': 'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?w=150&auto=format&fit=crop&q=80',
    // Noval Stevan Rosi
    'person_noval': 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=150&auto=format&fit=crop&q=80',
    // Farel Arbi (pria berjas)
    'person_farel': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&auto=format&fit=crop&q=80',
    // Acha (pantai senja)
    'person_acha': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=150&auto=format&fit=crop&q=80',
    // Kkiya (wanita kacamata)
    'person_kkiya': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150&auto=format&fit=crop&q=80',
    // FGL 911 (kucing lucu)
    'cat': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=150&auto=format&fit=crop&q=80',
    // Fariz
    'fariz': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&auto=format&fit=crop&q=80',
    // Group teman
    'group_friends': 'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?w=150&auto=format&fit=crop&q=80',
  };

  @override
  Widget build(BuildContext context) {
    Widget avatarContent;

    // 1. Cek jika menggunakan gambar lokal (asset)
    if (assetPath != null && assetPath!.isNotEmpty) {
      avatarContent = Image.asset(
        assetPath!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallbackContent(),
      );
    }
    // 2. Cek jika ada URL gambar langsung yang diberikan
    else if (imageUrl != null && imageUrl!.isNotEmpty) {
      avatarContent = Image.network(
        imageUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallbackContent(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey.shade200,
            child: Center(
              child: SizedBox(
                width: size * 0.4,
                height: size * 0.4,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            ),
          );
        },
      );
    } else {
      avatarContent = _buildFallbackContent();
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          child: ClipOval(child: avatarContent),
        ),
        if (hasGreenDot)
          Positioned(
            right: 0,
            top: 2,
            child: Container(
              width: size * 0.24,
              height: size * 0.24,
              decoration: BoxDecoration(
                color: const Color(0xFF00C300),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFallbackContent() {
    switch (type) {
      case 'group':
        return GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(color: const Color(0xFF334E68), child: const Icon(Icons.person, color: Colors.white70, size: 14)),
            Container(color: const Color(0xFFD32F2F), child: const Icon(Icons.person, color: Colors.white70, size: 14)),
            Container(color: const Color(0xFF1976D2), child: const Icon(Icons.person, color: Colors.white70, size: 14)),
            Container(color: const Color(0xFFE91E63), child: const Icon(Icons.favorite, color: Colors.white70, size: 12)),
          ],
        );

      case 'group_friends':
        return GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(color: const Color(0xFF546E7A), child: const Icon(Icons.face, color: Colors.white, size: 13)),
            Container(color: const Color(0xFF8D6E63), child: const Icon(Icons.face_3, color: Colors.white, size: 13)),
            Container(color: const Color(0xFF37474F), child: const Icon(Icons.face_6, color: Colors.white, size: 13)),
            Container(color: const Color(0xFFB71C1C), child: const Icon(Icons.face_4, color: Colors.white, size: 13)),
          ],
        );

      case 'heart':
        return Container(
          color: const Color(0xFFFFB6C1),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(4),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Penjaga',
                style: TextStyle(
                  fontSize: 7.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
              Text(
                'Brand',
                style: TextStyle(
                  fontSize: 7.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        );

      case 'cat':
        return Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Color(0xFF5C3A21), Color(0xFF2C1810)],
            ),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.pets, color: Color(0xFFFFCC80), size: 24),
        );

      case 'aiesec_blue':
        return Container(
          color: const Color(0xFF037EF3),
        );

      case 'aiesec_runner':
        return Container(
          color: const Color(0xFF0089FF),
          alignment: Alignment.center,
          child: const Icon(Icons.directions_walk, color: Colors.white, size: 26),
        );

      case 'person_blue':
        return Container(
          color: const Color(0xFFD6E4FF),
          alignment: Alignment.center,
          child: const Icon(Icons.person_outline, color: Colors.white, size: 30),
        );

      case 'person_noval':
        return Container(
          color: const Color(0xFF29435C),
          child: const Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Icon(Icons.person, color: Color(0xFF90CAF9), size: 42),
              ),
            ],
          ),
        );

      case 'person_tiwi':
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey.shade400, Colors.grey.shade600],
            ),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.person, color: Colors.white, size: 34),
        );

      case 'person_farel':
        return Container(
          color: const Color(0xFF1E272C),
          alignment: Alignment.center,
          child: const Icon(Icons.person, color: Color(0xFFCFD8DC), size: 36),
        );

      case 'person_acha':
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFB74D), Color(0xFF78909C), Color(0xFF263238)],
            ),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.person_pin, color: Colors.white, size: 26),
        );

      case 'person_kkiya':
        return Container(
          color: const Color(0xFF3E2723),
          alignment: Alignment.center,
          child: const Icon(Icons.person, color: Color(0xFFFFD54F), size: 34),
        );

      case 'fariz':
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFCC80), Color(0xFFFFAB91)],
            ),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.face_retouching_natural, color: Color(0xFF5D4037), size: 28),
        );

      case 'bot_request':
        return Container(
          color: const Color(0xFF00C300),
          alignment: Alignment.center,
          child: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 24),
        );

      default:
        return Container(
          color: Colors.grey.shade300,
          alignment: Alignment.center,
          child: const Icon(Icons.person, color: Colors.white70),
        );
    }
  }
}
