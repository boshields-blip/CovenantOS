<script>
  import { onMount } from 'svelte';
  import ContentLayout from '$lib/ContentLayout.svelte';
  import builder from '../../../../content/data/compact_builder.json';

  const storageKey = 'compact_builder_reflections';
  const sections = builder.sections;
  const totalSections = sections.length;

  let currentIndex = 0;
  let reflections = {};

  function formatStep(index) {
    return String(index + 1).padStart(2, '0');
  }

  function updateReflection(id, value) {
    const next = {
      ...reflections,
      [id]: value
    };

    reflections = next;
    persistReflections(next);
  }

  function persistReflections(next) {
    if (typeof localStorage === 'undefined') {
      return;
    }

    localStorage.setItem(storageKey, JSON.stringify(next));
  }

  function clearReflections() {
    reflections = {};
    currentIndex = 0;

    if (typeof localStorage === 'undefined') {
      return;
    }

    localStorage.removeItem(storageKey);
  }

  function previousSection() {
    if (currentIndex > 0) {
      currentIndex -= 1;
    }
  }

  function nextSection() {
    if (currentIndex < totalSections - 1) {
      currentIndex += 1;
    }
  }

  function escapeHtml(value) {
    return value
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&#39;');
  }

  function buildSectionText(section) {
    const lines = [section.print_title, '', section.framing_sentence, ''];

    section.questions.forEach((question, index) => {
      lines.push(`${index + 1}. ${question.text}`);
      lines.push('');
      lines.push((reflections[question.id] ?? '').trim() || '[No reflection saved]');
      lines.push('');
    });

    if (currentIndex === totalSections - 1) {
      lines.push('Closing reflection');
      lines.push('');
      lines.push(builder.closing_reflection);
    }

    return lines.join('\n');
  }

  function exportSection() {
    if (typeof window === 'undefined') {
      return;
    }

    const content = buildSectionText(currentSection);
    const blob = new Blob([content], { type: 'text/plain;charset=utf-8' });
    const href = URL.createObjectURL(blob);
    const link = document.createElement('a');

    link.href = href;
    link.download = `${currentSection.export_label}.txt`;
    link.click();

    URL.revokeObjectURL(href);
  }

  function printSection() {
    if (typeof window === 'undefined') {
      return;
    }

    const windowRef = window.open('', '_blank', 'noopener,noreferrer');

    if (!windowRef) {
      return;
    }

    const content = buildSectionText(currentSection)
      .split('\n')
      .map((line) => `<p>${escapeHtml(line) || '&nbsp;'}</p>`)
      .join('');

    windowRef.document.write(`
      <html>
        <head>
          <title>${escapeHtml(currentSection.print_title)}</title>
          <style>
            body {
              font-family: Georgia, serif;
              line-height: 1.6;
              margin: 2rem;
              color: #2C2417;
            }
            h1 {
              margin-bottom: 1.5rem;
            }
            p {
              margin: 0 0 0.85rem;
              white-space: pre-wrap;
            }
          </style>
        </head>
        <body>
          <h1>${escapeHtml(currentSection.print_title)}</h1>
          ${content}
        </body>
      </html>
    `);
    windowRef.document.close();
    windowRef.focus();
    windowRef.print();
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

  $: currentSection = sections[currentIndex];
</script>

<ContentLayout
  title="Compact Builder"
  module="The Compact"
  moduleHref="/the-compact"
  prevHref="/the-compact/hebraic-word-studies"
  prevLabel="Hebraic Word Studies"
>
  <div class="space-y-8">
    <div class="space-y-3 border-b border-ochre/20 pb-6">
      <p class="text-sm font-semibold uppercase tracking-[0.2em] text-ochre">
        {formatStep(currentIndex)} / {formatStep(totalSections)}
      </p>
      <h1 class="font-serif-display text-3xl font-semibold text-charcoal">{currentSection.title}</h1>
      <p class="text-lg italic text-slate-covenant">{currentSection.framing_sentence}</p>
      <p class="text-sm text-slate-covenant">
        Your reflections are saved only on this device. Nothing is sent anywhere.
      </p>
    </div>

    <div class="flex flex-wrap gap-3">
      <button
        type="button"
        class="rounded-sm border border-ochre/40 px-4 py-2 text-sm font-semibold text-ochre transition-colors duration-300 hover:border-ochre hover:bg-ochre/10 hover:text-charcoal"
        on:click={printSection}
      >
        Print this section
      </button>
      <button
        type="button"
        class="rounded-sm border border-sage/40 px-4 py-2 text-sm font-semibold text-slate-covenant transition-colors duration-300 hover:border-sage hover:text-charcoal"
        on:click={exportSection}
      >
        Export this section
      </button>
      <button
        type="button"
        class="rounded-sm border border-charcoal/20 px-4 py-2 text-sm font-semibold text-slate-covenant transition-colors duration-300 hover:border-charcoal hover:text-charcoal"
        on:click={clearReflections}
      >
        Clear saved reflections
      </button>
    </div>

    <div class="space-y-6">
      {#each currentSection.questions as question, index}
        <section class="space-y-3 rounded-sm border border-ochre/15 bg-white/55 p-5 shadow-sm">
          <div class="space-y-2">
            <div class="flex flex-wrap items-center gap-3">
              <p class="text-sm font-semibold uppercase tracking-[0.18em] text-ochre">
                Question {index + 1}
              </p>
              <span class="rounded-full bg-sage/10 px-3 py-1 text-xs font-semibold uppercase tracking-[0.12em] text-slate-covenant">
                {question.type}
              </span>
            </div>
            <p class="text-base text-charcoal">{question.text}</p>
          </div>

          <textarea
            class="min-h-40 w-full rounded-sm border border-ochre/30 bg-parchment/60 px-4 py-3 text-base text-charcoal shadow-sm outline-none transition-colors duration-300 placeholder:text-slate-covenant/70 focus:border-ochre focus:ring-2 focus:ring-ochre/20"
            placeholder="Write your reflection."
            value={reflections[question.id] ?? ''}
            on:input={(event) => updateReflection(question.id, event.currentTarget.value)}
          ></textarea>
        </section>
      {/each}
    </div>

    {#if currentIndex === totalSections - 1}
      <section class="space-y-3 border-t border-ochre/20 pt-6">
        <h2 class="font-serif-display text-2xl font-semibold text-charcoal">Closing reflection</h2>
        <div class="pull-quote whitespace-pre-line">{builder.closing_reflection}</div>
      </section>
    {/if}

    <div class="flex flex-col gap-4 border-t border-ochre/20 pt-6 sm:flex-row sm:items-center sm:justify-between">
      <button
        type="button"
        class="w-full rounded-sm border border-sage/40 px-4 py-3 text-sm font-semibold text-slate-covenant transition-colors duration-300 hover:border-sage hover:text-charcoal disabled:cursor-not-allowed disabled:opacity-40 sm:w-auto"
        on:click={previousSection}
        disabled={currentIndex === 0}
      >
        ← Previous section
      </button>

      <button
        type="button"
        class="w-full rounded-sm bg-charcoal px-4 py-3 text-sm font-semibold text-parchment transition-colors duration-300 hover:bg-ochre disabled:cursor-not-allowed disabled:opacity-40 sm:w-auto"
        on:click={nextSection}
        disabled={currentIndex === totalSections - 1}
      >
        {currentIndex === totalSections - 1 ? 'All sections complete' : 'Next section →'}
      </button>
    </div>
  </div>
</ContentLayout>
