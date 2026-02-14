import 'package:flutter/material.dart';
import 'package:teste_vaga/pages/secondpage.dart';
import 'package:teste_vaga/widgets/stat_card.dart';

class DashboardCard extends StatefulWidget {
  const DashboardCard({super.key});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
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
              // Flexibilidade adicionada ao grupo de textos do título
              Expanded(
                child: Row(
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
                    // Flexible permite que a coluna encolha se o botão precisar de espaço
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Dashboard Geral",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 1.2, // Ajustado para não cortar a fonte
                              letterSpacing: 0.8,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Dados e métricas dos condomínios",
                            overflow: TextOverflow.ellipsis,
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
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16), // Espaço mínimo entre título e botão
              // Botão com efeito Hover
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
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
                        horizontal: 20, // Reduzido de 40 para melhor adaptação
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
                          Flexible(
                            child: Text(
                              "Experimente grátis",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'DM Sans',
                                color: Colors.white,
                                fontSize: 15.36,
                                fontWeight: FontWeight.w400,
                                height: 1.0,
                                letterSpacing: -0.39,
                              ),
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
          // Envolto em SingleChildScrollView ou usando LayoutBuilder se necessário,
          // mas o Expanded já ajuda na Row se o pai tiver largura definida.
          LayoutBuilder(
            builder: (context, constraints) {
              // Se a tela for muito pequena (ex: mobile), você poderia mudar para Wrap.
              // Aqui mantemos Row com Expanded para respeitar sua estrutura original.
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: StatCard(
                      title: "Acessos hoje",
                      percentage: "+12%",
                      percentageText: "",
                      value: "127",
                      icon: Icons.arrow_upward,
                      blurValue: false,
                      barColor: Color(0xFF0288D1),
                      percentageColor: Color(0xFF29B6F6),
                      iconColor: Color(0xFF03A9F4),
                      barHeights: [15, 35, 25, 45, 20, 32, 18, 22],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatCard(
                      title: "Encomendas",
                      percentage: "18",
                      percentageText: "pendentes",
                      value: "80",
                      icon: Icons.inventory_2_outlined,
                      blurValue: true,
                      barColor: Color(0xFF43A047),
                      percentageColor: Color(0xFFF57C00),
                      iconColor: Color(0xFF4CAF50),
                      barHeights: [10, 25, 15, 40, 30, 10, 20, 13],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatCard(
                      title: "Ocorrências",
                      percentage: "55",
                      percentageText: "ativas",
                      value: "100",
                      icon: Icons.warning_amber_rounded,
                      blurValue: true,
                      barColor: Color(0xFFE57373),
                      percentageColor: Color(0xFFFF7043),
                      iconColor: Color(0xFFEF5350),
                      barHeights: [15, 35, 25, 45, 20, 32, 18, 22],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
