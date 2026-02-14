import 'dart:ui';
import 'package:flutter/material.dart';

class StatCard2 extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final int number;
  final String textNumber;

  const StatCard2({
    super.key,
    required this.title,
    required this.icon,
    required this.number,
    required this.textNumber,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 243, 243),
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
              const SizedBox(width: 10),

              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // --- ADICIONADO AQUI ---
          Text(
            '$number',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 23, // Tamanho grande para o número principal
              fontWeight: FontWeight.w900,
            ),
          ), // Pequeno respiro entre os textos
          Text(
            textNumber,
            style: TextStyle(
              color: iconColor, // Cor próxima à da imagem
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          // -----------------------
        ],
      ),
    );
  }
}
