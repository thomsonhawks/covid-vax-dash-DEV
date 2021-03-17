library(reticulate)

# Define paths
virtualenv_path <- '/users/ericphillips/PycharmProjects/RosettaJupyter/venv'
csv_path <- 'data/processed/processed_vaccination_data.csv'

# Download vaccine CSV
processed_vax_url <- 'https://github.com/ubco-mds-2020-labs/covid_vaccine_dashboard/raw/main/data/processed/processed_vaccination_data.csv'
download.file(processed_vax_url,csv_path)

# Set up reticulate
use_virtualenv(virtualenv_path,required=TRUE)

# Import Python scripts
get_data_python <- import_from_path('get_data', path='/users/ericphillips/ubc_mds/data_551/covid_vaccine_dashboard/src')
get_data_div_python <- import_from_path('get_data_div', path='/users/ericphillips/ubc_mds/data_551/covid_vaccine_dashboard/src')

get_data <- function() {
  # Get processed data
  data <- get_data_python$get_data()
  data
}

get_data_div <- function() {
  # Get processed data
  data_div <- get_data_div_python$get_data_div()
  data_div
}