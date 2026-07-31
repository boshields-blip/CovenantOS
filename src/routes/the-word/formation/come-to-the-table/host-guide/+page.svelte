<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/HOST_GUIDE.md';
</script>

<ContentLayout
  title="Host Guide"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table/session-format"
  prevLabel="Session Format"
  nextHref="/the-word/formation/come-to-the-table/guest-family-guide"
  nextLabel="Guest Family Guide"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
