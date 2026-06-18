/// Redirects — edge-case routing registry for the Berean Tool kernel.
///
/// Maps specific diagnostic patterns to alternative handling paths when the
/// main interpretation pipeline needs to delegate processing. Keeps the
/// primary pipeline logic clean by externalising exceptional routing.
///
/// Source: migrated from
/// `boshields-blip/PlumbLineOS/lib/features/covenant_os/kernel/redirects.dart`.
library;

/// A redirect entry mapping a [pattern] to a [handlerKey].
///
/// When the interpretation pipeline encounters [pattern] in a text, it
/// delegates to the handler registered under [handlerKey] instead of
/// following the default diagnostic path.
class KernelRedirect {
  /// Creates a [KernelRedirect] from [pattern] to [handlerKey].
  const KernelRedirect({required this.pattern, required this.handlerKey});

  /// The text pattern that triggers this redirect.
  final String pattern;

  /// The key identifying the handler to invoke for this pattern.
  final String handlerKey;
}

/// The registry of active kernel redirects.
///
/// Add entries here to route specific diagnostic patterns to custom handlers
/// in the interpretation pipeline.
const List<KernelRedirect> kernelRedirects = [];
