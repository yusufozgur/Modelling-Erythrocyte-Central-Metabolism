#let formulas_table = table.with(
  columns: (1fr, 3.5fr),
  inset: (x: 0em, y: .8em),
  align: center + horizon,
)(
  table.header(
    [*Name*],
    [*Formula*],
  ),

  [Mass action (irreversible)],
  $ "k1" [S] $,

  [Michealis-Menten (irreversible)],
  $ V_max [S] / ( K_m + [S] ) $,

  [Michealis-Menten (reversible)],
  $
    (V_f [S] / K_"ms"-V_r [P] / K_"mp") / (1+[S] / K_"ms"+[P] / K_"mp")
  $,

  [Uni-Bi (reversible)],
  $
    ( V_f ([A] / K_"ma") - V_r ([P] / K_"mp") (Q / K_"mq") ) / ( 1 + ([A] / K_"ma") + ([P] / K_"mp") + ([Q] / K_"mq") + (([P] [Q]) / (K_"mp" K_"mq") ) )
  $,

  [Bi-Bi (irreversible)],
  $
    (V_max [A] / K_"ma" [B] / K_"mb" ) / ( 1 + [A] / K_"ma" + [B] / K_"mb" + ([A] [B]) / (K_"ma" K_"mb") )
  $,

  [Bi-Bi (reversible)],
  $
    ( v_f * (A / K_"ma") * (B / K_"mb") - v_r * (P / K_"mp") * (Q / K_"mq") ) / ( 1 + (A / K_"ma") + (B / K_"mb") + (A * B / (K_"ma" * K_"mb") ) + (P / K_"mp") + (Q / K_"mq") + (P * Q / (K_"mp" * K_"mq") ) )
  $,
)
