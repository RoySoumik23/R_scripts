# Libraries and Setup
source("https://raw.githubusercontent.com/RoySoumik23/R_scripts/refs/heads/main/libraries_and_setup.R")

# ==== [STEP 1] Load the data ====
# Here is a dummy wide-format dataframe with correlations
set.seed(123)
dummy_df <- data.frame(
  FeatureA = runif(10),
  FeatureB = runif(10),
  FeatureC = runif(10),
  FeatureD = runif(10),
  FeatureE = runif(10)
)

# ==== [STEP 2] Compute Correlation Matrix ====
corr_matrix <- cor(dummy_df, method = "pearson", use = "complete.obs")

# ==== [STEP 3] Save to PDF (Optional) ====
pdf(
  file = "my_correlogram.pdf",   # Output path
  height = 10,
  width = 10
)

# ==== [STEP 4] Plot Corrgram ====
corrplot(
  corr_matrix,
  method = "color",  # Other options: "circle", "square", "number"
  type = "lower",    # "upper", "lower", or "full"
  col = colorRampPalette(c("#06EEF9", "white", "#F91106"))(200),  # Color palette
  addCoef.col = "black",        # Show correlation values
  number.digits = 2,            # Digits in values
  number.cex = 1.2,             # Size of numbers
  tl.cex = 1.4,                 # Size of axis labels
  tl.col = "darkblue",          # Axis label color
  tl.srt = 0,                   # Label rotation
  cl.cex = 1.2,                 # Color legend size
  mar = c(2, 2, 2, 2)           # Margins
)

# ==== [STEP 5] Close Device ====
# Close the graphics device if open
if (dev.cur() != 1) dev.off()
