<script>
  const title = 'Philosophy Modules';
  const openingStatement =
    'Seven named philosophical traditions that rival the covenantal frame. Each module names the tradition, diagnoses its distortions, and maps it across the seven diagnostic categories.';
  const stones = [
    {
      number: '01',
      title: 'Consumerism',
      description: 'Trace how preference, acquisition, and convenience distort covenantal life.',
      href: '/the-word/diagnostic-engine/philosophy-modules/consumerism'
    },
    {
      number: '02',
      title: 'Expressive Individualism',
      description: 'Name the inward self as the measure of authenticity, belonging, and authority.',
      href: '/the-word/diagnostic-engine/philosophy-modules/expressive-individualism'
    },
    {
      number: '03',
      title: 'Materialism',
      description: 'Examine the flattening of reality into matter, mechanism, and measurable force.',
      href: '/the-word/diagnostic-engine/philosophy-modules/materialism'
    },
    {
      number: '04',
      title: 'Postmodernism',
      description: 'See how suspicion toward truth, meaning, and inheritance fragments shared life.',
      href: '/the-word/diagnostic-engine/philosophy-modules/postmodernism'
    },
    {
      number: '05',
      title: 'Progressivist Utopianism',
      description: 'Interrogate the promise that history bends upward through managed human progress.',
      href: '/the-word/diagnostic-engine/philosophy-modules/progressivist-utopianism'
    },
    {
      number: '06',
      title: 'Technocratic Rationalism',
      description: 'Diagnose the reduction of wisdom to systems, expertise, and optimization.',
      href: '/the-word/diagnostic-engine/philosophy-modules/technocratic-rationalism'
    },
    {
      number: '07',
      title: 'Therapeutic Anthropology',
      description: 'Identify the self managed through wellness, safety, and emotional regulation.',
      href: '/the-word/diagnostic-engine/philosophy-modules/therapeutic-anthropology'
    }
  ];
</script>

<svelte:head>
  <title>{title} | CovenantOS</title>
</svelte:head>

<div class="min-h-screen bg-parchment px-6 py-8 text-charcoal sm:px-8 lg:px-12">
  <div class="mx-auto flex w-full max-w-4xl flex-col gap-8">
    <a
      href="/the-word/diagnostic-engine"
      class="w-fit text-sm text-slate-covenant no-underline transition-colors duration-300 hover:text-charcoal"
    >
      ← Diagnostic Engine
    </a>

    <header class="space-y-4">
      <h1 class="font-serif-display text-4xl font-bold text-charcoal">{title}</h1>
      <p class="max-w-3xl text-xl italic text-slate-covenant">{openingStatement}</p>
    </header>

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
