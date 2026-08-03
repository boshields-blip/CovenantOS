<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/02_the_household/THE_ORDERED_HOUSEHOLD.md';
</script>

<ContentLayout
  title="The Ordered Household"
  module="The Household"
  moduleHref="/the-household"
  prevHref="/the-household/the-household-hollowed"
  prevLabel="The Household Hollowed"
  nextHref="/the-household/land-and-inheritance"
  nextLabel="Land and Inheritance"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/the-ordered-household.png")}
      alt="A household of many ages at shared work around a table, the hearth lit again — a home alive with common labor."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
