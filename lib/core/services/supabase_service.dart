import 'package:supabase_flutter/supabase_flutter.dart';

/// Thin accessor for the Supabase client.
///
/// Call [SupabaseService.client] anywhere in the app to obtain the
/// authenticated Supabase client. Supabase must be initialised via
/// [Supabase.initialize] before the first call (done in [main]).
class SupabaseService {
  const SupabaseService._();

  static SupabaseClient get client => Supabase.instance.client;
}
