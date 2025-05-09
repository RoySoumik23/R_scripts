# List of required packages
required_packages <- c(
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
  
  # RNA-Seq & Differential Expression
  "DESeq2", "edgeR", "limma", "tximport", "biomaRt",
  
  # Single-Cell RNA-Seq
  "Seurat", "SingleCellExperiment", "scran",
  
  # Genomic Data Handling
  "GenomicRanges", "IRanges", "SummarizedExperiment", "Biostrings", 
  "BSgenome", "AnnotationHub", "rtracklayer",
  
  # Survival Analysis
  "ggsurvfit", "tidycmprsk", "survival", "survminer",
  
  # Extras
  "NMF", "patchwork", "ggrepel", "tidyverse", "igraph", "SNFtool",
  "reshape2", "circlize", "Palimpsest", "qgraph", "GGally", "lsa",
  "corrgram", "ggtext", "ggcorrplot" ,"cluster", "mclust", "pheatmap", "circlize"
)

# Get installed packages
installed_packages <- rownames(installed.packages())

# Install missing packages
missing_packages <- setdiff(required_packages, installed_packages)
if (length(missing_packages) > 0) {
  install.packages(missing_packages, dependencies = TRUE)
}

# Install GitHub package if missing
if (!"condsurv" %in% installed_packages) {
  devtools::install_github("zabore/condsurv")
}

# Install Bioconductor package if missing
if (!"ComplexHeatmap" %in% installed_packages) {
  BiocManager::install("ComplexHeatmap")
}

# Ensure BiocManager is installed
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

# Install VariantAnnotation only if it's not already installed
if (!requireNamespace("VariantAnnotation", quietly = TRUE)) {
    BiocManager::install("VariantAnnotation")
}

# Ensure devtools is installed
if (!requireNamespace("devtools", quietly = TRUE)) {
    install.packages("devtools")
}

# Install Palimpsest from GitHub only if it's not already installed
if (!requireNamespace("Palimpsest", quietly = TRUE)) {
    devtools::install_github("FunGeST/Palimpsest", dependencies = TRUE)
}

if (!requireNamespace("ConsensusClusterPlus", quietly = TRUE)) {
    BiocManager::install("ConsensusClusterPlus")
}


# Load all packages
invisible(lapply(required_packages, library, character.only = TRUE))

# Clean up workspace
rm(required_packages, installed_packages, missing_packages)

message("\n✅ All packages installed and loaded successfully!\n")
