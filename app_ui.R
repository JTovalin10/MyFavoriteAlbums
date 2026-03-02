# -----------------------------------------------------------------------------
# Behavior: Loads the album data and builds the app layout. Seven tabs with
#           dropdowns, buttons, and places to show results.
# Examples: Loaded when you run app.R
# Exceptions: Stops if the CSV file is missing or wrong format
# Returns:  The ui (what you see) and album_data, all_bands, all_years
# Parameters: none
# -----------------------------------------------------------------------------
library(shiny)

# Load the album data from the CSV file
album_data <- read.csv("data/album-rankings.csv")

# List of all artists for the dropdown menus
all_bands <- sort(unique(album_data$Artist))

# List of all years for the year dropdown
all_years <- sort(unique(album_data$Year))

# -----------------------------------------------------------------------------
# Behavior: The page layout. Each tab has its own inputs (dropdowns, sliders,
#           checkboxes) and outputs (tables, text, charts).
# Examples: Shiny uses this to draw the app
# Exceptions: Dropdowns need all_bands and all_years to have data
# Returns:  The page layout
# Parameters: none
# -----------------------------------------------------------------------------
ui <- fluidPage(
    mainPanel(
      # Title at top of page
      htmlOutput("title"),
      tabsetPanel(
        id = "tabset",
        # Tab 1: Welcome, album count, artist count, most albums artist
        tabPanel("Home",
                 htmlOutput("texthome1"),
                 textOutput("total_albums"),
                 textOutput("total_bands"),
                 textOutput("popular_artist")),
        # Tab 2: Pick year range, see #1 album for each year
        tabPanel("Number One Albums",
                 htmlOutput("text3"),
                 sliderInput("rng", "Choose the Years", value = c(1993, 1998), min = 1993, max = 2024, sep = ""),
                 tableOutput("number_one_table")),
        # Tab 3: Pick a year, click Submit, see that year's rankings
        tabPanel("Top Albums by Year",
                 htmlOutput("text4"),
                 selectInput("year", "Choose a year:", all_years),
                 actionButton("action_button2", label = "Submit"),
                 htmlOutput("text5"),
                 tableOutput("year_table")),
        # Tab 4: Pick an artist, click Submit, see their albums and stats
        tabPanel("Artists' Albums",
                 htmlOutput("text"),
                 selectInput("band_name", "Choose a band or artist:", all_bands),
                 actionButton("action_button", label = "Submit"),
                 htmlOutput("text2"),
                 tableOutput("album_table"),
                 textOutput("album_count"),
                 textOutput("avg_rating")),
        # Tab 5: Pick min albums, exclude EPs/live or not, see top 15 artists
        tabPanel("Favorite Artists",
                 htmlOutput("text10"),
                 selectInput("min_albums", "Minimum number of albums:",
                             c("10 "= 10, "9" = 9, "8" = 8, "7" = 7, "6" = 6, "5" = 5, "4" = 4, "3" = 3, "2" = 2, "1" = 1)),
                 checkboxInput("live_ep_checkbox", "Exclude EPs and Live Albums", TRUE),
                 actionButton("action_button4", label = "Submit"),
                 tableOutput("fav_artists_table")),
        # Tab 6: Pick two artists, see comparison chart
        tabPanel("Artist Comparison",
                 htmlOutput("text8"),
                 selectInput("band_name_1", "First band or artist:", all_bands),
                 selectInput("band_name_2", "Second band or artist:", all_bands),
                 htmlOutput("text9"),
                 plotOutput("compare_bands")),
        # Tab 7: Pick rating cutoff, see albums to buy on vinyl
        tabPanel("Vinyl",
                 htmlOutput("text6"),
                 selectInput("vinyl_rating", "Select which albums to display:",
                             c("Only 10 ratings" = 10, "9 and higher" = 9, "8 and higher" = 8, "7 and higher" = 7)),
                 actionButton("action_button3", label = "Submit"),
                 tableOutput("missing_vinyl_table"))
    )
    )
)

