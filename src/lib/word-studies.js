export function parseWordStudies(markdown) {
  return markdown
    .split(/^##\s+/m)
    .slice(1)
    .map((section) => `## ${section.trim()}`)
    .filter((section) => section !== '## Walking practice')
    .map((section) => {
      const lines = section.split('\n');
      const heading = lines[0].trim();
      const headingMatch = heading.match(/^##\s+(.+?)\s+\(\*(.+?)\*\)\s+—\s+(.+)$/);

      if (!headingMatch) {
        return null;
      }

      const [, hebrew, transliteration, gloss] = headingMatch;
      const rootMeaning = section.match(/- \*\*Root meaning and range:\*\*\s*(.+)/)?.[1] ?? '';
      const references =
        section
          .match(/- \*\*Key references:\*\*\s*(.+)/)?.[1]
          ?.split(/;\s+/)
          .filter(Boolean) ?? [];
      const implication = section.match(/- \*\*Formation implication:\*\*\s*(.+)/)?.[1] ?? '';

      return {
        hebrew,
        transliteration,
        gloss,
        rootMeaning,
        references,
        implication
      };
    })
    .filter(Boolean);
}
