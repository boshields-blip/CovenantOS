/// A single entry in the covenantal vocabulary glossary.
///
/// Pairs a worldly phrase with its philosophical root and the covenantal
/// alternative. The glossary is sourced from the content tree at
/// [covenant_os/04_language_module/worldly_vs_covenantal_dictionary.md].
///
/// Entries are statically defined in [glossaryTerms]. No database table is
/// required because the glossary content is part of the content tree itself.
class GlossaryTerm {
  const GlossaryTerm({
    required this.worldlyPhrase,
    required this.philosophicalRoot,
    required this.covenantAlternative,
  });

  final String worldlyPhrase;
  final String philosophicalRoot;
  final String covenantAlternative;
}
