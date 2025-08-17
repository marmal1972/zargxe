bookdown::render_book("index.Rmd", output_dir = "GxEdoc")



help("render_book")
bookdown::serve_book()





$$\underline{y}_{ijk} = \mu + G_i + E_j + (\underline{GE}_{ij} + \underline{e}_{ijk}) \qquad \text{Full factorial ANOVA} \\

\underline{y}_{ijk} = \mu + G_i + E_j + \beta_iE_j + \underline{\epsilon}_{ijk} \qquad \text{Finlay Wilkinson} \\

\underline{y}_{ijk} = \mu + G_i + E_j + \sum_{k \in K}\lambda_ku_{ik}\nu_{jk} + \underline{\epsilon}_{ijk} \qquad \text{AMMI model}  \\

\underline{y}_{ijk} = \mu + E_j + \sum_{k \in K}\lambda_ku_{ik}\nu_{jk} + \underline{\epsilon}_{ijk} \qquad \text{GGE model} \\

\underline{y}_{ijk} = \mu + G_i + E_j + x_i\alpha_j + \beta_iZ_j + \underline{\epsilon}_{ijk} \qquad \text{Factorial regression} \\
$$
