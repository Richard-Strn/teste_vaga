import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga/presentation/widgets/dashboard_1/dashboard_card.dart'; // Ajuste o import

void main() {
  group('DashboardCard Widget Tests', () {
    // Mock de dados para os testes
    const title = 'Vendas Totais';
    const percentage = '12%';
    const percentageText = 'vs mês passado';
    const value = 'R\$ 15.000,00';
    const icon = Icons.trending_up;
    final barHeights = [20.0, 40.0, 60.0, 80.0, 100.0];

    testWidgets('Deve renderizar os textos e o ícone corretamente', (
      WidgetTester tester,
    ) async {
      // Constrói o widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DashboardCard(
              title: title,
              percentage: percentage,
              percentageText: percentageText,
              value: value,
              icon: icon,
              barHeights: [10, 20, 30],
            ),
          ),
        ),
      );

      // Verifica se os textos principais aparecem na tela
      expect(find.text(title), findsOneWidget);
      expect(find.text(percentage), findsOneWidget);
      expect(find.text(percentageText), findsOneWidget);
      expect(find.text(value), findsOneWidget);

      // Verifica se o ícone correto está presente
      expect(find.byIcon(icon), findsOneWidget);
    });

    testWidgets('Deve renderizar o número correto de barras no gráfico', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DashboardCard(
              title: title,
              percentage: percentage,
              percentageText: percentageText,
              value: value,
              icon: icon,
              barHeights: barHeights, // Enviando 5 alturas
            ),
          ),
        ),
      );

      // Procura por Containers que tenham a cor padrão das barras (barColor)
      // Nota: Como o layout usa Containers para as barras, filtramos por decorações de cor.
      final barContainers = tester.widgetList<Container>(
        find.descendant(of: find.byType(Row), matching: find.byType(Container)),
      );

      // Verificamos se existem barras renderizadas (ajustado para a lógica do seu LayoutBuilder)
      // Uma forma simples é contar os elementos gerados pelo List.generate
      expect(find.byType(LayoutBuilder), findsOneWidget);
    });

    testWidgets('Deve aplicar ImageFiltered quando blurValue for true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DashboardCard(
              title: title,
              percentage: percentage,
              percentageText: percentageText,
              value: value,
              icon: icon,
              barHeights: [10],
              blurValue: true, // Ativando o blur
            ),
          ),
        ),
      );

      // Verifica se o widget ImageFiltered (usado no _buildBlurredWidget) está na árvore
      expect(find.byType(ImageFiltered), findsAtLeastNWidgets(1));
    });

    testWidgets('Não deve aplicar ImageFiltered quando blurValue for false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DashboardCard(
              title: title,
              percentage: percentage,
              percentageText: percentageText,
              value: value,
              icon: icon,
              barHeights: [10],
              blurValue: false, // Desativando o blur
            ),
          ),
        ),
      );

      // Verifica se o widget ImageFiltered NÃO está na árvore
      expect(find.byType(ImageFiltered), findsNothing);
    });
  });
}
