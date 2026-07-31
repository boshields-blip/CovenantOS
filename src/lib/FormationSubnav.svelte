<script>
  export let activeHref = '';

  const links = [
    { href: '/the-word/formation/come-to-the-table', label: 'Come to the Table' },
    { href: '/the-word/formation/harvest-and-hymn', label: 'Harvest & Hymn' }
  ];
</script>

<div class="not-prose mb-8 flex flex-wrap gap-3 border-b border-ochre/20 pb-6">
  {#each links as link}
    <a
      href={link.href}
      aria-current={activeHref === link.href ? 'page' : undefined}
      class:bg-ochre={activeHref === link.href}
      class:text-parchment={activeHref === link.href}
      class:border-ochre={activeHref === link.href}
      class:bg-white/70={activeHref !== link.href}
      class:text-charcoal={activeHref !== link.href}
      class:border-ochre/20={activeHref !== link.href}
      class="rounded-full border px-4 py-2 text-sm font-semibold no-underline transition-colors duration-300 hover:border-ochre hover:bg-ochre/10"
    >
      {link.label}
    </a>
  {/each}
</div>
