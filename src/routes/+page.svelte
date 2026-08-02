<script>
  import { onMount } from 'svelte';
  import { withBase } from '$lib/paths';

  const hero = {
    src: withBase('/images/covenant-map-hero.png'),
    alt: 'A covenant land seen from above — an open Scripture, a household hearth, and a stone city gate joined by a single path.'
  };

  const cards = [
    {
      title: 'The Word',
      invitation: 'Walk in the land of Scripture. Form your imagination.',
      href: withBase('/the-word'),
      image: withBase('/images/the-word-threshing-floor.png'),
      imageAlt: 'A threshing floor where the Word separates wheat from chaff.'
    },
    {
      title: 'The Household',
      invitation: 'Tend the oikonomia. Steward what you have been given.',
      href: withBase('/the-household'),
      image: withBase('/images/the-household-table.png'),
      imageAlt: 'A covenant household table set beneath the hearth and vine.'
    },
    {
      title: 'The Compact',
      invitation: 'Enter covenant with your neighbors. Order your common life.',
      href: withBase('/the-compact'),
      image: withBase('/images/the-compact-gate-tower.png'),
      imageAlt: 'A stone city gate and round water tower opening onto the commons.'
    }
  ];

  let heroVisible = false;
  let visible = [false, false, false];

  onMount(() => {
    setTimeout(() => {
      heroVisible = true;
    }, 100);
    cards.forEach((_, i) => {
      setTimeout(() => {
        visible[i] = true;
      }, 400 + i * 200);
    });
  });
</script>

<div class="min-h-screen bg-parchment flex flex-col items-center justify-center px-6 py-16">
  <div class="w-full max-w-5xl mx-auto">
    <figure
      class="mb-10 overflow-hidden rounded-sm border border-ochre/30 shadow-sm"
      style="opacity: {heroVisible ? 1 : 0}; transform: translateY({heroVisible ? 0 : 12}px); transition: opacity 0.9s ease, transform 0.9s ease;"
    >
      <img src={hero.src} alt={hero.alt} class="block w-full object-cover" loading="eager" />
    </figure>

    <p class="text-center text-slate-covenant text-lg italic mb-12">
      A covenantal atlas for formation in imagination, household, and public life.
    </p>

    <div class="flex flex-col lg:grid lg:grid-cols-3 gap-6">
      {#each cards as card, i}
        <a
          href={card.href}
          class="block overflow-hidden bg-white/60 backdrop-blur-sm rounded-sm border-l-4 border-ochre no-underline hover:bg-white/80 transition-colors duration-300"
          style="opacity: {visible[i] ? 1 : 0}; transform: translateY({visible[i] ? 0 : 12}px); transition: opacity 0.6s ease, transform 0.6s ease;"
        >
          <img
            src={card.image}
            alt={card.imageAlt}
            class="block aspect-square w-full object-cover"
            loading="lazy"
          />
          <div class="p-6">
            <h2 class="font-serif-display text-2xl font-bold text-charcoal">{card.title}</h2>
            <p class="text-slate-covenant text-base mt-2">{card.invitation}</p>
          </div>
        </a>
      {/each}
    </div>
  </div>

  <footer class="mt-16 text-sm text-slate-covenant text-center">
    CovenantOS 2.0 — no accounts, no tracking, no backend.
  </footer>
</div>
