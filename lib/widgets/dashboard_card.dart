import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/stat_card.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF071B3A), Color(0xFF1E3A8A), Color(0xFF6D28D9)],
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Ícone laranja
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF59E0B),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.dashboard_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Título + subtítulo
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dashboard Geral",
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 20, // Figma: 20px
                          fontWeight: FontWeight.w600, // Figma: 800 (ExtraBold)
                          height:
                              16 /
                              20, // Figma: line-height (16px) / font-size (20px) = 0.8
                          letterSpacing: 0.8, // Figma: -0.41px
                          color: Colors.white, // Mantido do original
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Dados e métricas dos condomínios",
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 14, // Figma: 16px
                          fontWeight: FontWeight.w100, // Figma: 400 (Regular)
                          height: 1.0, // Figma: 16px / 16px = 1.0
                          letterSpacing: 0.4, // Figma: -0.41px
                          color: Colors.white, // Mantido do original
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Botão contornado
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 42,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white70),
                ),
                child: const Row(
                  children: [
                    Text(
                      "Experimente grátis",
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        color: Colors.white, // Mantido do original
                        fontSize: 15.36, // Figma: 15.36px
                        fontWeight: FontWeight.w400, // Figma: 600 (SemiBold)
                        height: 1.0, // Figma: 15.36px / 15.36px = 1.0
                        letterSpacing: -0.39, // Figma: -0.39px
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          /// MINI CARDS
          Row(
            children: const [
              Expanded(
                child: StatCard(
                  title: "Acessos hoje",
                  percentage: "+12%",
                  percentageText: "",
                  value: "127",
                  icon: Icons.trending_up,
                  blurValue: false,
                  barColor: Colors.blueAccent,
                  barHeights: [
                    10,
                    25,
                    15,
                    40,
                    30,
                    10,
                    20,
                    13,
                  ], // Aqui você controla o gráfico
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: StatCard(
                  title: "Encomendas",
                  percentage: "12",
                  percentageText: "pendentes",
                  percentageColor: Color.fromARGB(
                    255,
                    216,
                    84,
                    7,
                  ), // Cor verde para pendentes
                  value: "80",
                  icon: Icons.trending_up,
                  blurValue: true,
                  barColor: Colors.blueAccent,
                  barHeights: [
                    10,
                    25,
                    15,
                    40,
                    30,
                    10,
                    20,
                    13,
                  ], // Aqui você controla o gráfico
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: StatCard(
                  title: "Ocorrências",
                  percentage: "+12%",
                  percentageText: "ativas",
                  value: "127",
                  icon: Icons.flash_on,
                  blurValue: true,
                  barColor: Color.fromARGB(255, 199, 122, 21),
                  percentageColor: Color.fromARGB(255, 221, 129, 9),
                  iconColor: Color.fromARGB(
                    255,
                    219,
                    51,
                    9,
                  ), // Agora você define a cor aqui
                  barHeights: [
                    15,
                    35,
                    25,
                    45,
                    20,
                    32,
                    18,
                    22,
                  ], // 8 valores passados manualmente
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
