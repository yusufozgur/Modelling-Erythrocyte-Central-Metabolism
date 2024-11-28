#let steady_state_species_table = [
  #set par(justify: false)
  #figure(
    table(
      columns: (.5fr, 1fr, 1fr, 1fr),
      inset: (x: 0em, y: .8em),
      align: center + horizon,
      [*Name*],
      [*Concentration [mmol/l]*],
      [*Rate [mmol/(l*s)]*],
      [*Transition Time [s]*],

      [ADP], [0.26454544], [-4.38E-16], [86.14564277],
      [ATP], [1.53545456], [4.38E-16], [500],
      [G6P], [5.85E-06], [3.19E-19], [0.007621794],
      [Glu], [4.984964034], [1.37E-14], [6493.144329],
      [F6P], [5.65E-07], [-2.13E-19], [0.000736095],
      [F1,6BP], [4.75E-07], [-4.25E-19], [0.000618081],
      [DHAP], [0.091506739], [4.55E-17], [119.1917247],
      [GA3P], [4.31E-06], [4.25E-19], [0.002805583],
      [1,3BPG], [3.20E-08], [5.31E-18], [2.08E-05],
      [3PG], [7.51E-07], [-4.89E-18], [0.000488982],
      [2PG], [3.00E-06], [2.13E-19], [0.001950586],
      [PEP], [4.38E-07], [1.06E-18], [0.000285009],
      [Pyr], [5.05E-05], [-1.28E-18], [0.032894088],
    ),
    caption: figure.caption(position: top)[
      Steady state concentrations
    ],
  )<steady_state_species_table>
]