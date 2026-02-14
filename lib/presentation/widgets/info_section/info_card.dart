import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final String notificationCount;

  const InfoCard({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.notificationCount,
  });

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    bool showNotification =
        widget.notificationCount.isNotEmpty && widget.notificationCount != "0";

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 280,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _isHovered ? widget.iconBackgroundColor : Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: _isHovered
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.15),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _isHovered
                              ? Colors.white.withOpacity(0.2)
                              : widget.iconBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(widget.icon, color: Colors.white, size: 12),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _isHovered ? 1.0 : 0.0,
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      height: 16 / 20,
                      letterSpacing: 0.2,
                      color: _isHovered
                          ? Colors.white
                          : const Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      letterSpacing: -0.41,
                      color: _isHovered ? Colors.white70 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showNotification)
            Positioned(
              top: -8,
              right: -8,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9534F),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                child: Center(
                  child: Text(
                    widget.notificationCount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
