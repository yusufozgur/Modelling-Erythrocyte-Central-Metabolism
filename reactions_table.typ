#let reactions_table = [
  #set par(justify: false)
  #show table: set block(width: 100%)
  #figure(
  table(
    columns: (1fr,1fr,1fr),
    inset: (x: 0em, y: .8em),
    align: center+horizon,
    
    [*Name*],
    [*Reaction*],
    [*Rate Law*],
    
    [Glucose influx],
    [Glu0 = Glu],
    [Michealis-Menten (reversible)],
    
    [Hexokinase],
    [Glu + ATP -> G6P + ADP],
    [Bi-Bi (irreversible)],
    
    [Glucose-6-Phosphate Isomerase],
    [G6P = F6P],
    [Michealis-Menten (reversible)],
    
    [Phosphofructokinase],
    [F6P + ATP -> F1,6BP + ADP],
    [Bi-Bi (irreversible)],
    
    [Aldolase],
    [F1,6BP = DHAP + GA3P],
    [Uni-Bi (reversible)],
    
    [Triosephosphate Isomerase],
    [DHAP = GA3P],
    [Michealis-Menten (reversible)],
    
    [Glyceraldehyde-3-Phosphate Dehydrogenase],
    [GA3P = 1,3BPG],
    [Michealis-Menten (reversible)],
    
    [Phosphoglycerate kinase],
    [1,3BPG + ADP = 3PG + ATP],
    [Bi-Bi (reversible)],
    
    [Phosphoglucomutase],
    [3PG = 2PG],
    [Michealis-Menten (reversible)],
    
    [Enolase],
    [2PG = PEP],
    [Michealis-Menten (reversible)],
    
    [Pyruvate Kinase],
    [PEP + ADP -> Pyr + ATP],
    [Bi-Bi (irreversible)],
    
    [Pyruvate expenditure],
    [Pyr -> ],
    [Mass action (irreversible)],
    
    [Energy Expenditure],
    [ATP -> ADP],
    [Mass action (irreversible)],
    
  ),
  caption: figure.caption(position: top)[
    Reactions that are defined in our model.
  ]
)<reactions>
]
