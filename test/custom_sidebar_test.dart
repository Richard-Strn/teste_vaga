import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga/presentation/widgets/sidebar/custom_sidebar.dart';

void main() {
  group('CustomSidebar Widget Tests', () {
    testWidgets('Deve expandir a largura ao passar o mouse (Hover)', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CustomSidebar(onItemSelected: (_) {})),
        ),
      );

      // Busca o AnimatedContainer que controla a largura
      final Finder animatedContainerFinder = find.byType(AnimatedContainer);
      AnimatedContainer container = tester.widget(animatedContainerFinder);

      // Largura inicial deve ser 80 (isExpanded = false)
      expect(container.constraints?.minWidth, equals(80));

      // Simula Hover entrando na Sidebar
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(
        location: tester.getCenter(find.byType(CustomSidebar)),
      );

      // Processa o início da animação
      await tester.pump();
      await tester.pump(
        const Duration(milliseconds: 400),
      ); // Duração da animação no código

      container = tester.widget(animatedContainerFinder);
      // Largura final deve ser 250 (isExpanded = true)
      expect(container.constraints?.minWidth, equals(250));
    });

    testWidgets(
      'Deve selecionar um item e disparar callback apenas para o índice 0',
      (WidgetTester tester) async {
        int? itemSelecionado;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomSidebar(
                onItemSelected: (index) => itemSelecionado = index,
              ),
            ),
          ),
        );

        // Clica no item "Condomínios" (índice 1)
        await tester.tap(find.text("Condomínios"));
        await tester.pump();

        // De acordo com seu código, o callback só dispara se index == 0
        expect(itemSelecionado, isNull);

        // Clica no item "Início" (índice 0)
        await tester.tap(find.text("Início"));
        await tester.pump();

        expect(itemSelecionado, equals(0));
      },
    );

    testWidgets('Deve exibir o texto apenas quando estiver expandida', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CustomSidebar(onItemSelected: (_) {})),
        ),
      );

      // Por padrão, isExpanded é false. O texto "Usuários" não deve ser visível ou ter opacidade 0.
      // No seu código, você usa 'if (widget.isExpanded)', então ele nem deve estar na árvore.
      expect(find.text("Usuários"), findsNothing);

      // Simula Hover para expandir
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(
        location: tester.getCenter(find.byType(CustomSidebar)),
      );
      await tester.pumpAndSettle();

      // Agora o texto deve aparecer
      expect(find.text("Usuários"), findsOneWidget);
    });

    testWidgets('Deve mostrar o ícone de logout (Sair) na parte inferior', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CustomSidebar(onItemSelected: (_) {})),
        ),
      );

      expect(find.byIcon(Icons.power_settings_new_rounded), findsOneWidget);
      expect(
        find.text("Sair"),
        findsNothing,
      ); // Inicialmente oculto por estar recolhida
    });
  });
}
