#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#let diagram_glycolysis = diagram.with(
  node-stroke: 1pt,
  edge-stroke: 1pt,
  label-wrapper: edge => box(
    [#set align(center);#edge.label],
    inset: .2em,
    radius: .2em,
    fill: edge.label-fill,
  ),
  node-corner-radius: 2pt,
)({
  let edge = edge.with(label-side: left)

  node((0, 0))[Glucose#sub[external]]
  edge((rel: (-1, 0.4)), (rel: (2, 0)), "..")
  edge(
    "<|-|>",
    label: [GLUT 1],
  )
  node((rel: (0, 1)))[Glucose#sub[internal]]
  edge(
    "-|>",
    label: [Hexokinase 1 (ATP -> ADP)],
  )
  node((rel: (0, 1)))[Glucose-6-phosphate]
  edge("<|-|>", label: [Glucophosphate Isomerase])
  node((rel: (0, 1)))[Fructose-6-phosphate]
  edge(
    "-|>",
    label: "Phosphofructokinase (ATP -> ADP)",
  )

  {
    node(
      (0, 4),
      [Fructose-1,6-phosphate],
      name: <fructose-1-6-phospate>,
      enclose: (
        (-0.5, 4),
        (0.5, 4),
      ),
    )
    edge(<dhap>, "u", "<|-|>")
    edge(<ga3p>, "u", "<|-|>")
    node(
      (to: <fructose-1-6-phospate>, rel: (-0.4, 1)),
      name: <dhap>,
    )[DHAP]
    edge("<|-|>")
    node(
      (to: <fructose-1-6-phospate>, rel: (0.4, 1)),
      name: <ga3p>,
    )[GA3P]
    node(
      stroke: none,
      enclose: (<fructose-1-6-phospate>, <dhap>, <ga3p>),
      snap: -1,
    )[Aldolase]
    node(
      (to: <fructose-1-6-phospate>, rel: (0, 1.6)),
      stroke: none,
    )[Triose phosphate\ isomerase]
  }

  edge(
    <ga3p>,
    (rel: (0, 1.5)),
    "<|-|>",
    label: [GA3PDH\ (NAD+ -> NADH)],
  )

  {
    node((to: <ga3p>, rel: (0, 1.5)), name: <1-3bp>)[1,3BP]
    edge(
      <1-3bp>,
      (<1-3bp>, "-|", <2-3bpg>),
      <2-3bpg>,
      "<|-|>",
      label: [bisphosphoglycerate mutase],
      label-side: auto,
    )
    node((rel: (-1, 1)), name: <2-3bpg>)[2,3BPG]
    edge(
      <2-3bpg>,
      (<2-3bpg>, "|-", <3pg>),
      <3pg>,
      "<|-|>",
      label: [bisphosphoglycerate phosphatase],
      label-side: right,
      label-pos: .55,
    )
    edge(
      <1-3bp>,
      <3pg>,
      "<|-|>",
      label: [
        Phosphoglycerate\
        Kinase\
        (ATP \<- ADP)
      ],
      label-sep: 6pt,
    )
    node((rel: (1, 1)), name: <3pg>)[3PG]
  }

  edge(
    "<|-|>",
    label: [Monophosphoglycerate\ Mutase],
  )
  node((rel: (0, 1.5)))[2PG]
  edge("<|-|>", label: [Enolase])
  node((rel: (0, 1.5)), name: <pep>)[PEP]
  edge(
    "-|>",
    label: [
      Pyruvate Kinase\
      (ADP -> ATP)
    ],
  )
  node((rel: (0, 1.5)))[Pyruvate]
  edge(
    "<|-|>",
    label: [
      Lactate Dehydrogenase\
      (NADH -> NAD+)
    ],
  )
  node((rel: (0, 1.5)))[Lactate]
  edge("<|-|>")
  node((rel: (-1, 0)))[Lactate outflux]

  {
    node(
      (to: <pep>, rel: (-1, 0)),
      "ATP",
    )
    edge(
      "-|>",
      label: [ATP consumption],
    )
    node(
      (rel: (0, 1.5)),
      "ADP",
    )
  }
})

#let diagram_glycolysis_with_titles = grid(
  columns: 2,
  align: center + horizon,
  gutter: 3em,
  none,
  [
    #set text(size: 1.7em)
    *Erythrocyte Central Metabolism*
  ],

  rotate(-90deg, reflow: true)[
    #set text(1.5em)
    *Rapoport-Luebering Shunt*
  ],
  diagram_glycolysis,
)

#set page(width: auto, height: auto)
#set text(font: "Cascadia Mono", weight: 400)
#diagram_glycolysis_with_titles
