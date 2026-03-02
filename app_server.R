# -----------------------------------------------------------------------------
# Behavior: Shiny server function. Registers reactive outputs: renderUI (HTML),
#           renderText, renderTable, renderPlot. Uses observeEvent for
#           actionButton-triggered updates. Calls sourced functions (total_album_count,
#           year_albums, albums_by_bands, etc.) with input$ values.
# Examples: server(input, output) invoked by shinyApp(ui, server)
# Exceptions: Sourced functions must exist; input IDs must match app_ui.R
# Returns:  none (side effects: populates output$*)
# Parameters:
#   input  (list): Reactive inputs from UI (input$rng, input$year, etc.)
#   output (list): Output list to assign render* results (output$title, etc.)
# -----------------------------------------------------------------------------
server <- function(input, output) {

  # App title; renders as H1 in mainPanel
  output$title <- renderUI({
    HTML("<h1>My Favorite Albums</h1><br>")
  })

# --- Tab: Home ---
  # Welcome message; HTML paragraph
  output$texthome1 <- renderUI({
    HTML("<br><h2>Welcome!</h2><p>My Favorite Albums allows you to analayze lists of your favorite albums from multiple years.</p>")
  })

  # Total album count; calls total_album_count(), prints to textOutput
  output$total_albums <- renderText({
      return(total_album_count())
    })

  # Total unique artists; calls total_band_count(), prints to textOutput
  output$total_bands <- renderText({
    return(total_band_count())
  })

  # Artist with most albums; calls most_pop_artist(), prints to textOutput
  output$popular_artist <- renderText({
    return(most_pop_artist())
  })

# --- Tab: Number One Albums ---
  # Section header for Number One Albums tab
  output$text3 <- renderUI({
    HTML("<h2>Number One Albums</h2><br>")
  })

  # Table of #1 album per year; uses input$rng slider (start, end year)
  output$number_one_table <- renderTable({
    return(number_one_album(input$rng[1], input$rng[2]))
  })

# --- Tab: Top Albums By Year ---
  # Section header for Top Albums by Year tab
  output$text4 <- renderUI({
    HTML("<h2>Top Albums by Year</h2><br>")
  })

  # Spacer HTML
  output$text5 <- renderUI({
    HTML("<br><br>")
  })

  # On Submit: render year_albums table for selected input$year
  observeEvent(input$action_button2,{

    output$year_table <- renderTable({
      return(year_albums(input$year))
    })

  })

# --- Tab: Artists' Albums ---
  # Section header for Artists' Albums tab
  output$text <- renderUI({
    HTML("<h2>About an Artist's Albums</h2><br>")
  })

  # Spacer HTML
  output$text2 <- renderUI({
    HTML("<br><br>")
  })

  # On Submit: album table, album count, avg rating for selected input$band_name
  observeEvent(input$action_button,{

    output$album_table <- renderTable({
      return(albums_by_bands(input$band_name))
    })

    output$album_count <- renderText({
      return(band_album_count(input$band_name))
    })
    output$avg_rating <- renderText({
      return(band_mean_rating(input$band_name))
    })

  })

# --- Tab: Favorite Artists ---
  # Section header for Favorite Artists tab
  output$text10 <- renderUI({
    HTML("<h2>Artists with Highly Rated Albums</h2><br>")
  })
  # On Submit: top 15 artists table; uses input$min_albums, input$live_ep_checkbox
  observeEvent(input$action_button4,{
    output$fav_artists_table <- renderTable({
      return(favorite_bands(input$min_albums, input$live_ep_checkbox))
    })
})

# --- Tab: Artist Comparison ---
  # Section header for Artist Comparison tab
  output$text8 <- renderUI({
    HTML("<h2>Compare Two Artists on the Graph</h2><br>")
  })

  # Spacer HTML
  output$text9 <- renderUI({
    HTML("<br><br>")
  })

  # Line chart comparing input$band_name_1 (red) vs input$band_name_2 (blue)
  output$compare_bands <- renderPlot({
    return(band_album_comparison_chart(input$band_name_1, input$band_name_2))
  })

# --- Tab: Vinyl ---
  # Section header for Vinyl tab
  output$text6 <- renderUI({
    HTML("<h2>Top-Rated Albums Not Owned on Vinyl</h2><br>")
  })

  # On Submit: missing vinyl table; uses input$vinyl_rating threshold
  observeEvent(input$action_button3,{
    output$missing_vinyl_table <- renderTable({
      return(missing_vinyl(input$vinyl_rating))
    })

  })
}
