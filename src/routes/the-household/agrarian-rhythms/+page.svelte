<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/02_the_household/AGRARIAN_RHYTHMS.md';
</script>

<ContentLayout
  title="Agrarian Rhythms"
  module="The Household"
  moduleHref="/the-household"
  prevHref="/the-household/household-flow-model"
  prevLabel="Household Flow Model"
  nextHref="/the-household/household-vs-consumer-economy"
  nextLabel="Household vs Consumer Economy"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/seasonal-wheel.png")}
      alt="The agrarian year as one turning wheel — seed, growth, harvest, and rest."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
