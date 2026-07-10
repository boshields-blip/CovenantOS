/// App configuration for CovenantOS.
///
/// Values are injected at build time via --dart-define:
/// ```
/// flutter run \
///   --dart-define=COVENANT_SUPABASE_URL=https://your-project.supabase.co \
///   --dart-define=COVENANT_SUPABASE_ANON_KEY=your-anon-key
/// ```
///
/// In CI/CD, set these as GitHub Actions secrets and pass them via the
/// build step. Never hard-code real credentials here.
///
/// Required env vars:
///   COVENANT_SUPABASE_URL      — Supabase project URL (shared community project)
///   COVENANT_SUPABASE_ANON_KEY — Supabase anon/public key
class AppConfig {
  const AppConfig._();

  static const String supabaseUrl = String.fromEnvironment(
    'COVENANT_SUPABASE_URL',
    defaultValue: '',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
    'COVENANT_SUPABASE_ANON_KEY',
    defaultValue: '',
  );

  /// Returns true when both Supabase env vars are provided.
  /// When false, the app runs in offline/demo mode (no backend calls).
  static bool get isConfigured =>
      supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;
}
