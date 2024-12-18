#import "glycolysis_diagram.typ": diagram_glycolysis, diagram_glycolysis_with_titles
#import "formulas_table.typ": formulas_table
#import "reactions_table.typ": reactions_table
#import "parameters_table.typ": parameters_table
#import "steady_state_species_table.typ": steady_state_species_table
#import "steady_state_reaction_fluxes.typ": steady_state_reaction_fluxes

// Default font "Libertinus Serif" looks professional enough

#set page(
  margin: 2.5cm,
  paper: "a4",
  columns: 1,
)

#set heading(numbering: "1.")
#show heading.where(level: 1): set text(size: 1.1em)

#show figure: set par(justify: false)
#show figure: block.with(above: 1.5em, below: 1.5em)
#show figure.caption: it => [
  *#it.supplement #context it.counter.display(it.numbering):* #it.body
]

#place(
  top + center,
  scope: "parent",
  float: true,
)[
  // Title
  #set text(size: 22pt)
  #set align(center)
  Modelling Erythroctye Central Metabolism Informs Parasitic Drug Development

  // Author
  #set text(size: 15pt)
  #set align(center)
  Yusuf Turhan
]

#set par(justify: true)

#outline()


= Abstract
A model for erythrocyte central metabolism is created, which consisted of glucose transporter and reactions of glycolysis. It was shown to be robust to changes in a limited parameter value range, with some values more identifiable than others. The flux controlling reactions were determined, where hexokinase had a positive control and ATP hydrolysis had a negative control. The lack of flux control by glucose transport gives insight on anti-parasitic drug development, and the negative flux control of ATP hydrolysis possibly sheds light on autocatalytic nature of glycolysis. Lastly, it has been noted that model fitting with expanded parameter lower and upper bounds lead to suffering robustness and parameter identifiability, which may be fixed with longer parameter estimation runs.

= Introduction


Erythrocytes are the constituent cells of human blood. They are essential to life as they deliver oxygen from lungs to faraway tissues and collect carbon dioxide @Corrons2021. Erythrocytes are also infection targets of parasites such as _Plasmodium falciparum_ @Paul2015; hence, it is important to identify differences between erythrocyte metabolism and parasite metabolism for developing anti-parasitic drugs with little adverse effects to the host red blood cells. In this context, our aim with this project is to identify most critical reactions in erythrocyte metabolism, which can be adversely affected by anti-parasitic drugs.

The central metabolism of erythrcoytes mainly consists of the steps of glycolysis @vanWijk2005. Glucose is taken up by GLUT1 transporters, energy-investment reactions process glucose into high energy metabolic intermediates and energy-extraction reactions produce ATP molecules. In most other cells, reduced NADH produced by these reactions are used for ATP production, however, as mature erythrocytes lack mitochondria @vanWijk2005, NADH is oxidized back to NAD+ by reducing pyruvate to lactate, which is then exported out of the cell.

Another important distinction of erythrocyte glycolysis is Rapoport-Luebering Shunt @vanWijk2005. These reactions bypass one of the energy producing steps in glycolysis to produce an intermediate called 2,3-bisphosphoglycerate (2,3-BPG), which plays an important role in regulating oxygen affinity of hemoglobulin.


= Materials and Methods

COPASI version 4.44 Build 295 @Hoops2006 was used to build and run our models. Reaction velocity formulas used are listed in @formulas. Steady state metabolite concentrations and reaction fluxes for parameter estimation were obtained from #cite(form: "prose", <Joshi1990>). R version 4.3.3 was used for the visualizations not done with COPASI.

As for the experimental data, steady state concentrations of G6P(0.038mM), F6P(0.016mM), F1,6BP(0.0076mM), DHAP(0.14mM), GA3P(0.0067mM), 1,3PG(0.004mM), 3PG(0.045mM), 2PG(0.014mM), PEP(0.017mM), Pyruvate(0.077mM), ADP(0.27mM), ATP(1.5mM) and steady state flux for hexokinase (0.000311mM/s) were obtained from #cite(<Joshi1990>, form: "prose"). Additionally, Glucose concentration(5mM) were added to the experimental variables as it was the expected steady state intracellular concentration in an erythrocyte @LoyolaLeyva2022.


#page[
  // #set align(center)
  #figure(
    [
      #set text(font: "Cascadia Code", size: 9pt, weight: 400)
      #diagram_glycolysis_with_titles
    ],
    caption: [ Erythrocyte central metabolism. ],
    scope: "parent",
    placement: auto,
  )
]

= Results

An array of different models with differing complexity were created in our erythrocyte modelling group. I will be reporting the creation and findings of the most basic model in here.

== Model building

This model includes the GLUT1 facilitative diffusion transporter, reactions of glycolysis, and energy expenditure function and a pyruvate outflux function. It does not take rapaport luebering shunt or lactate dehydrogenase into account. The reactions of our model are detailed in @reactions. The reaction parameters found on the literature are reported in @parameters. Other reaction parameters were estimated in @parameter_estimation. The species starting concentrations were specified as 1.6 mM for ATP @Pospieszna2021, 0.2 mM for ADP @Pospieszna2021, and 5mM for Glucose @LoyolaLeyva2022. All other species' starting concentrations were set to 0mM.


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

A steady state achievement can be deduced by inspecting the time course analysis, but it is better to run a steady state analysis and report the results. Steady state reaction fluxes can be found at @steady_state_reaction_fluxes and steady state species concentrations can be found at @steady_state_species_table.


== Metabolic Control Analysis

To identify reaction controlling steps that can be affected by anti-parasitic drugs, we can perform a Metabolic Control Analysis(MCA) and inspect the flux control coefficients of the reactions in our model. As shown in @MCA, reaction fluxes are controlled positively by Hexokinase(Glu -> G6P), and controlled negatively by Energy expenditure(ATP -> ADP).

#figure(
  image("img/mca_plot.png"),
  caption: [Metabolic Control Analysis results showing that the reaction fluxes are controlled positively by Hexokinase and negatively by Energy Expenditure.],
) <MCA>

#pagebreak()

== Model Robustness <model_robustness_section>

In order to test the robustness of our model, which would mean the ability of our model to behave similarly under different parameter estimation runs, we have run the parameter estimation for 10 times. The resulting fits were plotted in the @10_parest.

#figure(
  image("img/rb_fit_plot.png", width: 30em),
  caption: [Parameter estimation step is repeated to test robustness and parameter identifiability. Black circles represent the target experimental values, and the colored dots represent different parameter sets fitted. ATP and ADP steady state concentratios were the main hurdles for fitting.],
) <10_parest>

Then, MCA analyses for the parameter sets obtained from these parameter estimation runs were plotted in @9_mca. We see that all the parameter sets plotted show the same flux control coefficients as our initial MCA. This shows that our model is robust to different parameter estimation runs at parameter ranges $10^"-2" "-" 10^"+2"$.

#figure(
  image("img/mult_mca_plot.png", width: 50%),
  caption: [Multiple MCA comparison plot shows that in all parameter sets, reaction fluxes controlled positively by Hexokinase and negatively by Energy Expenditure.],
) <9_mca>

== Parameter Identifiability Analysis

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
  caption: [Distribution of parameters in range-expanded parameter estimation runs.],
) <range_expanded_par_ident_plot>

= Discussion

Although this model was designed to be as simple as possible, we believe it holds some valuable insight into the erythrocyte glycolysis. It was able to model Hexokinase as a positive controller of reaction fluxes, but not glucose transporter. This results agree with the other, more sophisticated models in our group. This fact is important for drug development against parasites as it has been seen that in parasites such as _Plasmodium falciparum_, glucose transporter is seen as the most important reaction that needs to be targeted for inhibition @Van_Niekerk2016-ni

Another flux controlling reaction captured by our model is the Energy Expenditure. It negatively controls the reactions fluxes, and it is most likely caused by the autocatalytic nature of ATP in glycolysis. In other words, if ATP is converted to ADP in a high rate, there will be less ATP to be used by upstream reactions, slowing reaction fluxes.

The autocatalytic activity may also play a role in the phenomenone seen in @range_expansion_fits_plot, where failed parameter estimation runs were not able to fit ATP and ADP steady state concentrations.

We have also shown that, in the narrow window of parameter ranges defined in our initial parameter estimations, our model is robust to changes in different parameter runs, being able to fit the experimental values all the time and giving the same flux control coefficients in MCA. The estimated parameters in these runs also showed similar values (@par_variability). However, Hexokinase and Energy Expenditure related reaction parameters were clustered with a low variation near the lower bounds defined. For this reason, a parameter range expansion was performed and new parameter estimations were run. Some of these runs were not able to fit ADP and ATP, and most of them showed near-zero reaction flux control coefficients in their MCA. The parameter variability was much different compared to previous runs as well (@range_expanded_par_ident_plot). This may be due to the expanded parameter space, where the optimizers did not run long enough to fit the parameters. To resolve this hypotheses, more parameter estimation runs with longer iteration should be made.

For future research, our model can be expanded with drug simulation experiments. The reaction rates of some reactions in our model such glucose transporter can be artifically inhibited, simulating some anti-parasitic drugs.

= Supplementary resources

The model, data files, and R code for plots can be found at #link("https://github.com/yusufozgur/Modelling-Erythrocyte-Central-Metabolism")

= References

#bibliography(
  "ref.bib",
  style: "american-psychological-association",
  title: none,
)

= Supplementary figures

#figure(
  formulas_table,
  caption: figure.caption(position: top)[
    Biochemical reaction velocity formulas used in our model.
  ],
  placement: top,
  scope: "parent",
  supplement: [Supplementary Table],
  kind: "supplementary",
) <formulas>


#figure(
  reactions_table,
  caption: figure.caption(position: top)[
    Reactions that are defined in our model.
  ],
  scope: "parent",
  placement: top,
  supplement: [Supplementary Table],
  kind: "supplementary",
) <reactions>

#figure(
  parameters_table,
  caption: figure.caption(position: top)[
    Reaction parameters found in the literature.
  ],
  placement: top,
  scope: "parent",
  supplement: [Supplementary Table],
  kind: "supplementary",
) <parameters>


#figure(
  steady_state_reaction_fluxes,
  caption: figure.caption(position: top)[
    Steady state reaction fluxes
  ],
  supplement: [Supplementary Table],
  kind: "supplementary",
) <steady_state_reaction_fluxes>

#figure(
  steady_state_species_table,
  caption: figure.caption(position: top)[
    Steady state concentrations
  ],
  supplement: [Supplementary Table],
  kind: "supplementary",
) <steady_state_species_table>