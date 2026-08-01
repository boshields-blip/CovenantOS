<script>
  import ContentLayout from '$lib/ContentLayout.svelte';

  const householdNodes = [
    { label: 'Land', x: 260, y: 76 },
    { label: 'Work', x: 415, y: 166 },
    { label: 'Garden/Harvest', x: 415, y: 344 },
    { label: 'Table', x: 260, y: 434 },
    { label: 'Hospitality', x: 105, y: 344 },
    { label: 'Trade', x: 105, y: 166 }
  ];

  const consumerNodes = [
    { label: 'Platform', x: 90, y: 230 },
    { label: 'Purchase', x: 220, y: 230 },
    { label: 'Consume', x: 350, y: 230 },
    { label: 'Dispose', x: 480, y: 230 }
  ];

  const householdArrows = [
    'M291 94 L384 148',
    'M415 214 L415 296',
    'M384 362 L291 416',
    'M229 416 L136 362',
    'M105 296 L105 214',
    'M136 148 L229 94'
  ];

  const consumerArrows = ['M136 230 L174 230', 'M266 230 L304 230', 'M396 230 L434 230'];

  let showConsumerEconomy = false;
</script>

<ContentLayout
  title="Household Flow Model"
  module="The Household"
  moduleHref="/the-household"
  nextHref="/the-household/agrarian-rhythms"
  nextLabel="Agrarian Rhythms"
>
  <div class="space-y-8">
    <figure class="lead-figure">
      <img
        src="/images/craftsman-hands.png"
        alt="Weathered hands shaping wood at a workbench — the dignity of skilled, patient work."
        loading="eager"
      />
    </figure>
    <div class="space-y-4">
      <p>
        Household economy is not a productivity pipeline but a covenantal cycle. Land is received as
        gift, work cultivates it with patience, provision gathers into the garden and harvest, and the
        table turns material goods into gratitude, memory, correction, and blessing.
      </p>
      <p>
        From the table the household opens outward in hospitality and honest exchange. Trade is not the
        center of life but one movement within a larger rhythm that returns again to land, stewardship,
        and renewal.
      </p>
      <p>
        The point of the flow is formation. Each movement teaches dependence, skill, generosity,
        fairness, and shared responsibility, so the end of one cycle prepares the next rather than
        exhausting people and place.
      </p>
      <p>
        By contrast, the consumer inversion begins at the platform and ends in disposal. It severs goods
        from land, neighbors, and inheritance, training households to buy and discard rather than to
        cultivate and bless.
      </p>
    </div>

    <div class="figure-row">
      <figure>
        <img
          src="/images/potter.png"
          alt="Hands at a potter's wheel drawing up a clay vessel — making from the ground itself."
          loading="lazy"
        />
      </figure>
      <figure>
        <img
          src="/images/smith.png"
          alt="A blacksmith's hands at the anvil — patient force and repair."
          loading="lazy"
        />
      </figure>
    </div>

    <section class="flow-model rounded-sm border border-ochre/20 bg-white/55 p-4 sm:p-6">
      <div class="mb-4 flex items-start justify-between gap-4">
        <div>
          <h2 class="font-serif-display text-2xl font-semibold text-charcoal">
            {showConsumerEconomy ? 'The Consumer Inversion' : 'The Household Cycle'}
          </h2>
          <p class="mt-2 text-base text-slate-covenant">
            {#if showConsumerEconomy}
              A linear economy centered on platform-mediated purchase, immediate consumption, and disposal.
            {:else}
              A circular household grammar where land, labor, provision, table, hospitality, and trade renew one another.
            {/if}
          </p>
        </div>
      </div>

      <div class="overflow-x-auto">
        <svg
          viewBox="0 0 520 520"
          class="mx-auto h-auto min-w-[320px] max-w-[520px]"
          role="img"
          aria-labelledby="flow-model-title flow-model-desc"
        >
          <title id="flow-model-title">{showConsumerEconomy ? 'Consumer economy flow' : 'Household economy flow'}</title>
          <desc id="flow-model-desc">
            {showConsumerEconomy
              ? 'A linear chain from Platform to Purchase to Consume to Dispose.'
              : 'A circular flow from Land to Work to Garden and Harvest to Table to Hospitality to Trade and back to Land.'}
          </desc>

          {#if showConsumerEconomy}
            <defs>
              <marker id="consumer-arrow" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto">
                <path d="M0,0 L0,6 L9,3 z" fill="#8B6914"></path>
              </marker>
            </defs>

            {#each consumerArrows as arrow}
              <path
                d={arrow}
                fill="none"
                stroke="#8B6914"
                stroke-width="4"
                stroke-linecap="round"
                marker-end="url(#consumer-arrow)"
              />
            {/each}

            {#each consumerNodes as node}
              <g transform={`translate(${node.x}, ${node.y})`}>
                <circle r="46" fill="#5A6B7A" />
                <text
                  text-anchor="middle"
                  dominant-baseline="middle"
                  fill="#FFFFFF"
                  font-size="14"
                  font-weight="600"
                >
                  {node.label}
                </text>
              </g>
            {/each}
          {:else}
            <defs>
              <marker id="household-arrow" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto">
                <path d="M0,0 L0,6 L9,3 z" fill="#8B6914"></path>
              </marker>
            </defs>

            <circle
              cx="260"
              cy="255"
              r="180"
              fill="none"
              stroke="rgba(139, 105, 20, 0.18)"
              stroke-width="12"
            />
            <circle
              cx="260"
              cy="255"
              r="180"
              fill="none"
              stroke="#8B6914"
              stroke-width="8"
              stroke-linecap="round"
              stroke-dasharray="180 24"
              class="flow-ring"
            />
            {#each householdArrows as arrow}
              <path
                d={arrow}
                fill="none"
                stroke="#8B6914"
                stroke-width="4"
                stroke-linecap="round"
                marker-end="url(#household-arrow)"
              />
            {/each}

            {#each householdNodes as node}
              <g transform={`translate(${node.x}, ${node.y})`}>
                <circle r="48" fill="#6B7C5C" />
                {#if node.label.includes('/')}
                  <text text-anchor="middle" fill="#FFFFFF" font-size="13" font-weight="600">
                    <tspan x="0" y="-4">Garden</tspan>
                    <tspan x="0" y="14">/Harvest</tspan>
                  </text>
                {:else}
                  <text
                    text-anchor="middle"
                    dominant-baseline="middle"
                    fill="#FFFFFF"
                    font-size="14"
                    font-weight="600"
                  >
                    {node.label}
                  </text>
                {/if}
              </g>
            {/each}
          {/if}
        </svg>
      </div>

      <div class="mt-6 flex flex-col items-start gap-3">
        <button
          type="button"
          class="rounded-sm border border-sage bg-sage/10 px-4 py-2 text-sm font-semibold text-charcoal transition-colors duration-300 hover:bg-sage/20"
          on:click={() => (showConsumerEconomy = !showConsumerEconomy)}
        >
          {showConsumerEconomy ? 'Show Household Flow' : 'Show Consumer Economy'}
        </button>
        <p class="text-sm text-slate-covenant">
          Toggle the diagram to compare covenantal circulation with its consumer inversion.
        </p>
      </div>
    </section>
  </div>
</ContentLayout>

<style>
  .flow-ring {
    animation: trace-cycle 8s linear infinite;
    transform-origin: center;
  }

  @keyframes trace-cycle {
    from {
      stroke-dashoffset: 0;
    }

    to {
      stroke-dashoffset: -1224;
    }
  }
</style>
