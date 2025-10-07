# install Require and SpaDES.project
repos <- c("https://predictiveecology.r-universe.dev", getOption("repos"))
source("https://raw.githubusercontent.com/PredictiveEcology/pemisc/refs/heads/development/R/getOrUpdatePkg.R")
getOrUpdatePkg(c("Require", "SpaDES.project"), c("1.0.1.9003", "0.1.1.9037")) # only install/update if required

# generic absolute path for anybody; but individual can change
projectDir <- "~/GitHub/LandR_testing/"
dir.create(projectDir, recursive = TRUE, showWarnings = FALSE)
setwd(projectDir)

inSim <- SpaDES.project::setupProject(
  modules = c("PredictiveEcology/Biomass_borealDataPrep@development"# ,
              # "PredictiveEcology/Biomass_speciesData@development"
  ),
  packages = "googledrive",
  useGit = "eliotmcintire",
  options = options("spades.inputPaths" = "~/data"),
  studyArea =
    terra::as.polygons(terra::ext(c(xmin = 5706900, xmax = 5971300, ymin = 2047900, ymax = 2263800)),
                       crs = "EPSG:3348")
)
if (FALSE) {
  devtools::install("~/GitHub/reproducible/", upgrade = FALSE);
  devtools::install("~/GitHub/SpaDES.core/", upgrade = FALSE);
  devtools::install("~/GitHub/LandR/", upgrade = FALSE);
}
simOut <- SpaDES.core::simInitAndSpades2(inSim)
