<script>
  export let title = '';
  export let module = '';
  export let moduleHref = '/';
  export let prevHref = '';
  export let prevLabel = '';
  export let nextHref = '';
  export let nextLabel = '';
</script>

<svelte:head>
  <title>{title} | CovenantOS</title>
</svelte:head>

<div class="min-h-screen bg-parchment text-charcoal">
  <nav class="sticky top-0 z-10 border-b border-ochre/20 bg-parchment/95 backdrop-blur-sm">
    <div class="mx-auto flex max-w-3xl items-center justify-between px-6 py-3">
      <div class="flex items-center gap-3 text-sm">
        <a href="/" class="text-slate-covenant no-underline transition-colors hover:text-charcoal">
          CovenantOS
        </a>
        <span class="text-ochre/60">›</span>
        <a
          href={moduleHref}
          class="text-slate-covenant no-underline transition-colors hover:text-charcoal"
        >
          {module}
        </a>
        <span class="text-ochre/60">›</span>
        <span class="text-charcoal">{title}</span>
      </div>
    </div>
  </nav>

  <main class="mx-auto max-w-3xl px-6 py-12">
    <article class="prose-covenant">
      <slot />
    </article>

    {#if prevHref || nextHref}
      <nav class="mt-16 flex items-center justify-between border-t border-ochre/20 pt-8">
        {#if prevHref}
          <a href={prevHref} class="group flex flex-col no-underline">
            <span class="text-xs text-slate-covenant">← Previous</span>
            <span
              class="text-sm font-semibold text-charcoal transition-colors group-hover:text-ochre"
            >
              {prevLabel}
            </span>
          </a>
        {:else}
          <div></div>
        {/if}

        {#if nextHref}
          <a href={nextHref} class="group flex flex-col items-end no-underline">
            <span class="text-xs text-slate-covenant">Next →</span>
            <span
              class="text-sm font-semibold text-charcoal transition-colors group-hover:text-ochre"
            >
              {nextLabel}
            </span>
          </a>
        {/if}
      </nav>
    {/if}
  </main>
</div>
