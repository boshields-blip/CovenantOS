<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/03_the_compact/LOCAL_MARKET_AND_SOCIAL_FABRIC.md';
</script>

<ContentLayout
  title="Local Market and Social Fabric"
  module="The Compact"
  moduleHref="/the-compact"
  prevHref="/the-compact/peoplehood"
  prevLabel="Peoplehood"
  nextHref="/the-compact/seeing-the-neighbor"
  nextLabel="Seeing the Neighbor"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/market-at-the-gate.png")}
      alt="A modest local market of wooden stalls just inside a stone gate — trade as neighbor-love."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
