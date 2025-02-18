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
  
  # Survival Analysis (New Additions)
  "ggsurvfit", "tidycmprsk", "survival", "survminer",
  
  # Extras add here
  "NMF"
)

# Install any missing packages
for (pkg in required_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
  }
}
devtools::install_github("zabore/condsurv")
library(condsurv)

# Load all packages
lapply(required_packages, library, character.only = TRUE)

# Clean up workspace
rm(required_packages, pkg)

message("\n✅ All packages installed and loaded successfully!\n")
