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
      // Remova o mainAxisSize: MainAxisSize.min se estiver dentro de um Grid
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 243, 243),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui o espaço
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const SizedBox(width: 8),
              Expanded(
                // OBRIGATÓRIO para não explodir a Row lateralmente
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 16,
          ), // Reduzi o respiro para evitar overflow vertical

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                // Faz o número encolher se for grande demais (ex: 1.000.000)
                fit: BoxFit.scaleDown,
                child: Text(
                  '$number',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                textNumber,
                style: TextStyle(color: iconColor, fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
