import 'package:covenant_os/features/language_module/data/glossary_data.dart';
import 'package:covenant_os/features/language_module/domain/models/glossary_term.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GlossaryTerm', () {
    test('holds all three required fields', () {
      const term = GlossaryTerm(
        worldlyPhrase: 'Build the brand',
        philosophicalRoot: 'Consumerism / corporate identity',
        covenantAlternative: 'Cultivate a faithful communal witness',
      );

      expect(term.worldlyPhrase, 'Build the brand');
      expect(term.philosophicalRoot, 'Consumerism / corporate identity');
      expect(term.covenantAlternative, 'Cultivate a faithful communal witness');
    });
  });

  group('glossaryTerms', () {
    test('is non-empty', () {
      expect(glossaryTerms, isNotEmpty);
    });

    test('every term has non-empty worldlyPhrase', () {
      for (final term in glossaryTerms) {
        expect(
          term.worldlyPhrase.isNotEmpty,
          isTrue,
          reason: 'Found term with empty worldlyPhrase',
        );
      }
    });

    test('every term has non-empty philosophicalRoot', () {
      for (final term in glossaryTerms) {
        expect(
          term.philosophicalRoot.isNotEmpty,
          isTrue,
          reason: 'Found term with empty philosophicalRoot',
        );
      }
    });

    test('every term has non-empty covenantAlternative', () {
      for (final term in glossaryTerms) {
        expect(
          term.covenantAlternative.isNotEmpty,
          isTrue,
          reason: 'Found term with empty covenantAlternative',
        );
      }
    });

    test('contains expected entry for expressive individualism', () {
      final entry = glossaryTerms.firstWhere(
        (t) => t.worldlyPhrase == 'Protect my truth',
        orElse: () => throw StateError('Entry not found'),
      );
      expect(entry.philosophicalRoot, contains('Expressive individualism'));
      expect(entry.covenantAlternative, isNotEmpty);
    });

    test('no duplicate worldly phrases', () {
      final phrases = glossaryTerms.map((t) => t.worldlyPhrase).toList();
      final unique = phrases.toSet();
      expect(phrases.length, unique.length,
          reason: 'Duplicate worldlyPhrase values found');
    });
  });
}
