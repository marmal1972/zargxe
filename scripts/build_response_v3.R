rm(list = ls())
library(tidyverse)

nG <- 30
nLoc <- 40
labG <- str_c("G_", str_pad(1:nG, pad = "0", width = 2))
labLoc <- str_c("Loc_", str_pad(1:nLoc, pad = 0, width = 2))

set.seed(seed = 39562)
Ginfo <- tibble(
  Geno = factor(labG),
  yld_gross = runif(nG, min = 4, max = 8),
  prem = runif(nG, min = 0.3, max = 0.6),
  prot = runif(nG, min = 0.05, max = 0.25),
  GL_yld = runif(nG, min = 0.01, max = 0.05),
  GY_yld = runif(nG, min = 0.02, max = 0.08),
  GLY_yld = runif(nG, min = 0.02, max = 0.1),
  GL_prem = runif(nG, min = 0.01, max = 0.02),
  GY_prem = runif(nG, min = 0.01, max = 0.03),
  GLY_prem = runif(nG, min = 0.01, max = 0.08),
  GL_prot = runif(nG, min = 0.005, max = 0.015),
  GY_prot = runif(nG, min = 0.01, max = 0.02),
  GLY_prot = runif(nG, min = 0.01, max = 0.05),
  diseases = runif(nG, min = 0.05, max = 0.8),
  water = runif(nG, min = 0.10, max = 0.5))

arrange(Ginfo, desc(yld_gross)) |> print(n = 30)

# Quick check
layout <- crossing(Year = factor(2020:2022), Loc = factor(labLoc), 
                   Block = factor(1:3), Geno = factor(labG)) |>
  left_join(select(Ginfo, Geno, yld_gross, prem, prot), by = "Geno")

# Add year and location main effects
# put in long format to work with the 3 traits at the same time!
# to be continued...
layout
group_by(layout, Loc) |> summarise(avg_yld = mean(yld_gross))
