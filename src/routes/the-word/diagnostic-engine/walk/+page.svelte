<script>
  import { onMount } from 'svelte';
  import ContentLayout from '$lib/ContentLayout.svelte';
  import walk from '../../../../../content/data/diagnostic_walk.json';

  const storageKey = 'diagnostic_walk_reflections';
  const categories = walk.categories;
  const totalCategories = categories.length;
  const availablePhilosophySlugs = new Set([
    'consumerism',
    'expressive-individualism',
    'materialism',
    'postmodernism',
    'progressivist-utopianism',
    'technocratic-rationalism',
    'therapeutic-anthropology'
  ]);

  let currentIndex = 0;
  let reflections = {};

  function formatStep(index) {
    return String(index + 1).padStart(2, '0');
  }

  function categoryHref(id) {
    return `/the-word/diagnostic-engine/categories/${id.replace(/_/g, '-')}`;
  }

  function philosophyHref(name) {
    const slug = name
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-|-$/g, '');

    if (!availablePhilosophySlugs.has(slug)) {
      return '';
    }

    return `/the-word/diagnostic-engine/philosophy-modules/${slug}`;
  }

  function updateReflection(id, value) {
    const next = {
      ...reflections,
      [id]: value
    };

    reflections = next;

    if (typeof localStorage === 'undefined') {
      return;
    }

    localStorage.setItem(storageKey, JSON.stringify(next));
  }

  function previousCategory() {
    if (currentIndex > 0) {
      currentIndex -= 1;
    }
  }

  function nextCategory() {
    if (currentIndex < totalCategories - 1) {
      currentIndex += 1;
    }
  }

  function clearReflections() {
    reflections = {};

    if (typeof localStorage === 'undefined') {
      return;
    }

    localStorage.removeItem(storageKey);
  }

  onMount(() => {
    const saved = localStorage.getItem(storageKey);

    if (!saved) {
      return;
    }

    try {
      reflections = JSON.parse(saved);
    } catch {
      localStorage.removeItem(storageKey);
    }
  });

  $: currentCategory = categories[currentIndex];
</script>

<ContentLayout
  title="Diagnostic Walk"
  module="The Word"
  moduleHref="/the-word"
  prevHref="/the-word/diagnostic-engine"
  prevLabel="Diagnostic Engine"
>
  <div class="space-y-8">
    <div class="flex flex-col gap-3 border-b border-ochre/20 pb-6 sm:flex-row sm:items-start sm:justify-between">
      <div class="space-y-3">
        <p class="text-sm font-semibold uppercase tracking-[0.2em] text-ochre">
          {formatStep(currentIndex)} / {formatStep(totalCategories)}
        </p>
        <p class="text-sm text-slate-covenant">
          Your reflections are saved only on this device. Nothing is sent anywhere.
        </p>
        <h1 class="font-serif-display text-2xl italic text-charcoal">
          {currentCategory.central_question}
        </h1>
        <p class="text-base text-slate-covenant">
          Walk one diagnostic category at a time and name what is shaping imagination.
        </p>
      </div>

      <a
        href={categoryHref(currentCategory.id)}
        class="w-fit text-sm font-semibold text-slate-covenant no-underline transition-colors duration-300 hover:text-charcoal"
      >
        Read the full {currentCategory.title} page →
      </a>
    </div>

    <section aria-labelledby="diagnostic-questions" class="space-y-4">
      <div class="space-y-1">
        <p class="text-sm font-semibold uppercase tracking-[0.18em] text-ochre">
          {currentCategory.title}
        </p>
        <h2 id="diagnostic-questions" class="font-serif-display text-xl font-semibold text-charcoal">
          Diagnostic questions
        </h2>
      </div>

      <ul class="list-disc space-y-3 pl-6 marker:text-ochre">
        {#each currentCategory.diagnostic_questions as question}
          <li>{question}</li>
        {/each}
      </ul>
    </section>

    <section aria-labelledby="covenantal-contrast" class="space-y-3">
      <h2 id="covenantal-contrast" class="font-serif-display text-xl font-semibold text-charcoal">
        Covenantal contrast
      </h2>
      <blockquote class="pull-quote">{currentCategory.covenantal_contrast}</blockquote>
    </section>

    <section aria-labelledby="rival-philosophies" class="space-y-3">
      <h2 id="rival-philosophies" class="font-serif-display text-xl font-semibold text-charcoal">
        Rival philosophies
      </h2>
      <div class="flex flex-wrap gap-3">
        {#each currentCategory.rival_philosophies as philosophy}
          {@const href = philosophyHref(philosophy)}

          {#if href}
            <a
              href={href}
              class="rounded-full border border-ochre/40 bg-ochre/10 px-3 py-1 text-sm font-medium text-ochre no-underline transition-colors duration-300 hover:bg-ochre/20 hover:text-charcoal"
            >
              {philosophy}
            </a>
          {:else}
            <span class="rounded-full border border-sage/30 bg-sage/10 px-3 py-1 text-sm font-medium text-slate-covenant">
              {philosophy}
            </span>
          {/if}
        {/each}
      </div>
    </section>

    <section aria-labelledby="reflection-prompt" class="space-y-3">
      <div class="space-y-1">
        <h2 id="reflection-prompt" class="font-serif-display text-xl font-semibold text-charcoal">
          Reflection
        </h2>
        <p class="italic text-slate-covenant">{currentCategory.reflection_prompt}</p>
      </div>

      <textarea
        class="min-h-44 w-full rounded-sm border border-ochre/30 bg-white/70 px-4 py-3 text-base text-charcoal shadow-sm outline-none transition-colors duration-300 placeholder:text-slate-covenant/70 focus:border-ochre focus:ring-2 focus:ring-ochre/20"
        placeholder="Write what this category reveals."
        value={reflections[currentCategory.id] ?? ''}
        on:input={(event) => updateReflection(currentCategory.id, event.currentTarget.value)}
      ></textarea>
    </section>

    <div class="flex flex-col gap-4 border-t border-ochre/20 pt-6 sm:flex-row sm:items-center sm:justify-between">
      <button
        type="button"
        class="w-full rounded-sm border border-sage/40 px-4 py-3 text-sm font-semibold text-slate-covenant transition-colors duration-300 hover:border-sage hover:text-charcoal disabled:cursor-not-allowed disabled:opacity-40 sm:w-auto"
        on:click={previousCategory}
        disabled={currentIndex === 0}
      >
        ← Previous category
      </button>

      <button
        type="button"
        class="w-full rounded-sm border border-ochre/40 px-4 py-3 text-sm font-semibold text-ochre transition-colors duration-300 hover:border-ochre hover:bg-ochre/10 hover:text-charcoal sm:w-auto"
        on:click={clearReflections}
      >
        Clear reflections
      </button>

      <button
        type="button"
        class="w-full rounded-sm bg-charcoal px-4 py-3 text-sm font-semibold text-parchment transition-colors duration-300 hover:bg-ochre disabled:cursor-not-allowed disabled:opacity-40 sm:w-auto"
        on:click={nextCategory}
        disabled={currentIndex === totalCategories - 1}
      >
        {currentIndex === totalCategories - 1 ? 'Walk complete' : 'Next category →'}
      </button>
    </div>
  </div>
</ContentLayout>
