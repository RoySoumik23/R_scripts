#===============================================================
# List of required packages
#===============================================================

# CRAN packages
cran_packages <- c(
  # Basic Data Handling
  "readxl", "readr", "data.table", "dplyr", "tidyr", "purrr", 
  "tibble", "janitor", "glue", "stringr", "lubridate", "forcats",

  # Visualization
  "ggplot2", "pheatmap", "ggpubr", "cowplot", "ggrepel", "scales", 
  "gridExtra", "patchwork", "ggforce", "ggthemes", "ggsci", 
  "RColorBrewer", "wesanderson", "ggExtra", "plotly", "circlize", 
  "VennDiagram", "corrplot", "UpSetR", "rgl", "ggalluvial",

  # Clustering & Dimensionality Reduction
  "Rtsne", "umap", "FactoMineR", "factoextra", "NbClust", "cluster", "fpc",

  # Single-Cell RNA-Seq
  "Seurat",

  # Genomic Data Handling
  "GenomicRanges", "IRanges", "SummarizedExperiment", "Biostrings", 
  "BSgenome", "rtracklayer",

  # Survival Analysis
  "ggsurvfit", "tidycmprsk", "survival", "survminer",

  # Extras
  "NMF", "tidyverse", "igraph", "SNFtool", "reshape2", "qgraph", 
  "GGally", "lsa", "corrgram", "ggtext", "ggcorrplot", "mclust",
  "dbscan", "kernlab"
)

# Bioconductor packages
bioc_packages <- c(
  "ComplexHeatmap", "VariantAnnotation", "ConsensusClusterPlus"
)

#===============================================================
# Install CRAN packages
#===============================================================
installed_packages <- rownames(installed.packages())
missing_cran <- setdiff(cran_packages, installed_packages)
if (length(missing_cran) > 0) {
  install.packages(missing_cran, dependencies = TRUE)
}

#===============================================================
# Install Bioconductor packages
#===============================================================
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

for (pkg in bioc_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    BiocManager::install(pkg)
  }
}

#===============================================================
# Install GitHub packages
#===============================================================

# Ensure devtools is installed
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

# Install condsurv if missing
if (!requireNamespace("condsurv", quietly = TRUE)) {
  devtools::install_github("zabore/condsurv")
}

# Install Palimpsest if missing
if (!requireNamespace("Palimpsest", quietly = TRUE)) {
  devtools::install_github("FunGeST/Palimpsest", dependencies = TRUE)
}

#===============================================================
# Load All Packages
#===============================================================
all_packages <- unique(c(cran_packages, bioc_packages, "condsurv", "Palimpsest"))

invisible(lapply(all_packages, function(pkg) {
  suppressPackageStartupMessages(library(pkg, character.only = TRUE))
}))

#===============================================================
# Clean up workspace
#===============================================================
rm(cran_packages, bioc_packages, installed_packages, 
   missing_cran, all_packages)

#===============================================================
message("\n✅ All packages installed and loaded successfully!\n")
#===============================================================
