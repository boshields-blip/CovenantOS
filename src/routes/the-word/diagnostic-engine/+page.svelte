<script>
  const title = 'Diagnostic Engine';
  const openingStatement =
    'A seven-category framework for naming the philosophies that shape imagination. Use it to examine teachers, traditions, and your own assumptions.';
  const suggestedEntry = {
    label: 'Begin with Metaphysics →',
    href: '/the-word/diagnostic-engine/categories/metaphysics'
  };

  const stones = [
    {
      number: '01',
      title: 'Metaphysics',
      href: '/the-word/diagnostic-engine/categories/metaphysics'
    },
    {
      number: '02',
      title: 'Epistemology',
      href: '/the-word/diagnostic-engine/categories/epistemology'
    },
    {
      number: '03',
      title: 'Anthropology',
      href: '/the-word/diagnostic-engine/categories/anthropology'
    },
    {
      number: '04',
      title: 'Ethics',
      href: '/the-word/diagnostic-engine/categories/ethics'
    },
    {
      number: '05',
      title: 'Social/Political',
      href: '/the-word/diagnostic-engine/categories/social-political'
    },
    {
      number: '06',
      title: 'Identity/Meaning',
      href: '/the-word/diagnostic-engine/categories/identity-meaning'
    },
    {
      number: '07',
      title: 'Eschatology',
      href: '/the-word/diagnostic-engine/categories/eschatology'
    }
  ];
</script>

<svelte:head>
  <title>{title} | CovenantOS</title>
</svelte:head>

<div class="min-h-screen bg-parchment px-6 py-8 text-charcoal sm:px-8 lg:px-12">
  <div class="mx-auto flex w-full max-w-4xl flex-col gap-8">
    <a
      href="/the-word"
      class="w-fit text-sm text-slate-covenant no-underline transition-colors duration-300 hover:text-charcoal"
    >
      ← The Word
    </a>

    <header class="space-y-4">
      <h1 class="font-serif-display text-4xl font-bold text-charcoal">{title}</h1>
      <p class="max-w-3xl text-xl italic text-slate-covenant">{openingStatement}</p>
    </header>

    <a
      href={suggestedEntry.href}
      class="block border-l-4 border-ochre bg-ochre/10 p-5 no-underline transition-colors duration-300 hover:bg-ochre/15"
    >
      <p class="text-sm font-semibold uppercase tracking-[0.18em] text-ochre">
        {suggestedEntry.label}
      </p>
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
              <div
                class="absolute left-[-1.45rem] top-8 h-3 w-3 rounded-full border border-sage bg-parchment sm:left-[-1.8rem]"
              ></div>
              <p class="text-sm font-bold tracking-[0.18em] text-ochre">{stone.number}</p>
              <h3 class="mt-1 font-serif-display text-lg text-charcoal">{stone.title}</h3>
            </a>
          {/each}
        </div>
      </div>
    </section>

    <a
      href="/the-word/diagnostic-engine/walk"
      class="w-fit text-base font-semibold text-slate-covenant no-underline transition-colors duration-300 hover:text-charcoal"
    >
      Take the guided walk →
    </a>
  </div>
</div>
