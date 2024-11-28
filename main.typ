#import "glycolysis_diagram.typ": diagram_glycolysis
#import "formulas_table.typ": formulas_table
#import "reactions_table.typ": reactions_table
#import "parameters_table.typ": parameters_table
#import "steady_state_species_table.typ": steady_state_species_table
#import "steady_state_reaction_fluxes.typ": steady_state_reaction_fluxes

// Default font "Libertinus Serif" looks professional enoguh

#set page(
  margin: 2.5cm,
  paper: "a4",
  columns: 1,
)

#set heading(numbering: "1.")
#show heading.where(level: 1): set text(size: 1.1em)

#show figure.caption: it => [
  *#it.supplement #context it.counter.display(it.numbering):* #it.body
]

#show figure: block.with(above: 1.5em, below: 1.5em)

#place(
  top + center,
  scope: "parent",
  float: true,
)[// Title
  #set text(size: 22pt)
  #set align(center)
  Modelling Erythroctye Central Metabolism Informs Parasitic Drug Development
]

#place(
  top + center,
  scope: "parent",
  float: true,
)[// Author
  #set text(size: 15pt)
  #set align(center)
  Yusuf Turhan
]


#set par(justify: true)

= Abstract

= Introduction

+ [x] Define Erythrocytes
+ [x] Relate erythrocytes with parasites
+ [ ] Make the long parasite sentence better
+ [x] Introduce projects aim
+ [x] Introduce Glycolysis for erythroctes
  - [x] mention no mito
  - [x] mention rapaport luebering shunt
+ [x] Glycolysis Diagram
+ [ ] Grammarly
+ [ ] Tables at sup

Erythrocytes are the constituent cells of human blood. They are essential to life as they deliver oxygen from lungs to faraway tissues and collect carbon dioxide @Corrons2021. Erythrocytes are also be infection targets by parasites such as _Plasmodium falciparum_ @Paul2015; hence, it is important to identify differences between erythrocyte metabolism and parasite metabolism for developing anti-parasitic drugs with little adverse effects to the host red blood cells. In this context, our aim with this project is to identify most critical reactions in erythrocyte metabolism, which can be adversely affected by anti-parasitic drugs.

The central metabolism of erythrcoytes mainly consists of the steps of glycolysis @vanWijk2005. Glucose is taken up by GLUT1 transporters, energy-investment reactions process glucose into high energy metabolic intermediates and energy-extraction reactions produce energetic ATPs. In most other cells, reduced NADH is also produced by these reactions, however, as mature erythrocytes lack mitochondria @vanWijk2005, NADH is oxidized back to NAD+ by reducing pyruvate to lactate, which is then exported out of the cell.

Another important distinction of erythrocyte glycolysis is Rapoport-Luebering Shunt @vanWijk2005. These reactions bypass one of the energy producing steps in glycolysis to produce an intermediate called 2,3-bisphosphoglycerate (2,3-BPG), which plays an important role in regulating oxygen affinity of hemoglobulin.


= Materials and Methods

+ [x] Reaction velocity formulas
+ [ ] Experimental data
  - [x] Steady state data
  - [x] Flux data
+ [x] copasi
+ [x] r for plotting, with version
+ [x] Add experimental data

COPASI version 4.44 Build 295 @Hoops2006 was used to build and run our models. Reaction velocity formulas used are listed in @formulas. Steady state metabolite concentrations and reaction fluxes for parameter estimation were obtained from #cite(form: "prose", <Joshi1990>). R version 4.3.3 was used for the visualizations not done with COPASI.

#page[
  // #set align(center)
  #figure(
    [
      #set text(font: "Cascadia Code", size: 8pt, weight: 400)
      #diagram_glycolysis
    ],
    caption: [ Erythrocyte central metabolism. ],
    scope: "parent",
    placement: auto,
  )
]

As for the experimental data, steady state concentrations of G6P(0.038mM), F6P(0.016mM), F1,6BP(0.0076mM), DHAP(0.14mM), GA3P(0.0067mM), 1,3PG(0.004mM), 3PG(0.045mM), 2PG(0.014mM), PEP(0.017mM), Pyruvate(0.077mM), ADP(0.27mM), ATP(1.5mM) and steady state flux for hexokinase (0.000311mM/s) were obtained from #cite(<Joshi1990>, form: "prose"). Additionally, Glucose concentration(5mM) were added to the experimental variables as it was the expected steady state intracellular concentration in an erythrocyte @LoyolaLeyva2022.

#figure(
  formulas_table,
  caption: [
    Biochemical reaction velocity formulas used in our model.
  ],
  placement: top,
  scope: "parent",
) <formulas>

= Results
+ [x] Mention this model is the simple model in a diverse array of models created
+ [x] reactions table
+ [x] parameters table, with citations
+ [x] say steady state is achieved with parameter estimation
+ [x at mat methods] mention experimental value glc 5 mM is added artificially

An array of different models with differing complexity were created in our erythrocyte modelling group. I will be reporting the creation and findings of the most basic model in here. The reactions of our model are reported in @reactions.

== Model building

This model includes the GLUT1 facilitative diffusion transporter, reactions of glycolysis, and energy expenditure function and a pyruvate outflux function. It does not take rapaport luebering shunt or lactate dehydrogenase into account. The reactions of our model are detailed in @reactions. The reaction parameters found on the literature are reported in @parameters. Other reaction parameters were estimated in @parameter_estimation. The species starting concentrations were specified as ATP 1.6 mM @Pospieszna2021, ADP 0.2 mM @Pospieszna2021, and Glu 5mM @LoyolaLeyva2022. All other species' starting concentrations were set to 0mM.

#place(
  top + center,
  scope: "parent",
  float: true,
)[
  #reactions_table
]

#page()[
  #place(
    top + center,
    scope: "parent",
    float: true,
  )[
    #parameters_table
  ]
]



== Parameter estimation <parameter_estimation>

To save time while prototyping different model builds, steady state was achieved during parameter estimation step. All the parameters that are not defined in @parameters were added to the parameter estimation. Experimental data is also set at this step. For the parameters to be estimated, lower bounds were set to $10^"-2"$ and upper bounds were set to $10^2$. Then, parameter estimation was run with the particle swarm algorithm with iteration limit at $150$, swarm size $100$ and standard deviation $10^"-6"$. The parameter estimation results can be seen in @main_fit. ADP and ATP steady state concentrations were the hardest parameters for the optimization algorithm to fit.

#figure(
  image("img/main_fit.png"),
  caption: [Parameter estimation results],
)<main_fit>

#pagebreak()

== Time course analysis

After the steady state achievement in the parameter estimation step, a time course analysis can be done to show the kinetics of our model adjusted to achieve steady state that fits our data. For visualization purposes, internal glucose concentration was set to 0 mM and a time course analysis was run, which can be seen in @time_course.

#figure(
  image("img/time_course.png"),
  caption: [Time course analysis of our model when the internal glucose concentration is set to 0 mM],
) <time_course>

== Steady state analysis



#[
  A steady state achievement can be deduced by inspecting the time course analysis, but it is better to run a steady state analysis and report the results. Steady state reaction fluxes can be found at @steady_state_reaction_fluxes and steady state species concentrations can be found at @steady_state_species_table.

  #set text(size: .8em)

  #steady_state_reaction_fluxes
]
#[
  #set text(size: .8em)
  #steady_state_species_table
]

#pagebreak()

== Metabolic Control Analysis

To identify reaction controlling steps that can be affected by anti-parasitic drugs, we can perform a Metabolic Control Analysis(MCA) and inspect the flux control coefficients of the reactions in our model. As shown in @MCA, reaction fluxes are controlled positively by Hexokinase(Glu -> G6P), and controlled negatively by Energy expenditure(ATP -> ADP).

#figure(
  image("img/mca_plot.png"),
  caption: [Metabolic Control Analysis results showing that the reaction fluxes are controlled positively by Hexokinase and negatively by Energy Expenditure.],
) <MCA>

#pagebreak()

== Model Robustness <model_robustness_section>

In order to test the robustness of our model, which would mean the ability of our model to behave similarly under different parameter estimation runs, and the identifiability of our model parameters, we have run the parameter estimation for 10 times. The resulting fits were plotted in the @10_parest. It can be seen that ATP and ADP steady state concentrations were where most of the fitting errors come from.

#figure(
  image("img/rb_fit_plot.png", width: 30em),
  caption: [Parameter estimation step is repeated to test robustness and parameter identifiability. Black circles represent the target experimental values, and the colored dots represent different parameter sets fitted. ATP and ADP steady state concentratios were the main hurdles for fitting.],
) <10_parest>


After the observation that two supersets of parameter sets can be obtained by parameter estimation, one with High ATP and Low ADP, and one with Low ATP and High ADP, we can perform MCA for testing whether our model is robust to these different fittings. In other words, we will see whether our controlling reactions change depending on different parameter estimation runs. @9_mca shows that controlling reactions across the runs are the same across the runs, and our model is robust to different parameter supersets.

#figure(
  image("img/mult_mca_plot.png"),
  caption: [Multiple MCA comparison plot shows that in all parameter sets shown, reaction fluxes controlled positively by Hexokinase and negatively by Energy Expenditure.],
) <9_mca>

== Parameter Identifiability Analysis
+ [ ] change plot labels for parameters

The parameter sets obtained during @model_robustness_section were used to test the identifiability of our model parameters that were not defined with values from the literature search. When we plot the variability of these parameters in @par_variability, some parameters show little variablity, meaning they are more identifiable, and some parameters show high variability, meaning they are less identifiable. Interestingly, some parameters, particularly $V_max$ of Hexokinase and $k_1$ of Energy expenditure, which were also the controlling steps, had their values in a very small range near the lower bounds of the parameter estimation range at $10^"-2"$. This has prompted us to perform a range expansion and repeat the parameter estimations, and test the robustness and parameter identifiability again.

#figure(
  image("img/iden_fit_plot.png"),
  caption: [To determine parameter identifiability, parameter values from the parameter estimation runs were plotted. We can see they show differing variation, and the more variable parameters are less identifiable. As some parameters showed very little variation at the lower bound of the parameter estimation range, we have decided to perform range expansion.],
) <par_variability>

== Range Expansion

Lower and upper bounds for estimation of our non-defined parameters are expanded to -90% and +900% of their latest fit values. Then, 10 independent parameter estimation steps are done. @range_expansion_fits_plot shows that, for three runs, parameter estimation were not able to fit the ADP and ATP steady state concentrations. This may mean optimization algorithms cannot find global minima in a reasonable time in the range-expanded solution space.

#figure(
  image("img/range_expansion_fits_plot.png"),
  caption: [Parameter fits for different parameter sets in range-expansion runs. ATP and ADP were harders to fit, and three runs were not able to fit those steady states, showing inverted fits with respect to these experimental measurements. ],
) <range_expansion_fits_plot>

We then wanted to see whether our model is still robust to different estimated parameter sets in the expanded ranges. Multiple MCA comparison for the range-expansion parameter sets shown in @range_expansion_multi_plot surprises us with only one MCA showing meaningful fluxes. Which means that our model is not robust at the range-expanded parameter space.

#figure(
  image("img/range_expansion_multi_plot.png"),
  caption: [MCA comparison for the 9 parameter sets estimated with range expansion. Except for the first parameter set, all other show near-zero fluxe control coefficients.],
) <range_expansion_multi_plot>

Plotting the estimated parameter variability plot again for range expansion in @range_expanded_par_ident_plot shows a much different picture compared to range-limited runs. Parameter variations and means are much more inconsistent with each other and the previous range-limited figures, possibly due to incomplete fitting due to increased parameter space in range-expansion.

#figure(
  image("img/range_expanded_par_ident_plot.png"),
  caption: [],
) <range_expanded_par_ident_plot>

= Discussion
+ [ ] Talk about MCA Hexokinase
+ [ ] Talk about MCA EngExp, probably due to decrease of autocatalytic property of glycolysis ATP
+ [ ] ADP ATP hardest to fit probably due to this autocatalytic activity
+ [ ] robustness of our model suffers from this ADP ATP non fitting
+ [ ] range expansion no MCA due to increase in search space, longer training time may fix this
+ [ ] Mention these results can be followed with drug treatment simulations

= Supplemental resources
+ Put these in a github
  + Model
  + Plotting code
  + data files

#bibliography(
  "ref.bib",
  style: "american-psychological-association",
  title: "References",
)
