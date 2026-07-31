<script>
  export let hebrew = '';
  export let transliteration = '';
  export let gloss = '';
  export let references = [];
  export let implication = '';
</script>

<div class="rounded-sm border border-ochre/20 bg-white/60 p-5 text-charcoal shadow-sm">
  <div class="space-y-2">
    <div class="flex flex-wrap items-baseline gap-3">
      <span class="hebrew-token text-2xl">{hebrew}</span>
      {#if transliteration}
        <span class="text-base italic text-slate-covenant">({transliteration})</span>
      {/if}
    </div>

    {#if gloss}
      <p class="font-semibold text-charcoal">{gloss}</p>
    {/if}

    {#if references.length}
      <p class="text-sm text-slate-covenant">{references.join('; ')}</p>
    {/if}

    {#if implication}
      <p>{implication}</p>
    {/if}

    <slot />
  </div>
</div>
