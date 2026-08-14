<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/02_the_household/SINGLENESS_AND_OIKONOMIA.md';
</script>

<ContentLayout
  title="Singleness and Oikonomia"
  module="The Household"
  moduleHref="/the-household"
  prevHref="/the-household/the-ordered-household"
  prevLabel="The Ordered Household"
  nextHref="/the-household/land-and-inheritance"
  nextLabel="Land and Inheritance"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/the-household-table.png")}
      alt="A shared working table with several places set inside a household."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
