import 'package:flutter/material.dart';

class CustomSidebar extends StatefulWidget {
  final Function(int) onItemSelected;

  const CustomSidebar({super.key, required this.onItemSelected});

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> {
  bool isExpanded = false;
  int selectedIndex = 0;

  final List<_SidebarData> items = const [
    _SidebarData(Icons.grid_view_rounded, "Início"),
    _SidebarData(Icons.business_rounded, "Condomínios"),
    _SidebarData(Icons.location_on_outlined, "Endereços"),
    _SidebarData(Icons.person_outline, "Usuários"),
    _SidebarData(Icons.people_outline, "Visitantes"),
  ];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isExpanded = true),
      onExit: (_) => setState(() => isExpanded = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: isExpanded ? 250 : 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Logo
            const Icon(Icons.flash_on, color: Color(0xFF1CB197), size: 40),

            const SizedBox(height: 40),

            // Menu dinâmico
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return SidebarItem(
                    icon: item.icon,
                    title: item.title,
                    isExpanded: isExpanded,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() => selectedIndex = index);
                      widget.onItemSelected(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final bool isExpanded;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool active = widget.isSelected || isHovered;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF1CB197) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: active ? Colors.white : Colors.grey[600],
              ),
              if (widget.isExpanded)
                Expanded(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: widget.isExpanded ? 1 : 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          color: active ? Colors.white : Colors.grey[700],
                          fontWeight: widget.isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarData {
  final IconData icon;
  final String title;

  const _SidebarData(this.icon, this.title);
}
