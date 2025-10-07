# install Require and SpaDES.project
repos <- c("https://predictiveecology.r-universe.dev", getOption("repos"))
source("https://raw.githubusercontent.com/PredictiveEcology/pemisc/refs/heads/development/R/getOrUpdatePkg.R")
getOrUpdatePkg(c("Require", "SpaDES.project"), c("1.0.1.9003", "0.1.1.9037")) # only install/update if required

# generic absolute path for anybody; but individual can change
projectDir <- "~/GitHub/LandR_testing/"
dir.create(projectDir, recursive = TRUE, showWarnings = FALSE)
setwd(projectDir)

# Require::Install("PredictiveEcology/SpaDES.project@development (>=0.1.1.9012)")
# pkgload::load_all("~/GitHub/SpaDES.project/");
# devtools::install("~/GitHub/SpaDES.project/");
# devtools::install("~/GitHub/reproducible/");
# pkgload::load_all("~/GitHub/SpaDES.project/");
inSim <- SpaDES.project::setupProject(
  modules = c("PredictiveEcology/Biomass_borealDataPrep@development",
              "PredictiveEcology/Biomass_speciesData@development"
  ),
  useGit = "eliotmcintire"
)
