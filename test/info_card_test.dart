import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga/presentation/widgets/info_section/info_card.dart';

void main() {
  group('InfoCard Widget Tests', () {
    const testIcon = Icons.settings;
    const testColor = Colors.blue;
    const testTitle = 'Configurações';
    const testSubtitle = 'Gerencie sua conta';

    testWidgets('Deve exibir o badge quando notificationCount for maior que 0', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: InfoCard(
              icon: testIcon,
              iconBackgroundColor: testColor,
              title: testTitle,
              subtitle: testSubtitle,
              notificationCount: '5',
            ),
          ),
        ),
      );

      // Verifica se o texto da notificação aparece
      expect(find.text('5'), findsOneWidget);
      // Verifica se o container do badge (Positioned/Container) está na árvore
      expect(find.byType(Positioned), findsOneWidget);
    });

    testWidgets(
      'Não deve exibir o badge quando notificationCount for vazio ou "0"',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: InfoCard(
                icon: testIcon,
                iconBackgroundColor: testColor,
                title: testTitle,
                subtitle: testSubtitle,
                notificationCount: '', // Vazio
              ),
            ),
          ),
        );

        expect(find.text('0'), findsNothing);
        // O badge não deve existir na árvore devido ao 'if (showNotification)'
        expect(find.byType(Center), findsNothing);
      },
    );

    testWidgets('Deve mudar as cores ao sofrer Hover (MouseRegion)', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: InfoCard(
              icon: testIcon,
              iconBackgroundColor: testColor,
              title: testTitle,
              subtitle: testSubtitle,
              notificationCount: '0',
            ),
          ),
        ),
      );

      // Busca o AnimatedContainer para verificar a cor inicial
      Finder containerFinder = find.byType(AnimatedContainer);
      AnimatedContainer container = tester.widget(containerFinder);
      expect(
        (container.decoration as BoxDecoration).color,
        equals(Colors.white),
      );

      // Simula o mouse entrando no widget
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(
        location: tester.getCenter(find.byType(InfoCard)),
      );

      // Reconstrói o widget para processar o setState do onEnter
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200)); // Espera a animação

      // Verifica se a cor mudou para a cor do ícone
      container = tester.widget(containerFinder);
      expect((container.decoration as BoxDecoration).color, equals(testColor));

      // Verifica se o ícone de seta (arrow_forward) ficou visível (Opacity 1.0)
      final AnimatedOpacity opacityWidget = tester.widget(
        find.byType(AnimatedOpacity),
      );
      expect(opacityWidget.opacity, equals(1.0));
    });

    testWidgets('Deve renderizar o ícone principal com a cor branca', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: InfoCard(
              icon: testIcon,
              iconBackgroundColor: testColor,
              title: testTitle,
              subtitle: testSubtitle,
              notificationCount: '1',
            ),
          ),
        ),
      );

      final Icon iconWidget = tester.widget(find.byIcon(testIcon));
      expect(iconWidget.color, equals(Colors.white));
      expect(iconWidget.size, equals(12));
    });
  });
}
