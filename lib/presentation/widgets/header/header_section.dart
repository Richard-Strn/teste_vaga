import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Administradora de Condomínios",
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(30, 30, 30, 1.0),
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bem vindo ao portal",
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromRGBO(30, 30, 30, 1.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0EA28E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Flexible(
                              child: Text(
                                "Selecione um condomínio",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.search, color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 28),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "User Name",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(64, 64, 64, 1.0),
                            ),
                          ),
                          Text(
                            "Admin",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 11,
                              color: Color.fromRGBO(86, 86, 86, 1.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
