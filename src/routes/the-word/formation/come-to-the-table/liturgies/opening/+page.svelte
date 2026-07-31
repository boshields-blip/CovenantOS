<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/opening.md';
</script>

<ContentLayout
  title="Opening Liturgy"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table/seasonal-liturgy"
  prevLabel="Seasonal Liturgy"
  nextHref="/the-word/formation/come-to-the-table/liturgies/reading"
  nextLabel="Reading Liturgy"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
