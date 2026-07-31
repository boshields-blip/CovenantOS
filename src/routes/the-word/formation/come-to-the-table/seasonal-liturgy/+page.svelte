<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/SEASONAL_LITURGY.md';
</script>

<ContentLayout
  title="Seasonal Liturgy"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table/berean-at-the-table"
  prevLabel="Berean at the Table"
  nextHref="/the-word/formation/come-to-the-table/liturgies/opening"
  nextLabel="Opening Liturgy"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
