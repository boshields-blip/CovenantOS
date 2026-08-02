<script>
  import { page } from '$app/stores';
  import { withBase } from '$lib/paths';
</script>

<svelte:head>
  <title>Page not found | CovenantOS</title>
</svelte:head>

<div class="min-h-screen bg-parchment flex flex-col items-center justify-center px-6 text-center">
  <div class="max-w-lg">
    <p class="text-sm font-semibold uppercase tracking-[0.2em] text-ochre mb-4">
      {$page.status}
    </p>
    <h1 class="font-serif-display text-3xl font-bold text-charcoal mb-4">
      This path isn't here
    </h1>
    <p class="text-slate-covenant text-lg mb-8">
      You may have followed a link that doesn't exist yet, or mistyped a path.
    </p>
    <a
      href={withBase("/")}
      class="inline-block border border-ochre text-ochre px-6 py-3 text-sm font-semibold rounded-sm no-underline hover:bg-ochre hover:text-parchment transition-colors duration-300"
    >
      Return to the Covenant Map →
    </a>
  </div>
</div>
