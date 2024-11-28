#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge

#let diagram_glycolysis = diagram.with(
  node-stroke: 1pt,
  edge-stroke: 1pt,
)({
  let edge = edge.with(label-side: left)

  // Title
  edge(
    (0, 0),
    label: [
      #text(size: 1.7em)[*Erythrocyte Central metabolism*]
    ],
    stroke: 0pt,
  )
  edge((rel: (-1, 1.1)), (rel: (2, 0)), "..")

  node(
    (0, .5),
    [Glucose#sub[#text(size: 1.1em,"external")]],
    corner-radius: 2pt,
  )
  edge(
    "<|-|>",
    label: "GLUT 1",
  )
  node(
    (rel: (0, 1.2 * 1.4)),
    [Glucose#sub[#text(size: 1.1em,"internal")]],
    corner-radius: 2pt,
  )
  edge(
    "-|>",
    label: "Hexokinase 1 (ATP -> ADP)",
  )
  node(
    (rel: (0, 1.2)),
    "Glucose-6-phosphate",
    corner-radius: 2pt,
  )
  edge("<|-|>", label: "Glucophosphate Isomerase")
  node(
    (rel: (0, 1.2)),
    "Fructose-6-phosphate",
    corner-radius: 2pt,
  )
  edge(
    "-|>",
    label: "Phosphofructokinase (ATP -> ADP)",
  )

  {
    node(
      (rel: (0, 1.2)),
      "Fructose-1,6-phosphate",
      corner-radius: 2pt,
    )
    edge((rel: (.4, .2)), (rel: (0, 1)), "<|-|>")
    edge((rel: (-.3, 0)), (rel: (0, 1)), "<|-|>")
    node(
      (rel: (.4, 1.2)),
      "GA3P",
      corner-radius: 2pt,
    )
    edge("<|-|>")
    node(
      (rel: (-.7, 0)),
      "DHAP",
      corner-radius: 2pt,
    )
    node(
      (rel: (.3, -.7)),
      "Aldolase",
      stroke: 0pt,
    )
    node(
      (rel: (0, 1.2)),
      [Triose phosphate#linebreak()isomerase],
      stroke: 0pt,
    )
  }

  edge(
    (rel: (.45, -.5)),
    (rel: (0, 1.5)),
    "<|-|>",
    label: [#set align(center); GA3PDH#linebreak() (NAD+ -> NADH)],
  )

  {
    node(
      (rel: (.45, 1)),
      "1,3BP",
    )
    edge(
      (rel: (0, 0)),
      (rel: (-1, 0)),
      (rel: (-0, 1)),
      "<|-|>",
      label: "bisphosphoglycerate mutase",
      label-side: auto,
    )
    node((rel: (-1, 1)), "2,3BPG")
    edge(
      (rel: (-1, -0)),
      (rel: (-0, 1)),
      label: [
        #set text(1.5em)
        *Rapoport-Luebering Shunt*
      ],
      label-angle: 90deg,
      label-side: auto,
      stroke: 0pt,
    )
    edge(
      (rel: (0, 0)),
      (rel: (0, 1.5)),
      (rel: (1, 0)),
      "<|-|>",
      label: "bisphosphoglycerate phosphatase",
      label-side: right,
      label-pos: .55,
    )
    edge(
      (rel: (1, -1)),
      (rel: (0, 2.5)),
      "<|-|>",
      label: [
        #set align(center);Phosphoglycerate#linebreak()Kinase#linebreak() (ATP \<- ADP)
      ],
      label-sep: 6pt,
    )
    node(
      (rel: (1, 1.5)),
      "3PG",
    )
  }

  edge(
    "<|-|>",
    label: [#set align(center);Monophosphoglycerate#linebreak()Mutase],
  )
  node(
    (rel: (0, 1.5)),
    "2PG",
  )
  edge("<|-|>", label: [#set align(center);Enolase])
  node(
    (rel: (0, 1.5)),
    "PEP",
  )
  edge(
    "-|>",
    label: [#set align(center);Pyruvate Kinase#linebreak() (ADP -> ATP)],
  )
  node(
    (rel: (0, 1.5)),
    "Pyruvate",
  )
  edge(
    "<|-|>",
    label: [#set align(center);Lactate Dehydrogenase#linebreak() (NADH -> NAD+)],
  )
  node(
    (rel: (0, 1.5)),
    "Lactate",
  )
  edge("<|-|>")
  node(
    (rel: (-1, 0)),
    "Lactate outflux",
  )

  {
    node(
      (-1, 14),
      "ATP",
    )
    edge(
      "-|>",
      label: [ATP consumption],
    )
    node(
      (-1, 15.5),
      "ADP",
    )
  }
})

#set page(width: auto, height: auto)
#set text(font: "Cascadia Mono", weight: 400)
#diagram_glycolysis
