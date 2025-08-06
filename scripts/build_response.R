rm(list = ls())
library(tidyverse)

set.seed(seed = 39562)
Ginfo <- tibble(
  Geno = str_c("G_", str_pad(1:30, pad = "0", width = 2)),
  mu_yld1 = runif(length(Geno)) * 4 + 3,
  nbeans1 = mu_yld1 / 0.020,
  mu_yld2 = runif(length(Geno)) * 2 + 2,
  nbeans2 = mu_yld1 / 0.010,
  prot = runif(length(Geno), min = 0.05, max = 0.25),
  yld = (mu_yld1 * 1.2 + mu_yld2 * 0.8) * (1 + prot),
  stab_yld = runif(length(Geno), min = 0.02, max = 0.50),
  stab_prot = runif(length(Geno), min = 0.01, max = 0.10),
  diseases = runif(length(Geno), min = 0.05, max = 0.90),
  water = runif(length(Geno), min = 0.10, max = 0.50))

arrange(Ginfo, desc(yld)) |> print(n = 30)

