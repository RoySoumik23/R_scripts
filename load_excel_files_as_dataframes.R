# Script to read all .xlsx files from a specified directory and load them as data frames
# The data frames are named based on the file names (without the .xlsx extension).
# This script can be used in various projects where users need to load Excel files from a folder.

# Load necessary library
source("https://raw.githubusercontent.com/RoySoumik23/R_scripts/refs/heads/main/libraries_and_setup.R")

# Define the path to the directory containing .xlsx files
# Replace the default path with the path to your directory
path <- "/path/to/your/excel/files"  # Change this to your folder path

# List all files with the .xlsx extension in the specified directory
files <- list.files(path, pattern = "\\.xlsx$", full.names = TRUE)

# Loop through each file in the directory
for (f in files) {
  # Extract the file name without the .xlsx extension to use as the data frame name
  df_name <- gsub("\\.xlsx$", "", basename(f))
  
  # Read the Excel file and assign it to a variable in the global environment
  assign(df_name, read_excel(f), envir = .GlobalEnv)
}

message("End of script: All Excel files from the specified directory have been loaded as data frames.")
