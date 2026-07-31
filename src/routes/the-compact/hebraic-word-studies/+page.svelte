<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import HebrewWordCard from '$lib/HebrewWordCard.svelte';
  import { parseWordStudies } from '$lib/word-studies.js';
  import wordStudiesSource from '../../../../modules/03_the_compact/HEBRAIC_WORD_STUDIES.md?raw';

  const wordStudies = parseWordStudies(wordStudiesSource);
</script>

<ContentLayout
  title="Hebraic Word Studies"
  module="The Compact"
  moduleHref="/the-compact"
  prevHref="/the-compact/local-market-and-social-fabric"
  prevLabel="Local Market and Social Fabric"
  nextHref="/the-compact/formation-questions"
  nextLabel="Compact Builder"
>
  <div class="space-y-8">
    <header class="space-y-3 border-b border-ochre/20 pb-6">
      <h1 class="font-serif-display text-3xl font-semibold text-charcoal">Hebraic Word Studies</h1>
      <p class="text-lg italic text-slate-covenant">
        Read these covenantal public words slowly, then ask what your people, gate, justice, and witness must become.
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
