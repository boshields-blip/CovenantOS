<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import HebrewWordCard from '$lib/HebrewWordCard.svelte';
  import { parseWordStudies } from '$lib/word-studies.js';
  import wordStudiesSource from '../../../../modules/02_the_household/HEBRAIC_WORD_STUDIES.md?raw';

  const wordStudies = parseWordStudies(wordStudiesSource);
</script>

<ContentLayout
  title="Hebraic Word Studies"
  module="The Household"
  moduleHref="/the-household"
  prevHref="/the-household/land-and-inheritance"
  prevLabel="Land and Inheritance"
>
  <div class="space-y-8">
    <header class="space-y-3 border-b border-ochre/20 pb-6">
      <h1 class="font-serif-display text-3xl font-semibold text-charcoal">Hebraic Word Studies</h1>
      <p class="text-lg italic text-slate-covenant">
        Read these household words slowly, then ask what your table, labor, inheritance, and rest must become.
      </p>
    </header>

    <div class="space-y-5">
      {#each wordStudies as wordStudy}
        <HebrewWordCard
          hebrew={wordStudy.hebrew}
          transliteration={wordStudy.transliteration}
          gloss={wordStudy.gloss}
          references={wordStudy.references}
          implication={wordStudy.implication}
        >
          {#if wordStudy.rootMeaning}
            <p>{wordStudy.rootMeaning}</p>
          {/if}
        </HebrewWordCard>
      {/each}
    </div>
  </div>
</ContentLayout>
