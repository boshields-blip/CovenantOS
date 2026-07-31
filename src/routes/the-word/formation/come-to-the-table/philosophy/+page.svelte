<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/PHILOSOPHY.md';
</script>

<ContentLayout
  title="Philosophy"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table"
  prevLabel="Come to the Table"
  nextHref="/the-word/formation/come-to-the-table/session-format"
  nextLabel="Session Format"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
