import 'package:covenant_os/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App boots and renders without Supabase configured',
      (WidgetTester tester) async {
    // AppConfig.isConfigured returns false when env vars are absent, so
    // the router allows all routes through without an entitlement check.
    await tester.pumpWidget(const CovenantOsApp());
    await tester.pumpAndSettle();

    // The home route (/covenant) should render the CovenantOS home screen.
    expect(find.text('CovenantOS'), findsWidgets);
  });
}
