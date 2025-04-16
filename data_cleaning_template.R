# ================================================
# Generic Data Manipulation Template in R
# Author: You
# Purpose: Demonstrate common df operations as a template
# ================================================

# Load libraries
library(dplyr)
library(tibble)

# ==== 1. Create a dummy dataframe ====
set.seed(123)
df <- data.frame(
  ID = paste0("Sample_", seq_len(10)),
  Value1 = sample(1:100, 10),
  Value2 = sample(1:100, 10),
  Category = c("A", "B", "C", "A", "B", "C", "A", "B", NA, "C"),
  Notes = c("include", "check", "remove", NA, "check", "remove", "include", "", "remove", NA),
  stringsAsFactors = FALSE
)

print("Initial DF:")
print(df)

# ==== 2. Filter rows where Category is not NA ====
df <- subset(df, !is.na(Category))

# ==== 3. Use grepl() to keep rows with Notes matching a pattern ====
df <- df[grepl("include|check", df$Notes), ]

# ==== 4. Modify values with gsub (e.g., remove underscores) ====
df$ID <- gsub("Sample_", "S", df$ID)

# ==== 5. Create new column with paste0 ====
df$Label <- paste0(df$Category, "_", df$ID)

# ==== 6. Row-wise operation: Add Value1 and Value2 using apply ====
df$Sum <- apply(df[, c("Value1", "Value2")], 1, sum)

# ==== 7. Column-wise operation using lapply ====
df[, c("Value1", "Value2")] <- lapply(df[, c("Value1", "Value2")], function(x) x * 2)

# ==== 8. Calculate row sums for selected columns ====
df$RowTotal <- rowSums(df[, c("Value1", "Value2")], na.rm = TRUE)

# ==== 9. Use seq_len to create a row index ====
df$Index <- seq_len(nrow(df))

# ==== 10. Set first column as rownames and delete it ====
rownames(df) <- df$ID
df$ID <- NULL

# ==== 11. Create another df and left_join() ====
df2 <- data.frame(
  Label = c("A_S1", "B_S2", "C_S3", "A_S4"),
  Extra_Info = c("X", "Y", "Z", "W")
)

df <- left_join(df, df2, by = "Label")

# ==== 12. Write output to file ====
write.csv(df, "cleaned_dataframe.csv", row.names = TRUE)

# If you want plain text writing
writeLines(c("=== Summary ===", paste("Total rows:", nrow(df))), "summary.txt")

# ==== Final Output ====
print("Cleaned & Enriched DF:")
print(df)
