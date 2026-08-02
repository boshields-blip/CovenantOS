<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/02_the_household/HOUSEHOLD_VS_CONSUMER_ECONOMY.md';
</script>

<ContentLayout
  title="Household Economy vs Consumer Economy"
  module="The Household"
  moduleHref="/the-household"
  prevHref="/the-household/agrarian-rhythms"
  prevLabel="Agrarian Rhythms"
  nextHref="/the-household/land-and-inheritance"
  nextLabel="Land and Inheritance"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/gleaning.png")}
      alt="A gleaner gathering grain left at the edge of a harvested field — ownership bounded by mercy."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
