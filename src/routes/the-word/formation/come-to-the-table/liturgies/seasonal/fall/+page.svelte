<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/fall.md';
</script>

<ContentLayout
  title="Fall Seasonal Overlay"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table/liturgies/seasonal/summer"
  prevLabel="Summer Seasonal Overlay"
  nextHref="/the-word/formation/come-to-the-table/liturgies/seasonal/winter"
  nextLabel="Winter Seasonal Overlay"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
