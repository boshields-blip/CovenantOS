<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/SESSION_FORMAT.md';
</script>

<ContentLayout
  title="Session Format"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table/philosophy"
  prevLabel="Philosophy"
  nextHref="/the-word/formation/come-to-the-table/host-guide"
  nextLabel="Host Guide"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
