<script>
  const title = 'The Word';
  const openingStatement =
    'The Word forms the imagination. Before you can live differently, you must see differently.';
  const suggestedEntry = {
    label: 'Suggested starting place →',
    title: 'Covenantal Philosophy',
    description: 'Begin with the governing frame that makes the rest of the module legible.',
    href: '/the-word/foundational-layer/covenantal-philosophy'
  };

  const stones = [
    {
      number: '01',
      title: 'Governing Frame',
      description: 'The covenantal philosophy that supplies the governing frame.',
      href: '/the-word/foundational-layer'
    },
    {
      number: '02',
      title: 'Diagnostic Engine',
      description: 'A seven-category engine for examining rival philosophies and distortions.',
      href: '/the-word/diagnostic-engine'
    },
    {
      number: '03',
      title: 'Berean Tool',
      description: 'A teacher-and-pastor diagnostic that applies the engine to real-world influences.',
      href: '/the-word/berean-tool'
    },
    {
      number: '04',
      title: 'Language Module',
      description: 'The bridge that exposes how language carries philosophy and reshapes imagination.',
      href: '/the-word/language-module'
    },
    {
      number: '05',
      title: 'Formation',
      description: 'The re-formation pathway that turns diagnosis into embodied renewal.',
      href: '/the-word/formation'
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
