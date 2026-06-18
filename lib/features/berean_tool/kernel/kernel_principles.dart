/// Kernel principles — foundational rules for the Berean Tool diagnostic kernel.
///
/// Defines the governing principles that the interpretation pipeline applies
/// when examining texts: what counts as a contradiction, a healthy pattern,
/// or a formational distortion, as grounded in the Foundational Layer.
///
/// Source: migrated from
/// `boshields-blip/PlumbLineOS/lib/features/covenant_os/kernel/kernel_principles.dart`.
library;

/// A named principle applied by the interpretation pipeline.
///
/// Principles are the normative rules that govern how the Berean Tool
/// evaluates observations in a text against covenantal expectations.
class KernelPrinciple {
  /// Creates a [KernelPrinciple] with the given [name] and [description].
  const KernelPrinciple({required this.name, required this.description});

  /// The short identifying name for this principle.
  final String name;

  /// A human-readable description of what this principle asserts.
  final String description;
}

/// The canonical set of kernel principles used by the interpretation pipeline.
///
/// These principles are grounded in the Foundational Layer (Layer 1) and
/// inform all diagnostic work in the Berean Tool (Layer 3).
const List<KernelPrinciple> kernelPrinciples = [];
