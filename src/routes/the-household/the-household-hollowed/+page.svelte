<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/02_the_household/THE_HOUSEHOLD_HOLLOWED.md';
</script>

<ContentLayout
  title="The Household Hollowed"
  module="The Household"
  moduleHref="/the-household"
  prevHref="/the-household/household-vs-consumer-economy"
  prevLabel="Household vs Consumer Economy"
  nextHref="/the-household/the-ordered-household"
  nextLabel="The Ordered Household"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/the-household-hollowed.png")}
      alt="A cold, swept hearth and a bare tool wall in an emptied house — the home that no longer makes anything."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
