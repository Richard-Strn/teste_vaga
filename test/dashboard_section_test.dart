import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga/presentation/widgets/dashboard_1/dashboard_card.dart';
import 'package:teste_vaga/presentation/widgets/dashboard_1/dashboard_section.dart'; // Ajuste o import

void main() {
  group('DashboardSection Widget Tests', () {
    testWidgets('Deve renderizar o cabeçalho e os três cards de dashboard', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: DashboardSection())),
      );

      // Verifica textos do cabeçalho
      expect(find.text("Dashboard Geral"), findsOneWidget);
      expect(find.text("Dados e métricas dos condomínios"), findsOneWidget);

      // Verifica se os 3 DashboardCards foram renderizados
      expect(find.byType(DashboardCard), findsNWidgets(3));

      // Verifica títulos específicos dos cards para garantir os dados estáticos
      expect(find.text("Acessos hoje"), findsOneWidget);
      expect(find.text("Encomendas"), findsOneWidget);
      expect(find.text("Ocorrências"), findsOneWidget);
    });

    testWidgets(
      'Deve chamar onNavigateToSecondPage ao clicar no botão "Experimente grátis"',
      (WidgetTester tester) async {
        bool navChamado = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DashboardSection(
                onNavigateToSecondPage: () {
                  navChamado = true;
                },
              ),
            ),
          ),
        );

        // Encontra o botão pelo texto
        final botao = find.text("Experimente grátis");

        // Simula o clique
        await tester.tap(botao);
        await tester.pumpAndSettle();

        // Verifica se a callback foi executada
        expect(navChamado, isTrue);
      },
    );

    testWidgets('Deve alterar a escala (Hover) ao passar o mouse sobre o botão', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: DashboardSection())),
      );

      // Busca o AnimatedScale que envolve o botão
      final Finder animatedScaleFinder = find.byType(AnimatedScale);
      AnimatedScale scaleWidget = tester.widget(animatedScaleFinder);

      // Estado inicial: escala 1.0
      expect(scaleWidget.scale, equals(1.0));

      // Simula a entrada do mouse (Hover)
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(
        location: tester.getCenter(find.text("Experimente grátis")),
      );

      // Avança o tempo para a animação começar
      await tester.pump(const Duration(milliseconds: 100));

      // Verifica se a escala aumentou (o valor no widget muda durante o rebuild)
      scaleWidget = tester.widget(animatedScaleFinder);
      expect(scaleWidget.scale, equals(1.05));

      // Simula a saída do mouse
      await gesture.removePointer();
      await tester.pumpAndSettle();

      scaleWidget = tester.widget(animatedScaleFinder);
      expect(scaleWidget.scale, equals(1.0));
    });
  });
}
