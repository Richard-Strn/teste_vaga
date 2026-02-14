import 'dart:ui';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String percentage;
  final String percentageText;
  final String value;
  final IconData icon;
  final Color barColor;
  final Color percentageColor;
  final Color iconColor;
  final bool blurValue;
  final List<double> barHeights;

  const StatCard({
    super.key,
    required this.title,
    required this.percentage,
    required this.percentageText,
    required this.value,
    required this.icon,
    required this.barHeights,
    this.barColor = const Color(0xFF0071BC),
    this.percentageColor = const Color(0xFF3BA2FF),
    this.iconColor = Colors.white,
    this.blurValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),

              // Porcentagem (Borra se blurValue for true)
              _buildBlurredWidget(
                blur: blurValue,
                child: Text(
                  percentage,
                  style: TextStyle(
                    color: percentageColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 4),

              // Texto da Porcentagem (NUNCA BORRA)
              Text(
                percentageText,
                style: TextStyle(
                  color: percentageColor.withOpacity(0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Valor Principal (Borra se blurValue for true)
          _buildBlurredWidget(
            blur: blurValue,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Gráfico Responsivo
          LayoutBuilder(
            builder: (context, constraints) {
              double availableWidth = constraints.maxWidth;
              int numberOfBars = barHeights.length;
              double spacing = 8.0;
              double barWidth =
                  (availableWidth - (spacing * (numberOfBars - 1))) /
                  numberOfBars;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(numberOfBars, (index) {
                  return Container(
                    width: barWidth > 0 ? barWidth : 2,
                    height: barHeights[index],
                    decoration: BoxDecoration(
                      color: barColor,
                      borderRadius: BorderRadius.circular(barWidth * 0.2),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  // Função de Blur aplicada apenas onde desejado
  Widget _buildBlurredWidget({required bool blur, required Widget child}) {
    if (!blur) return child;
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: child,
    );
  }
}
