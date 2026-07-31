<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/CANONICAL_ARC.md';
</script>

<ContentLayout
  title="Canonical Arc"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table/guest-family-guide"
  prevLabel="Guest Family Guide"
  nextHref="/the-word/formation/come-to-the-table/age-bands"
  nextLabel="Age Bands"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
