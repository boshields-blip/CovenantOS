<script>
  export let activeHref = '';

  const links = [
    { href: '/the-word/living-the-covenant/come-to-the-table', label: 'Come to the Table' },
    { href: '/the-word/living-the-covenant/harvest-and-hymn', label: 'Harvest & Hymn' }
  ];

  function linkClasses(href) {
    return activeHref === href
      ? 'border-ochre bg-ochre text-parchment'
      : 'border-ochre/20 bg-white/70 text-charcoal hover:border-ochre hover:bg-ochre/10';
  }
</script>

<div class="not-prose mb-8 flex flex-wrap gap-3 border-b border-ochre/20 pb-6">
  {#each links as link}
    <a
      href={link.href}
      aria-current={activeHref === link.href ? 'page' : undefined}
      class={`rounded-full border px-4 py-2 text-sm font-semibold no-underline transition-colors duration-300 ${linkClasses(link.href)}`}
    >
      {link.label}
    </a>
  {/each}
</div>
