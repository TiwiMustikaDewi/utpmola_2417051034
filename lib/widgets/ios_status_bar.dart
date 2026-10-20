import 'package:flutter/material.dart';

class IosStatusBar extends StatelessWidget {
  final String time;
  final Color contentColor;
  final int batteryPercentage;
  final bool isBatteryYellow;

  const IosStatusBar({
    super.key,
    this.time = '08.33',
    this.contentColor = Colors.black87,
    this.batteryPercentage = 43,
    this.isBatteryYellow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 24, right: 20, bottom: 6),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Clock on the left (iPhone style bold)
          Text(
            time,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: contentColor,
              letterSpacing: -0.3,
            ),
          ),

          // Right side icons: Cellular + WiFi + Battery
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Cellular Signal Bars (4 bars)
              _buildCellularBars(),
              const SizedBox(width: 6),

              // WiFi Icon
              Icon(
                Icons.wifi,
                size: 16.5,
                color: contentColor,
              ),
              const SizedBox(width: 6),

              // iOS Battery Indicator
              _buildIosBattery(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCellularBars() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(4, (index) {
        final heights = [4.0, 6.5, 9.0, 11.5];
        return Container(
          margin: const EdgeInsets.only(right: 1.5),
          width: 3.0,
          height: heights[index],
          decoration: BoxDecoration(
            color: contentColor,
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }

  Widget _buildIosBattery() {
    final fillColor = isBatteryYellow ? const Color(0xFFFFD60A) : contentColor;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Main Battery Body
        Container(
          width: 25,
          height: 12.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.5),
            border: Border.all(
              color: contentColor.withOpacity(0.35),
              width: 1.0,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              // Battery Level Fill (43%)
              FractionallySizedBox(
                widthFactor: batteryPercentage / 100.0,
                alignment: Alignment.centerLeft,
                child: Container(
                  color: fillColor,
                ),
              ),
              // Battery Percentage Text inside
              Center(
                child: Text(
                  '$batteryPercentage',
                  style: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 1.0),

        // Battery Tip / Terminal
        Container(
          width: 1.5,
          height: 4.5,
          decoration: BoxDecoration(
            color: contentColor.withOpacity(0.4),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(1.5),
              bottomRight: Radius.circular(1.5),
            ),
          ),
        ),
      ],
    );
  }
}
