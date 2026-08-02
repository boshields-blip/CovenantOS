<script>
  import { onMount } from 'svelte';
  import { withBase } from '$lib/paths';

  const title = 'The Household';
  const openingStatement =
    'The Household is where the covenantal imagination becomes embodied. Formation happens in work, table, land, and season.';
  const bannerKey = 'dismissed_household_banner';
  const suggestedEntry = {
    label: 'Suggested starting place →',
    title: 'Oikonomia',
    description: 'Start with the recovery of household stewardship as the center of covenantal economic life.',
    href: withBase('/the-household/oikonomia')
  };

  const stones = [
    {
      number: '01',
      title: 'Oikonomia',
      description: 'Recover household stewardship as the center of life rather than impersonal market theory.',
      href: withBase('/the-household/oikonomia')
    },
    {
      number: '02',
      title: 'Household Flow Model',
      description: 'See how labor, provision, inheritance, and hospitality move through a rightly ordered household.',
      href: withBase('/the-household/household-flow-model')
    },
    {
      number: '03',
      title: 'Agrarian Rhythms',
      description: 'Read the household through land, season, and the embodied rhythms that teach stewardship.',
      href: withBase('/the-household/agrarian-rhythms')
    },
    {
      number: '04',
      title: 'Household vs Consumer Economy',
      description: 'Name the inversion that made the marketplace central and the household optional.',
      href: withBase('/the-household/household-vs-consumer-economy')
    },
    {
      number: '05',
      title: 'The Household Hollowed',
      description: 'Name the industrial demolition that displaced both men and women from a shared, productive home.',
      href: withBase('/the-household/the-household-hollowed')
    },
    {
      number: '06',
      title: 'The Ordered Household',
      description: 'Walk toward the recovered vision: presence, mutual honor, shared vocation, and authority that serves.',
      href: withBase('/the-household/the-ordered-household')
    },
    {
      number: '07',
      title: 'Land and Inheritance',
      description: 'Anchor household life in inheritance, responsibility, and covenantal continuity across generations.',
      href: withBase('/the-household/land-and-inheritance')
    },
    {
      number: '08',
      title: 'Hebraic Word Studies',
      description: 'Use the word-study practice as a repeatable formation tool for household life.',
      href: withBase('/the-household/hebraic-word-studies')
    }
  ];

  let showBanner = false;

  onMount(() => {
    showBanner = localStorage.getItem(bannerKey) !== 'true';
  });

  function dismissBanner() {
    localStorage.setItem(bannerKey, 'true');
    showBanner = false;
  }
</script>

<svelte:head>
  <title>{title} | CovenantOS</title>
</svelte:head>

<div class="min-h-screen bg-parchment px-6 py-8 text-charcoal sm:px-8 lg:px-12">
  <div class="mx-auto flex w-full max-w-4xl flex-col gap-8">
    <a
      href={withBase("/")}
      class="w-fit text-sm text-slate-covenant no-underline transition-colors duration-300 hover:text-charcoal"
    >
      ← CovenantOS
    </a>

    {#if showBanner}
      <div class="rounded-sm border border-sage bg-sage/10 p-4 transition-opacity duration-300">
        <div class="flex items-start justify-between gap-4">
          <div class="space-y-2 text-sm text-charcoal sm:text-base">
            <p>The Word forms the foundation. Walking The Word first will make everything here more legible.</p>
            <a
              href={withBase("/the-word")}
              class="inline-flex text-sm font-semibold text-sage no-underline transition-colors duration-300 hover:text-charcoal"
            >
              Walk The Word first →
            </a>
          </div>
          <button
            type="button"
            class="text-sm font-semibold text-slate-covenant transition-colors duration-300 hover:text-charcoal"
            on:click={dismissBanner}
          >
            Dismiss
          </button>
        </div>
      </div>
    {/if}

    <header class="flex flex-col gap-6 sm:flex-row sm:items-center">
      <img
        src={withBase("/images/the-household-table.png")}
        alt="A covenant household table set beneath the hearth and vine."
        class="w-28 shrink-0 rounded-sm border border-ochre/30 sm:w-36"
        loading="eager"
      />
      <div class="space-y-4">
        <h1 class="font-serif-display text-4xl font-bold text-charcoal">{title}</h1>
        <p class="max-w-3xl text-xl italic text-slate-covenant">{openingStatement}</p>
      </div>
    </header>

    <a
      href={suggestedEntry.href}
      class="block border-l-4 border-ochre bg-ochre/10 p-5 no-underline transition-colors duration-300 hover:bg-ochre/15"
    >
      <p class="text-sm font-semibold uppercase tracking-[0.18em] text-ochre">
        {suggestedEntry.label}
      </p>
      <h2 class="mt-2 font-serif-display text-2xl font-semibold text-charcoal">
        {suggestedEntry.title}
      </h2>
      <p class="mt-2 text-base text-slate-covenant">{suggestedEntry.description}</p>
    </a>

    <section aria-labelledby="stepping-stones" class="pb-6">
      <h2 id="stepping-stones" class="font-serif-display text-2xl font-semibold text-charcoal">
        Stepping-stone pathway
      </h2>

      <div class="relative mt-6 pl-6 sm:pl-8">
        <div class="absolute bottom-4 left-[0.45rem] top-4 w-px bg-sage/50 sm:left-3"></div>

        <div class="space-y-5">
          {#each stones as stone}
            <a
              href={stone.href}
              class="relative block border-l-4 border-sage bg-white/55 p-5 no-underline transition-colors duration-300 hover:bg-white/75"
            >
              <div class="absolute left-[-1.45rem] top-8 h-3 w-3 rounded-full border border-sage bg-parchment sm:left-[-1.8rem]"></div>
              <p class="text-sm font-bold tracking-[0.18em] text-ochre">{stone.number}</p>
              <h3 class="mt-1 font-serif-display text-lg text-charcoal">{stone.title}</h3>
              <p class="mt-2 text-base text-slate-covenant">{stone.description}</p>
            </a>
          {/each}
        </div>
      </div>
    </section>
  </div>
</div>
