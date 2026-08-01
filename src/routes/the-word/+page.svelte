<script>
  const title = 'The Word';
  const openingStatement =
    'Scripture is a land you walk, not a library you reference. The Word roots you in the world the text was written from, so your imagination is reshaped by it.';
  const suggestedEntry = {
    label: 'Suggested starting place →',
    title: 'The Land of the Text',
    description: 'Begin by entering the original world the Bible assumes — the ground the rest of the module stands on.',
    href: '/the-word/the-land-of-the-text'
  };

  const stones = [
    {
      number: '01',
      title: 'The Land of the Text',
      description: 'Enter the original context: the Hebraic mind, the Ancient Near Eastern world, and the one covenant story.',
      href: '/the-word/the-land-of-the-text'
    },
    {
      number: '02',
      title: 'The Language of the Land',
      description: 'Learn to think in the Bible’s own words — concrete, embodied, held in covenant.',
      href: '/the-word/the-language-of-the-land'
    },
    {
      number: '03',
      title: 'Walking the Text',
      description: 'Read a passage as its first hearers would, inside the world they actually lived in.',
      href: '/the-word/walking-the-text'
    },
    {
      number: '04',
      title: 'Knowing Your Own Way',
      description: 'A mirror for your own convictions: what you believe, and where it came from.',
      href: '/the-word/knowing-your-own-way'
    },
    {
      number: '05',
      title: 'The Streams of the Traditions',
      description: 'Weigh the gifts and blind spots of the Christian traditions, charitably.',
      href: '/the-word/the-streams-of-the-traditions'
    },
    {
      number: '06',
      title: 'Living the Covenant',
      description: 'Where seeing becomes practice — the table, the season, the shared life.',
      href: '/the-word/living-the-covenant'
    }
  ];
</script>

<svelte:head>
  <title>{title} | CovenantOS</title>
</svelte:head>

<div class="min-h-screen bg-parchment px-6 py-8 text-charcoal sm:px-8 lg:px-12">
  <div class="mx-auto flex w-full max-w-4xl flex-col gap-8">
    <a
      href="/"
      class="w-fit text-sm text-slate-covenant no-underline transition-colors duration-300 hover:text-charcoal"
    >
      ← CovenantOS
    </a>

    <header class="flex flex-col gap-6 sm:flex-row sm:items-center">
      <img
        src="/images/the-word-threshing-floor.png"
        alt="A threshing floor where the Word separates wheat from chaff."
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
