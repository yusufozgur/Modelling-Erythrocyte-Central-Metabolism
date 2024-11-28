#let parameters_table = [
  #set par(justify: false)
  #figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    [Reaction],
    [Parameter],
    [Value],
    [Reference],
    
    [Glucose Influx],
    [Km],
    [1mM],
    [@Gorovits2003],
    
    [Hexokinase],
    [$K_"mGLU"$],
    [0.046 mM],
    [@Stocchi1982-ya],
    
    [Hexokinase],
    [$K_"mATP"$],
    [0.6 mM],
    [@Stocchi1982-ya],
    
    [Glucose-6-Phosphate Isomerase],
    [$K_"mG6P"$],
    [0.445 mM],
    [sabio 21894],
    
    [Glucose-6-Phosphate Isomerase],
    [$K_"mF6P"$],
    [0.063 mM],
    [sabio 21899],
    
    [Phosphofructokinase],
    [$K_"mF6P"$],
    [0.045 mM],
    [46778],
    
    [Phosphofructokinase],
    [$K_"mATP"$],
    [0.12 mM],
    [46779],
    
    [Aldolase],
    [$K_"mF1,6BP"$],
    [0.007 mM],
    [@MULQUINEY1999],
    
    [Aldolase],
    [$K_"mDHAP"$],
    [2 mM],
    [@MULQUINEY1999],
    
    [Aldolase],
    [$K_"mGA3P"$],
    [1 mM],
    [@MULQUINEY1999],
    
    [Triosephosphate Isomerase],
    [$K_"mDHAP"$],
    [1.5 mM],
    [12716],
    
    [Triosephosphate Isomerase],
    [$K_"mGA3P"$],
    [0.55 mM],
    [12715],
    
    [Glyceraldehyde-3-Phosphate Dehydrogenase],
    [$K_"mGA3P"$],
    [0.1 mM],
    [@Ryzlak1988],
    
    [Glyceraldehyde-3-Phosphate Dehydrogenase],
    [$K_"m1,3BPG"$],
    [0.01 mM],
    [@Ryzlak1988],
    
    [Phosphoglycerate kinase],
    [$K_"m1,3BPG"$],
    [0.0025 mM],
    [24923],
    
    [Phosphoglycerate kinase],
    [$K_"mADP"$],
    [0.099 mM],
    [24920],
    
    [Phosphoglycerate kinase],
    [$K_"m3PG"$],
    [0.6 mM],
    [24927],
    
    [Phosphoglycerate kinase],
    [$K_"mATP"$],
    [0.32 mM],
    [24924],
    
    [Phosphoglucomutase],
    [$K_"m3PG"$],
    [0.1 mM],
    [@IKURA1978],
    
    [Enolase],
    [$K_"m2PG"$],
    [0.2 mM],
    [@Pietkiewicz2009],
    
    [Enolase],
    [$K_"mPEP"$],
    [0.58 mM],
    [@Pietkiewicz2009],
    
    [Pyruvate Kinase],
    [$K_"mPEP"$],
    [0.15 mM],
    [2365],
    
    [Pyruvate Kinase],
    [$K_"mADP"$],
    [0.091 mM],
    [2370],
  ),
  caption: figure.caption(position: top)[
    Reaction parameters found in the literature.
  ]
)<parameters>
]