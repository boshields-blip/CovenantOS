<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/BEREAN_AT_THE_TABLE.md';
</script>

<ContentLayout
  title="Berean at the Table"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table/authors-and-languages"
  prevLabel="Authors and Languages"
  nextHref="/the-word/formation/come-to-the-table/seasonal-liturgy"
  nextLabel="Seasonal Liturgy"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
