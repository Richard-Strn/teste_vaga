import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding opcional para afastar das bordas da tela
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Lado Esquerdo: Títulos
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Administradora de Condomínios",
                style: TextStyle(
                  fontFamily:
                      'DM Sans', // Certifique-se de ter essa fonte no pubspec ou use GoogleFonts.dmSans()
                  fontSize: 15,
                  fontWeight: FontWeight.w400, // font-weight: 400
                  height:
                      16 /
                      15, // O Flutter usa multiplicador: line-height (16) / font-size (15)
                  letterSpacing: -0.41, // letter-spacing: -0.41px
                  color: // Color.fromRGBO(vermelho, verde, azul, opacidade de 0.0 a 1.0)
                  const Color.fromRGBO(
                    30,
                    30,
                    30,
                    1.0,
                  ), // Mantive sua cor original
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Bem vindo ao portal",
                style: TextStyle(
                  fontFamily:
                      'DM Sans', // Certifique-se de ter a fonte no pubspec.yaml
                  fontSize: 30, // Figma: 30px
                  fontWeight: FontWeight.w800, // Figma: 800 (ExtraBold)
                  height:
                      16 / 30, // Figma: line-height (16px) / font-size (30px)
                  letterSpacing: -0.41, // Figma: -0.41px
                  color: const Color.fromRGBO(
                    30,
                    30,
                    30,
                    1.0,
                  ), // Mantido do seu código original
                ),
              ),
            ],
          ),

          // Lado Direito: Botão e Perfil
          Row(
            children: [
              // Botão Selecionar Condomínio
              // Substitua o Container do botão por este bloco:
              Material(
                color: Colors
                    .transparent, // Mantém o fundo transparente para não sobrepor o estilo
                child: InkWell(
                  onTap: () {
                    // Botão habilitado, mas não leva a lugar nenhum
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0EA28E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Selecione um condominio",
                          style: TextStyle(
                            fontFamily:
                                'DM Sans', // Certifique-se de ter a fonte configurada
                            color:
                                Colors.white, // Mantido do seu código original
                            fontSize: 13, // Figma: 16px
                            fontWeight:
                                FontWeight.w500, // Figma: 600 (SemiBold)
                            height:
                                1.0, // Figma: line-height (16px) / font-size (16px) = 1.0
                            letterSpacing: 0.5, // Figma: -0.41px
                          ),
                        ),
                        SizedBox(width: 7),
                        Icon(Icons.search, color: Colors.white, size: 14),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 32),

              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "User Name",
                        style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.0,
                          letterSpacing: 0,
                          color: const Color.fromRGBO(
                            64,
                            64,
                            64,
                            1.0,
                          ), // Mantido do código original
                        ),
                      ),
                      Text(
                        "Admin",
                        style: TextStyle(
                          fontFamily:
                              'Nunito Sans', // Certifique-se de ter a fonte no projeto
                          fontSize: 12, // Figma: 12px
                          fontWeight: FontWeight.w500, // Figma: 600 (SemiBold)
                          height: 1.0, // Figma: 100%
                          letterSpacing: 0, // Figma: 0px
                          color: const Color.fromRGBO(
                            86,
                            86,
                            86,
                            1.0,
                          ), // Mantido do original
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
