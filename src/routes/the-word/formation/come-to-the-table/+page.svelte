<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/README.md';
</script>

<ContentLayout
  title="Come to the Table"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/reformation-pathway"
  prevLabel="Re-formation Pathway"
  nextHref="/the-word/formation/come-to-the-table/philosophy"
  nextLabel="Philosophy"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
