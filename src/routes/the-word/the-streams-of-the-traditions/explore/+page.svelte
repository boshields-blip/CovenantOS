<script>
  import { onMount } from 'svelte';
  import { withBase } from '$lib/paths';
  import ContentLayout from '$lib/ContentLayout.svelte';
  import data from '../../../../../content/data/streams.json';

  const storageKey = data.storage_key;
  const traditions = data.traditions;
  const groups = data.groups;

  let filter = 'all';
  let expanded = {};
  let shaped = {};

  function groupLabel(id) {
    return groups.find((g) => g.id === id)?.label ?? id;
  }

  function toggleExpand(id) {
    expanded = { ...expanded, [id]: !expanded[id] };
  }

  function toggleShaped(id) {
    const next = { ...shaped, [id]: !shaped[id] };
    if (!next[id]) delete next[id];
    shaped = next;
    if (typeof localStorage !== 'undefined') {
      localStorage.setItem(storageKey, JSON.stringify(next));
    }
  }

  function clearShaped() {
    shaped = {};
    if (typeof localStorage !== 'undefined') {
      localStorage.removeItem(storageKey);
    }
  }

  onMount(() => {
    const saved = localStorage.getItem(storageKey);
    if (!saved) return;
    try {
      shaped = JSON.parse(saved);
    } catch {
      localStorage.removeItem(storageKey);
    }
  });

  $: visible = filter === 'all' ? traditions : traditions.filter((t) => t.group === filter);
  $: shapedList = traditions.filter((t) => shaped[t.id]);
</script>

<ContentLayout
  title="Explore the Streams"
  module="The Word"
  moduleHref="/the-word"
  prevHref="/the-word/the-streams-of-the-traditions/the-household-covenant-tradition"
  prevLabel="The Household-Covenant Tradition"
  nextHref="/the-word/living-the-covenant"
  nextLabel="Living the Covenant"
>
  <div class="space-y-8">
    <div class="space-y-3 border-b border-ochre/20 pb-6">
      <h1 class="font-serif-display text-3xl font-semibold text-charcoal">The Streams of the Traditions</h1>
      <p class="text-lg italic text-slate-covenant">{data.intro}</p>
      <p class="text-sm text-slate-covenant">
        The streams you mark are saved only on this device. Nothing is sent anywhere.
      </p>
    </div>

    <div class="flex flex-wrap gap-2">
      <button
        type="button"
        aria-pressed={filter === 'all'}
        class={`rounded-full border px-4 py-2 text-sm font-semibold no-underline transition-colors duration-300 ${filter === 'all' ? 'border-ochre bg-ochre text-parchment' : 'border-ochre/20 bg-white/70 text-charcoal hover:border-ochre hover:bg-ochre/10'}`}
        on:click={() => (filter = 'all')}
      >
        All streams
      </button>
      {#each groups as g}
        <button
          type="button"
          aria-pressed={filter === g.id}
          class={`rounded-full border px-4 py-2 text-sm font-semibold no-underline transition-colors duration-300 ${filter === g.id ? 'border-ochre bg-ochre text-parchment' : 'border-ochre/20 bg-white/70 text-charcoal hover:border-ochre hover:bg-ochre/10'}`}
          on:click={() => (filter = g.id)}
        >
          {g.label}
        </button>
      {/each}
    </div>

    {#if shapedList.length > 0}
      <div class="rounded-sm border border-sage/30 bg-sage/10 p-4">
        <p class="text-sm font-semibold uppercase tracking-[0.16em] text-slate-covenant">
          Streams that have shaped you ({shapedList.length})
        </p>
        <p class="mt-2 text-base text-charcoal">
          {shapedList.map((t) => t.name).join(' · ')}
        </p>
        <p class="mt-2 text-sm text-slate-covenant">
          Read these first. Carry them into <a href={withBase("/the-word/knowing-your-own-way/the-examination")} class="font-semibold text-ochre underline underline-offset-2">Knowing Your Own Way</a> — how do their gifts and blind spots show up in what you believe?
        </p>
        <button
          type="button"
          class="mt-3 text-sm font-semibold text-slate-covenant underline underline-offset-2 transition-colors hover:text-charcoal"
          on:click={clearShaped}
        >
          Clear marks
        </button>
      </div>
    {/if}

    <div class="space-y-4">
      {#each visible as t (t.id)}
        <section class={`rounded-sm border p-5 shadow-sm transition-colors ${shaped[t.id] ? 'border-ochre/50 bg-ochre/5' : 'border-ochre/15 bg-white/55'}`}>
          <div class="flex flex-wrap items-start justify-between gap-3">
            <div class="space-y-1">
              <span class="inline-block rounded-full bg-sage/10 px-3 py-1 text-xs font-semibold uppercase tracking-[0.12em] text-slate-covenant">
                {groupLabel(t.group)}
              </span>
              <h2 class="font-serif-display text-xl font-semibold text-charcoal">{t.name}</h2>
            </div>
            <button
              type="button"
              aria-pressed={!!shaped[t.id]}
              class={`shrink-0 rounded-full border px-3 py-1.5 text-xs font-semibold transition-colors duration-300 ${shaped[t.id] ? 'border-ochre bg-ochre text-parchment' : 'border-ochre/30 bg-white/70 text-ochre hover:bg-ochre/10'}`}
              on:click={() => toggleShaped(t.id)}
            >
              {shaped[t.id] ? '✓ Shaped me' : 'Shaped me?'}
            </button>
          </div>

          <p class="mt-3 text-base text-charcoal">{t.center}</p>

          {#if expanded[t.id]}
            <div class="mt-4 space-y-4 border-t border-ochre/15 pt-4">
              <div>
                <p class="text-sm font-semibold uppercase tracking-[0.14em] text-sage">Gifts</p>
                <p class="mt-1 text-base text-charcoal">{t.gifts}</p>
              </div>
              <div>
                <p class="text-sm font-semibold uppercase tracking-[0.14em] text-ochre">Blind spots to watch</p>
                <p class="mt-1 text-base text-charcoal">{t.blind_spots}</p>
              </div>
              <div>
                <p class="text-sm font-semibold uppercase tracking-[0.14em] text-slate-covenant">What to receive</p>
                <p class="mt-1 text-base italic text-slate-covenant">{t.receive}</p>
              </div>
            </div>
            <button
              type="button"
              class="mt-4 text-sm font-semibold text-ochre underline underline-offset-4 transition-colors hover:text-charcoal"
              on:click={() => toggleExpand(t.id)}
            >
              Close
            </button>
          {:else}
            <button
              type="button"
              class="mt-3 text-sm font-semibold text-ochre underline underline-offset-4 transition-colors hover:text-charcoal"
              on:click={() => toggleExpand(t.id)}
            >
              Gifts &amp; blind spots →
            </button>
          {/if}
        </section>
      {/each}
    </div>

    <p class="border-t border-ochre/20 pt-6 text-sm text-slate-covenant">
      A tradition map names common tendencies, not verdicts on individuals. Real people are always more than their stream. For the full written treatment, see
      <a href={withBase("/the-word/the-streams-of-the-traditions/the-traditions")} class="font-semibold text-ochre underline underline-offset-2">The Traditions</a>.
    </p>
  </div>
</ContentLayout>
