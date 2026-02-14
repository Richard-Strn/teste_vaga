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
        borderRadius: BorderRadius.circular(12),
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
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(icon, color: iconColor, size: 19),
              ),
              const SizedBox(width: 10), // Espaçamento Original Mantido

              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Fonte Original
                      fontWeight: FontWeight.w100,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
              // Espaçamento Original Mantido
              // Agrupador da Porcentagem para evitar quebra individual
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 88.0),
                    child: Row(
                      children: [
                        _buildBlurredWidget(
                          blur: blurValue,
                          child: Text(
                            percentage,
                            style: TextStyle(
                              color: percentageColor,
                              fontWeight: FontWeight.bold,
                              // fontSize padrão (não definido no original, então segue o padrão)
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ), // Espaçamento Original Mantido
                        Text(
                          percentageText,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: percentageColor.withOpacity(0.8),
                            fontSize: 14, // Fonte Original
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // Espaçamento Original Mantido
          // Valor Principal
          _buildBlurredWidget(
            blur: blurValue,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28, // Fonte Original
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24), // Espaçamento Original Mantido
          // Gráfico Responsivo
          LayoutBuilder(
            builder: (context, constraints) {
              double availableWidth = constraints.maxWidth;
              int numberOfBars = barHeights.length;
              double spacing = 4.0; // Espaçamento Original Mantido
              double barWidth =
                  (availableWidth - (spacing * (numberOfBars - 1))) /
                  numberOfBars;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(numberOfBars, (index) {
                  return Container(
                    width: barWidth > 0 ? barWidth : 1,
                    height: barHeights[index],
                    decoration: BoxDecoration(
                      color: barColor,
                      borderRadius: BorderRadius.circular(
                        barWidth > 0 ? barWidth * 0.1 : 1,
                      ),
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

  Widget _buildBlurredWidget({required bool blur, required Widget child}) {
    if (!blur) return child;
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: child,
    );
  }
}
