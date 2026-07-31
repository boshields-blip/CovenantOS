<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/summer.md';
</script>

<ContentLayout
  title="Summer Seasonal Overlay"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table/liturgies/seasonal/spring"
  prevLabel="Spring Seasonal Overlay"
  nextHref="/the-word/formation/come-to-the-table/liturgies/seasonal/fall"
  nextLabel="Fall Seasonal Overlay"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
