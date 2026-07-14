import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/invite_repository.dart';

/// Screen presented to a user who arrives via a covenant invite link.
///
/// The invite token is typically extracted from the deep-link URL by
/// [CovenantRouter] and passed as a query parameter.
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
