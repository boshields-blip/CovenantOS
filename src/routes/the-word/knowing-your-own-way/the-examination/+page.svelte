<script>
  import { onMount } from 'svelte';
  import ContentLayout from '$lib/ContentLayout.svelte';
  import data from '../../../../../content/data/knowing_your_own_way.json';

  const storageKey = data.storage_key;
  const steps = data.steps;
  const totalSteps = steps.length;

  let currentIndex = 0;
  let reflections = {};
  let revealed = {};

  function formatStep(index) {
    return String(index + 1).padStart(2, '0');
  }

  function updateReflection(id, value) {
    const next = { ...reflections, [id]: value };
    reflections = next;
    if (typeof localStorage !== 'undefined') {
      localStorage.setItem(storageKey, JSON.stringify(next));
    }
  }

  function toggleReveal(id) {
    revealed = { ...revealed, [id]: !revealed[id] };
  }

  function clearReflections() {
    reflections = {};
    currentIndex = 0;
    revealed = {};
    if (typeof localStorage !== 'undefined') {
      localStorage.removeItem(storageKey);
    }
  }

  function previousStep() {
    if (currentIndex > 0) currentIndex -= 1;
  }

  function nextStep() {
    if (currentIndex < totalSteps - 1) currentIndex += 1;
  }

  function escapeHtml(value) {
    return value
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&#39;');
  }

  function buildAllText() {
    const lines = [data.print_title, '', data.intro, ''];
    steps.forEach((step) => {
      lines.push(`${step.subtitle} — ${step.title}`);
      lines.push('');
      lines.push('My reflection:');
      lines.push((reflections[step.id] ?? '').trim() || '[No reflection saved]');
      lines.push('');
      lines.push('From the land of the text:');
      lines.push(step.land_of_text);
      lines.push('');
      lines.push('—');
      lines.push('');
    });
    lines.push('Closing');
    lines.push('');
    lines.push(data.closing);
    return lines.join('\n');
  }

  function exportAll() {
    if (typeof window === 'undefined') return;
    const blob = new Blob([buildAllText()], { type: 'text/plain;charset=utf-8' });
    const href = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = href;
    link.download = `${data.export_label}.txt`;
    link.click();
    URL.revokeObjectURL(href);
  }

  function printAll() {
    if (typeof window === 'undefined') return;
    const windowRef = window.open('', '_blank', 'noopener,noreferrer');
    if (!windowRef) return;
    const body = buildAllText()
      .split('\n')
      .map((line) => `<p>${escapeHtml(line) || '&nbsp;'}</p>`)
      .join('');
    windowRef.document.write(
      `<html><head><title>${escapeHtml(data.print_title)}</title>` +
        '<style>body{font-family:Georgia,serif;line-height:1.6;margin:2rem;color:#2C2417}' +
        'h1{margin-bottom:1.5rem}p{margin:0 0 .85rem;white-space:pre-wrap}</style></head>' +
        `<body><h1>${escapeHtml(data.print_title)}</h1>${body}</body></html>`
    );
    windowRef.document.close();
    windowRef.focus();
    windowRef.print();
  }

  onMount(() => {
    const saved = localStorage.getItem(storageKey);
    if (!saved) return;
    try {
      reflections = JSON.parse(saved);
    } catch {
      localStorage.removeItem(storageKey);
    }
  });

  $: step = steps[currentIndex];
</script>

<ContentLayout
  title="The Examination"
  module="The Word"
  moduleHref="/the-word"
  prevHref="/the-word/knowing-your-own-way/the-cultural-currents"
  prevLabel="The Cultural Currents"
  nextHref="/the-word/the-streams-of-the-traditions"
  nextLabel="The Streams of the Traditions"
>
  <div class="space-y-8">
    <div class="space-y-3 border-b border-ochre/20 pb-6">
      <p class="text-sm font-semibold uppercase tracking-[0.2em] text-ochre">
        {formatStep(currentIndex)} / {formatStep(totalSteps)}
      </p>
      <h1 class="font-serif-display text-3xl font-semibold text-charcoal">Knowing Your Own Way</h1>
      <p class="text-lg italic text-slate-covenant">{data.intro}</p>
      <p class="text-sm text-slate-covenant">
        Your reflections are saved only on this device. Nothing is sent anywhere.
      </p>
    </div>

    <div class="flex flex-wrap gap-3">
      <button
        type="button"
        class="rounded-sm border border-ochre/40 px-4 py-2 text-sm font-semibold text-ochre transition-colors duration-300 hover:border-ochre hover:bg-ochre/10 hover:text-charcoal"
        on:click={printAll}
      >
        Print all reflections
      </button>
      <button
        type="button"
        class="rounded-sm border border-sage/40 px-4 py-2 text-sm font-semibold text-slate-covenant transition-colors duration-300 hover:border-sage hover:text-charcoal"
        on:click={exportAll}
      >
        Export all reflections
      </button>
      <button
        type="button"
        class="rounded-sm border border-charcoal/20 px-4 py-2 text-sm font-semibold text-slate-covenant transition-colors duration-300 hover:border-charcoal hover:text-charcoal"
        on:click={clearReflections}
      >
        Clear saved reflections
      </button>
    </div>

    <section class="space-y-5 rounded-sm border border-ochre/15 bg-white/55 p-6 shadow-sm">
      <div class="space-y-2">
        <span class="inline-block rounded-full bg-sage/10 px-3 py-1 text-xs font-semibold uppercase tracking-[0.12em] text-slate-covenant">
          {step.subtitle}
        </span>
        <h2 class="font-serif-display text-2xl font-semibold text-charcoal">{step.title}</h2>
        <p class="text-base text-slate-covenant">{step.why}</p>
      </div>

      <div class="space-y-2">
        <p class="text-sm font-semibold uppercase tracking-[0.16em] text-ochre">Ask yourself</p>
        <ul class="list-disc space-y-1 pl-5 text-base text-charcoal">
          {#each step.ask as item}
            <li>{item}</li>
          {/each}
        </ul>
      </div>

      <div>
        <textarea
          class="min-h-40 w-full rounded-sm border border-ochre/30 bg-parchment/60 px-4 py-3 text-base text-charcoal shadow-sm outline-none transition-colors duration-300 placeholder:text-slate-covenant/70 focus:border-ochre focus:ring-2 focus:ring-ochre/20"
          placeholder={step.reflect_prompt}
          value={reflections[step.id] ?? ''}
          on:input={(event) => updateReflection(step.id, event.currentTarget.value)}
        ></textarea>
      </div>

      <div class="border-t border-ochre/15 pt-4">
        {#if revealed[step.id]}
          <div class="rounded-sm bg-ochre/10 p-4">
            <p class="text-sm font-semibold uppercase tracking-[0.16em] text-ochre">
              From the land of the text
            </p>
            <p class="mt-2 text-base text-charcoal">{step.land_of_text}</p>
          </div>
        {:else}
          <button
            type="button"
            class="text-sm font-semibold text-ochre underline underline-offset-4 transition-colors duration-300 hover:text-charcoal"
            on:click={() => toggleReveal(step.id)}
          >
            Reveal what arises from the land of the text →
          </button>
          <p class="mt-1 text-sm text-slate-covenant">Sit with your own answer first.</p>
        {/if}
      </div>
    </section>

    {#if currentIndex === totalSteps - 1}
      <section class="space-y-3 border-t border-ochre/20 pt-6">
        <h2 class="font-serif-display text-2xl font-semibold text-charcoal">Closing</h2>
        <div class="pull-quote whitespace-pre-line">{data.closing}</div>
      </section>
    {/if}

    <div class="flex flex-col gap-4 border-t border-ochre/20 pt-6 sm:flex-row sm:items-center sm:justify-between">
      <button
        type="button"
        class="w-full rounded-sm border border-sage/40 px-4 py-3 text-sm font-semibold text-slate-covenant transition-colors duration-300 hover:border-sage hover:text-charcoal disabled:cursor-not-allowed disabled:opacity-40 sm:w-auto"
        on:click={previousStep}
        disabled={currentIndex === 0}
      >
        ← Previous
      </button>

      <button
        type="button"
        class="w-full rounded-sm bg-charcoal px-4 py-3 text-sm font-semibold text-parchment transition-colors duration-300 hover:bg-ochre disabled:cursor-not-allowed disabled:opacity-40 sm:w-auto"
        on:click={nextStep}
        disabled={currentIndex === totalSteps - 1}
      >
        {currentIndex === totalSteps - 1 ? 'You have walked them all' : 'Next →'}
      </button>
    </div>
  </div>
</ContentLayout>
