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
  prem = runif(nG, min = 0.3, max = 0.8),
  prot = runif(nG, min = 0.05, max = 0.25),
  GL_yld = runif(nG, min = 0.01, max = 0.05),
  GY_yld = runif(nG, min = 0.02, max = 0.1),
  GLY_yld = runif(nG, min = 0.02, max = 0.15),
  GL_prem = runif(nG, min = 0.01, max = 0.02),
  GY_prem = runif(nG, min = 0.01, max = 0.03),
  GLY_prem = runif(nG, min = 0.01, max = 0.08),
  GL_prot = runif(nG, min = 0.005, max = 0.015),
  GY_prot = runif(nG, min = 0.01, max = 0.02),
  GLY_prot = runif(nG, min = 0.01, max = 0.05),
  diseases = runif(nG, min = 0.05, max = 0.8),
  water = runif(nG, min = 0.10, max = 0.5))

arrange(Ginfo, desc(yld_gross)) |> print(n = 30)

set.seed(seed = 4846)
nG <- 30
geff <- tibble(
  Geno = factor(labG),
  int = 8,
  g_eff = rnorm(nG, sd = 1),
  water_penalty = runif(nG, min = 0.1, max = 0.5),
  dis_penalty = runif(nG, min = 0.25, max = 0.9),
  Gval_pot = int + g_eff
  )

ggplot(geff, aes(x = Gval_pot)) +
  geom_histogram()

nReg <- 4

loc_info <- tibble(
  Region = factor(rep(LETTERS[1:4], each = 10)),
  Loc = factor(labLoc),
  rain0 = rep(c(0.7, 0.7, 0.8, 0.5), each = 10),
  rainloc0 = runif(nLoc, min = -0.05, max = 0.05),
  irrigation = rep(c(1, 0.5, 0.5, 0.2), each = 10)
  )

year_info <- tibble(
  Year = factor(2023:2027),
  rain = runif(length(Year), min = 0.4, max = 1)
)

print(loc_info, n = 40)


met_info <- expand_grid(Loc = factor(labLoc), Year = factor(2023:2027)) |>
  left_join(loc_info, by = "Loc") |>
  left_join(year_info, by = "Year")


env_eff <- tibble(
  Loc = rep(labLoc, times = 5),
  Year = rep(2023:2027),
  water0 = rep(c(0.8, 0.8))
  Reg_eff = rep(rnorm(nReg, 0, 2), each = 10),
  loc_eff = rnorm(nLoc, 0, 0.75),
  leff = Reg_eff + loc_eff
)

print(site_eff, n = 40)

site_prop <- tibble(
  Loc = factor(labLoc),
  rain =
)

d0 <- tibble(
  Geno = rep(1:100,
  int = 8,
  geff = rnorm(100, sd = 1),
  gxe_eff = rnorm(100, sd = 1.5),
  error = rnorm(100, sd = sqrt(6.5)),
  yld = int + geff + error
)

ggplot(d0, aes(x = yld)) +
  geom_histogram()

filter(d0, yld < 2)

toplot <- select(d0, Geno, geff, gxe_eff, error) |>
  pivot_longer(cols = 2:4, names_to = "Source", values_to = "value")
ggplot(toplot, aes(x = Source, y = value)) +
  geom_boxplot()


# Quick check
layout <- crossing(Year = factor(2020:2022), Loc = factor(labLoc), 
                   Block = factor(1:3), Geno = factor(labG)) |>
  left_join(select(Ginfo, Geno, yld_gross, prem, prot), by = "Geno")

# Add year and location main effects
# put in long format to work with the 3 traits at the same time!
# to be continued...
layout
group_by(layout, Loc) |> summarise(avg_yld = mean(yld_gross))
