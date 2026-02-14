import 'package:flutter/material.dart';
import 'package:teste_vaga/presentation/widgets/dashboard_1/dashboard_card.dart';

class DashboardSection extends StatefulWidget {
  final VoidCallback? onNavigateToSecondPage;
  const DashboardSection({super.key, this.onNavigateToSecondPage});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                              height: 1.2,
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
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  if (widget.onNavigateToSecondPage != null) {
                    widget.onNavigateToSecondPage!();
                  }
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
                        horizontal: 20,
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
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: DashboardCard(
                      title: "Acessos hoje",
                      percentage: "+12%",
                      value: "127",
                      icon: Icons.arrow_upward,
                      blurValue: false,
                      barColor: Color(0xFF0288D1),
                      percentageColor: Color(0xFF29B6F6),
                      iconColor: Color(0xFF03A9F4),
                      barHeights: [15, 35, 25, 45, 20, 32, 18, 22],
                      percentageText: '',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DashboardCard(
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
                    child: DashboardCard(
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
