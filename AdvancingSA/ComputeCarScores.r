# Install and load required packages
packages <- c("ggplot2", "readr", "care", "httpgd", "dplyr")

for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
  library(pkg, character.only = TRUE)
}

# Define directories
simulation_data_dir <- "./simulation_data/"
output_data_dir <- "./results_data/"

# Ensure output directory exists
if (!dir.exists(output_data_dir)) {
  dir.create(output_data_dir, recursive = TRUE)
}

# File names
simulation_files <- list(
  ROM_flexion = "ROM_Results_Flexion_wMoment_1024.csv",
  ROM_extension = "ROM_Results_Extension_wMoment_1024.csv",
  ROM_lateral_bending = "ROM_Results_LateralBending_wMoment_1024.csv",
  ROM_axial_rotation = "ROM_Results_AxialRotation_wMoment_1024.csv",
  IDP_flexion = "IDP_Results_Flexion_wMoment_1024.csv",
  IDP_extension = "IDP_Results_Extension_wMoment_1024.csv",
  IDP_lateral_bending = "IDP_Results_LateralBending_wMoment_1024.csv",
  IDP_axial_rotation = "IDP_Results_AxialRotation_wMoment_1024.csv"
)

# Read and process data function
read_last_column <- function(file_path) {
  tryCatch({
    data <- read_csv(file_path)
    data[[ncol(data)]]
  }, error = function(e) {
    message("Error reading file: ", file_path)
    return(NULL)
  })
}

# Load simulation data
X <- read_csv(file.path(simulation_data_dir, "MaterialConfigurations_1024.csv"))

# Apply min-max scaling to each column
min_max_scale <- function(x) {
  (x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}

# Scale input data X
X_scaled <- as.data.frame(lapply(X, min_max_scale))

# Process and scale each Y dataset
scaled_Y_values <- list()
for (name in names(simulation_files)) {
  file_path <- file.path(simulation_data_dir, simulation_files[[name]])
  Y_values <- read_last_column(file_path)
  if (!is.null(Y_values)) {
    scaled_Y_values[[name]] <- min_max_scale(Y_values)
  }
}

# Function to calculate CAR scores
compute_car_scores <- function(X_scaled, Y_scaled, output_file) {
  tryCatch({
    car_scores <- carscore(X_scaled, Y_scaled, diagonal = FALSE)
    write.csv(data.frame(car_scores), file = output_file, row.names = FALSE)
  }, error = function(e) {
    message("Error calculating/writing CAR scores for ", output_file)
  })
}

# Calculate and save CAR scores
for (name in names(scaled_Y_values)) {
  output_file <- file.path(output_data_dir, paste0("CARScores_", name, ".csv"))
  compute_car_scores(X_scaled, scaled_Y_values[[name]], output_file)
}