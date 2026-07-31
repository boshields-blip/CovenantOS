<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/winter.md';
</script>

<ContentLayout
  title="Winter Seasonal Overlay"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table/liturgies/seasonal/fall"
  prevLabel="Fall Seasonal Overlay"
  nextHref="/the-word/formation/harvest-and-hymn"
  nextLabel="Harvest & Hymn"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
