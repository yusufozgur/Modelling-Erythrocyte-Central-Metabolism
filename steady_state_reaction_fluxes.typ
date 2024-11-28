#let steady_state_reaction_fluxes = [
  #set par(justify: false)
  #figure(
    table(
      columns: (1fr, 1fr, 1fr),
      inset: (x: .1em, y: .8em),
      align: center + horizon,
      [*Reaction*],
      [*Flux (extensive) [mmol/s]*],
      [*Flux (intensive) [mmol/(l*s)]*],

      [Glu + ATP -> G6P + ADP], [0.000767727], [0.000767727],
      [G6P = F6P], [0.000767727], [0.000767727],
      [F6P + ATP -> F1,6BP + ADP], [0.000767727], [0.000767727],
      [F1,6BP = DHAP + GA3P], [0.000767727], [0.000767727],
      [DHAP = GA3P], [0.000767727], [0.000767727],
      [GA3P = 1,3BPG], [0.001535455], [0.001535455],
      [1,3BPG + ADP = 3PG + ATP], [0.001535455], [0.001535455],
      [3PG -> 2PG], [0.001535455], [0.001535455],
      [2PG = PEP], [0.001535455], [0.001535455],
      [PEP + ADP -> Pyr + ATP], [0.001535455], [0.001535455],
      [Pyr -> ], [0.001535455], [0.001535455],
      [ATP -> ADP], [0.001535455], [0.001535455],
      [Glu0 = Glu], [0.000767727], [0.000767727],
    ),
    caption: figure.caption(position: top)[
      Steady state reaction fluxes
    ],
  )<steady_state_reaction_fluxes>
]