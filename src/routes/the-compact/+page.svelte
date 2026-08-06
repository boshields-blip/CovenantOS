<script>
  import { onMount } from 'svelte';
  import { withBase } from '$lib/paths';

  const title = 'The Compact';
  const openingStatement =
    'The Compact is where household formation meets public obligation. Communities require a covenantal ordering of shared life.';
  const bannerKey = 'dismissed_compact_banner';
  const suggestedEntry = {
    label: 'Suggested starting place →',
    title: 'Covenant vs Contract',
    description: 'Begin with the fault line that makes the rest of the module intelligible.',
    href: withBase('/the-compact/covenant-vs-contract')
  };

  const stones = [
    {
      number: '01',
      title: 'Covenant vs Contract',
      description: 'Begin with the foundational distinction between shared obligation and negotiated self-interest.',
      href: withBase('/the-compact/covenant-vs-contract')
    },
    {
      number: '02',
      title: 'A Call to Freedom',
      description: 'Read the synthesis bridge that gathers The Word, The Household, and The Compact into one argument.',
      href: withBase('/the-compact/a-call-to-freedom')
    },
    {
      number: '03',
      title: 'Subsidiarity',
      description: 'Trace how authority is rightly ordered from household outward into public life.',
      href: withBase('/the-compact/subsidiarity')
    },
    {
      number: '04',
      title: 'Commons and Shared Life',
      description: 'See how shared spaces and obligations make a community more than a collection of households.',
      href: withBase('/the-compact/commons-and-shared-life')
    },
    {
      number: '05',
      title: 'Peoplehood',
      description: 'Ask what it means to belong to a people rather than a market segment or political tribe.',
      href: withBase('/the-compact/peoplehood')
    },
    {
      number: '06',
      title: 'Local Market and Social Fabric',
      description: 'Explore how trade, rightly ordered, can build rather than dissolve community.',
      href: withBase('/the-compact/local-market-and-social-fabric')
    },
    {
      number: '07',
      title: 'Seeing the Neighbor',
      description: 'The public form of the covenant discipline of sight: beholding the neighbor, the stranger, and the poor as they are.',
      href: withBase('/the-compact/seeing-the-neighbor')
    },
    {
      number: '08',
      title: 'Hebraic Word Studies',
      description: 'Return often to the word-study practice as a repeatable formation tool for public life.',
      href: withBase('/the-compact/hebraic-word-studies')
    },
    {
      number: '09',
      title: 'Compact Builder',
      description: 'Close with the capstone formation questions that gather the work of all three modules.',
      href: withBase('/the-compact/formation-questions')
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
            <p>
              The Compact builds on The Word and The Household. Walking those modules first will ground what you find here.
            </p>
            <div class="flex flex-wrap gap-4">
              <a
                href={withBase("/the-word")}
                class="inline-flex text-sm font-semibold text-sage no-underline transition-colors duration-300 hover:text-charcoal"
              >
                Visit The Word →
              </a>
              <a
                href={withBase("/the-household")}
                class="inline-flex text-sm font-semibold text-sage no-underline transition-colors duration-300 hover:text-charcoal"
              >
                Visit The Household →
              </a>
            </div>
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
        src={withBase("/images/the-compact-gate-tower.png")}
        alt="A stone city gate and round water tower opening onto the commons."
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
