import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/berean_repository.dart';

/// Form screen for creating a new Berean Tool scripture/text examination session.
///
/// Collects the passage reference (required) and the three OIA fields
/// (Observe, Interpret, Apply — each optional). On submit, calls
/// [BereanRepository.createSession] and returns to the session list.
///
/// In offline/demo mode the repository returns a local placeholder and the
/// navigation still completes, allowing the form to be tested without a backend.
class BereanSessionFormScreen extends StatefulWidget {
  const BereanSessionFormScreen({super.key});

  @override
  State<BereanSessionFormScreen> createState() =>
      _BereanSessionFormScreenState();
}

class _BereanSessionFormScreenState extends State<BereanSessionFormScreen> {
  final _repository = const BereanRepository();
  final _formKey = GlobalKey<FormState>();

  final _passageController = TextEditingController();
  final _observationsController = TextEditingController();
  final _interpretationController = TextEditingController();
  final _applicationController = TextEditingController();

  bool _submitting = false;
  String? _errorMessage;

  @override
  void dispose() {
    _passageController.dispose();
    _observationsController.dispose();
    _interpretationController.dispose();
    _applicationController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _submitting = true;
      _errorMessage = null;
    });

    try {
      await _repository.createSession(
        workspaceId: 'default',
        passage: _passageController.text.trim(),
        conductedAt: DateTime.now(),
        observations: _observationsController.text.trim().isEmpty
            ? null
            : _observationsController.text.trim(),
        interpretation: _interpretationController.text.trim().isEmpty
            ? null
            : _interpretationController.text.trim(),
        application: _applicationController.text.trim().isEmpty
            ? null
            : _applicationController.text.trim(),
      );

      if (!mounted) return;
      context.pop();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _submitting = false;
        _errorMessage = 'Unable to save session. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Examination Session')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            _fieldHeader(context, 'Passage'),
            const SizedBox(height: 4),
            TextFormField(
              controller: _passageController,
              decoration: const InputDecoration(
                hintText: 'e.g. Romans 12:1–2',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Passage is required.' : null,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24),
            _fieldHeader(context, 'Observe'),
            const SizedBox(height: 4),
            Text(
              'What does the text actually say? Name only what is present.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _observationsController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              maxLines: 4,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24),
            _fieldHeader(context, 'Interpret'),
            const SizedBox(height: 4),
            Text(
              'What does the text mean in its original context?',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _interpretationController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              maxLines: 4,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24),
            _fieldHeader(context, 'Apply'),
            const SizedBox(height: 4),
            Text(
              'What claim does this text make on our lives?',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _applicationController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              maxLines: 4,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 32),
            if (_errorMessage != null) ...[
              Text(
                _errorMessage!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              const SizedBox(height: 16),
            ],
            FilledButton(
              onPressed: _submitting ? null : _submit,
              child: _submitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save Session'),
            ),
          ],
        ),
        ),
      ),
    );
  }

  Widget _fieldHeader(BuildContext context, String label) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
