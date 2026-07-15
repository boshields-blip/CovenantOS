import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../data/repositories/invite_repository.dart';

/// Screen presented to a user who arrives via a covenant invite link.
///
/// The invite token is typically extracted from the deep-link URL by
/// `buildCovenantRouter()` and passed as a query parameter.
///
/// ## Guard behaviour
///
/// - **Empty token**: If no token is present in the URL, the screen shows a
///   clear "no invite token" message. No backend call is attempted.
/// - **Backend not configured**: If [AppConfig.isConfigured] is false (the app
///   is running without Supabase env vars), a visible pending-state notice is
///   shown instead of a silent failure path. The invite link is preserved in
///   the URL so the user can retry once the backend is live.
///   TODO(infra): Remove this guard once the shared `redeem_lane_invite` RPC
///   is confirmed live in the shared Supabase project (PlumbLineOS → shared
///   project migration, tracked in PR3 cutover doc).
class AcceptInviteScreen extends StatefulWidget {
  const AcceptInviteScreen({
    super.key,
    required this.token,
  });

  final String token;

  @override
  State<AcceptInviteScreen> createState() => _AcceptInviteScreenState();
}

class _AcceptInviteScreenState extends State<AcceptInviteScreen> {
  final _repository = const InviteRepository();

  bool _loading = false;
  String? _errorMessage;

  Future<void> _redeem() async {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    final result = await _repository.redeemInvite(widget.token);

    if (!mounted) return;

    if (result.success) {
      await _repository.refreshSession();
      if (!mounted) return;
      context.go('/covenant/onboarding');
    } else {
      setState(() {
        _loading = false;
        _errorMessage = result.errorMessage ?? 'Unable to accept invitation.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Guard: no invite token in the URL
    if (widget.token.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Accept Invitation')),
        body: const Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No invitation token found.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Please use the invite link you received. The link should '
                'look like:\n\n'
                '  …/covenant/accept-invite?token=YOUR_TOKEN\n\n'
                'If you believe this is an error, contact the person who '
                'invited you to request a new link.',
              ),
            ],
          ),
        ),
      );
    }

    // Guard: backend not yet configured — explicit pending-state notice
    if (!AppConfig.isConfigured) {
      return Scaffold(
        appBar: AppBar(title: const Text('Accept Invitation')),
        body: const Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Backend connection pending.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'CovenantOS has not yet been connected to its backend. '
                'Your invite link is valid and will work once the app is '
                'fully set up. Please try again shortly.',
              ),
              SizedBox(height: 16),
              Text(
                'If you are a developer: set COVENANT_SUPABASE_URL and '
                'COVENANT_SUPABASE_ANON_KEY via --dart-define at build time.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Accept Invitation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'You have been invited to join CovenantOS.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            const Text(
              'CovenantOS is a philosophical formation tool grounded in '
              'covenantal principles. Accepting this invitation will grant '
              'you access to formation practices, scripture examination tools, '
              'and community formation groups.',
            ),
            const SizedBox(height: 32),
            if (_errorMessage != null) ...[
              Text(
                _errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(height: 16),
            ],
            ElevatedButton(
              onPressed: _loading ? null : _redeem,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Accept Invitation'),
            ),
          ],
        ),
      ),
    );
  }
}
