import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/stat_card.dart';

class DashboardCard extends StatefulWidget {
  const DashboardCard({super.key});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  // A variável deve ficar aqui, no Estado, para ser preservada
  bool _isHovered = false;

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
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF59E0B),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.workspace_premium,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dashboard Geral",
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 16 / 20,
                          letterSpacing: 0.8,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Dados e métricas dos condomínios",
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          height: 1.0,
                          letterSpacing: 0.4,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Botão com efeito Hover
              GestureDetector(
                onTap: () {
                  print("Botão Experimente grátis clicado!");
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => _isHovered = true),
                  onExit: (_) => setState(() => _isHovered = false),
                  child: AnimatedScale(
                    scale: _isHovered ? 1.05 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white70),
                        color: _isHovered
                            ? Colors.white.withOpacity(0.1)
                            : Colors.transparent,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Experimente grátis",
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              color: Colors.white,
                              fontSize: 15.36,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                              letterSpacing: -0.39,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// MINI CARDS
          Row(
            children: const [
              // 1. CARD AZUL - Acessos hoje
              Expanded(
                child: StatCard(
                  title: "Acessos hoje",
                  percentage: "+12%",
                  percentageText: "",
                  value: "127",
                  // Ícone de seta para cima (quadrado azul na imagem)
                  icon: Icons.arrow_upward,
                  blurValue: false,
                  // Cor das barras (Azul sólido)
                  barColor: const Color(0xFF0288D1),
                  // Cor do texto de porcentagem (Azul claro)
                  percentageColor: const Color(0xFF29B6F6),
                  // Cor de fundo do ícone (Azul brilhante)
                  iconColor: const Color(0xFF03A9F4),
                  barHeights: [15, 35, 25, 45, 20, 32, 18, 22],
                ),
              ),

              const SizedBox(width: 10),

              // 2. CARD VERDE - Encomendas
              Expanded(
                child: StatCard(
                  title: "Encomendas",
                  percentage:
                      "18", // Valor atualizado conforme imagem (exemplo)
                  percentageText: "pendentes",
                  value: "80",
                  // Ícone de caixa/inventário (quadrado verde na imagem)
                  icon: Icons.inventory_2_outlined,
                  blurValue: true,
                  // Cor das barras (Verde)
                  barColor: const Color(0xFF43A047),
                  // Cor do texto "pendentes" (Laranja/Amarelo queimado)
                  percentageColor: const Color(0xFFF57C00),
                  // Cor de fundo do ícone (Verde vibrante)
                  iconColor: const Color(0xFF4CAF50),
                  barHeights: [10, 25, 15, 40, 30, 10, 20, 13],
                ),
              ),

              const SizedBox(width: 10),

              // 3. CARD VERMELHO - Ocorrências
              Expanded(
                child: StatCard(
                  title: "Ocorrências",
                  percentage:
                      "55", // Valor atualizado conforme imagem (exemplo)
                  percentageText: "ativas",
                  value: "100",
                  // Ícone de alerta triangular (quadrado vermelho na imagem)
                  icon: Icons.warning_amber_rounded,
                  blurValue: true,
                  // Cor das barras (Rosa/Vermelho desbotado conforme a imagem)
                  barColor: const Color(0xFFE57373),
                  // Cor do texto "ativas" (Laranja avermelhado)
                  percentageColor: const Color(0xFFFF7043),
                  // Cor de fundo do ícone (Vermelho alerta)
                  iconColor: const Color(0xFFEF5350),
                  barHeights: [15, 35, 25, 45, 20, 32, 18, 22],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
