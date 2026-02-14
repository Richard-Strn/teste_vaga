import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga/presentation/widgets/dashboard_2/dashboard_card_2.dart';

void main() {
  group('DashboardCard2 Widget Tests', () {
    const testTitle = 'Pedidos Pendentes';
    const testNumber = 42;
    const testTextNumber = 'vendas hoje';
    const testIcon = Icons.shopping_cart;
    const testColor = Colors.orange;

    testWidgets('Deve exibir corretamente todos os dados fornecidos', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DashboardCard2(
              title: testTitle,
              icon: testIcon,
              number: testNumber,
              textNumber: testTextNumber,
              iconColor: testColor,
            ),
          ),
        ),
      );

      // Verifica o título
      expect(find.text(testTitle), findsOneWidget);

      // Verifica o número convertido para String
      expect(find.text('42'), findsOneWidget);

      // Verifica o texto descritivo do número
      expect(find.text(testTextNumber), findsOneWidget);

      // Verifica o ícone
      expect(find.byIcon(testIcon), findsOneWidget);
    });

    testWidgets(
      'Deve aplicar a cor do ícone no texto secundário e no container do ícone',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DashboardCard2(
                title: testTitle,
                icon: testIcon,
                number: testNumber,
                textNumber: testTextNumber,
                iconColor: testColor,
              ),
            ),
          ),
        );

        // Busca o Widget de texto que exibe 'vendas hoje'
        final Text textWidget = tester.widget(find.text(testTextNumber));

        // Verifica se a cor do texto é a mesma passada no parâmetro iconColor
        expect(textWidget.style?.color, equals(testColor));

        // Busca o ícone para verificar a cor
        final Icon iconWidget = tester.widget(find.byIcon(testIcon));
        expect(iconWidget.color, equals(testColor));
      },
    );

    testWidgets('Deve lidar com textos longos usando overflow', (
      WidgetTester tester,
    ) async {
      // Teste de robustez para garantir que o layout não quebra com strings gigantes
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100, // Espaço pequeno para forçar overflow
              child: DashboardCard2(
                title: 'Título Extremamente Longo que Não Cabe',
                icon: testIcon,
                number: 999999,
                textNumber: 'Subtexto também muito longo para o card',
              ),
            ),
          ),
        ),
      );

      // Verifica se o widget Text possui a propriedade overflow configurada
      final Text titleText = tester.widget(
        find.textContaining('Título Extremamente'),
      );
      expect(titleText.overflow, equals(TextOverflow.ellipsis));
    });
  });
}
