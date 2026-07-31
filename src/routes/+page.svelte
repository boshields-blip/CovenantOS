<script>
  import { onMount } from 'svelte';

  const cards = [
    {
      title: 'The Word',
      invitation: 'Walk in the land of Scripture. Form your imagination.',
      href: '/the-word'
    },
    {
      title: 'The Household',
      invitation: 'Tend the oikonomia. Steward what you have been given.',
      href: '/the-household'
    },
    {
      title: 'The Compact',
      invitation: 'Enter covenant with your neighbors. Order your common life.',
      href: '/the-compact'
    }
  ];

  let visible = [false, false, false];

  onMount(() => {
    cards.forEach((_, i) => {
      setTimeout(() => {
        visible[i] = true;
      }, i * 200);
    });
  });
</script>

<div class="min-h-screen bg-parchment flex flex-col items-center justify-center px-6 py-16">
  <div class="w-full max-w-5xl mx-auto">
    <p class="text-center text-slate-covenant text-lg italic mb-12">
      A covenantal atlas for formation in imagination, household, and public life.
    </p>

    <div class="flex flex-col lg:grid lg:grid-cols-3 gap-6">
      {#each cards as card, i}
        <a
          href={card.href}
          class="block bg-white/60 backdrop-blur-sm rounded-sm border-l-4 border-ochre p-6 no-underline hover:bg-white/80 transition-colors duration-300"
          style="opacity: {visible[i] ? 1 : 0}; transform: translateY({visible[i] ? 0 : 12}px); transition: opacity 0.6s ease, transform 0.6s ease;"
        >
          <h2 class="font-serif-display text-2xl font-bold text-charcoal">{card.title}</h2>
          <p class="text-slate-covenant text-base mt-2">{card.invitation}</p>
        </a>
      {/each}
    </div>
  </div>

  <footer class="mt-16 text-sm text-slate-covenant text-center">
    CovenantOS 2.0 — no accounts, no tracking, no backend.
  </footer>
</div>
