# -----------------------------------------------------------------------------
# Behavior: Starts the app. Loads the libraries, then loads the UI, server,
#           and all the helper functions. Launches the app.
# Examples: Run this file in RStudio to start the app
# Exceptions: Stops if the data file or any R file is missing
# Returns:  Opens the app in your browser
# Parameters: none
# -----------------------------------------------------------------------------

library(shiny)
library(dplyr)

# Load the page layout and data
source("app_ui.R")
# Load what happens when user clicks things
source("app_server.R")
# Home tab: album count, artist count, most albums
source("home.R")
# Artist tab: albums by band, avg rating, album count
source("albums_by_band.R")
# Number one album per year
source("number_one_albums.R")
# Albums for one year
source("albums_by_year.R")
# Vinyl wishlist
source("vinyl.R")
# Artist comparison chart
source("compare_bands.R")
# Top 15 artists
source("fav_bands.R")

# Start the app
shinyApp(ui = ui, server = server)
