library(ggplot2)

# -----------------------------------------------------------------------------
# Behavior: Makes a line chart comparing two artists. First artist = red line,
#           second = blue. X-axis is year, Y-axis is rating. Needs ggplot2.
# Examples: band_album_comparison_chart("Radiohead", "Arcade Fire")
#           band_album_comparison_chart("Taylor Swift", "Lana Del Rey")
# Exceptions: Empty chart if artist not found
# Returns:  A chart (shows in Plots pane)
# Parameters:
#   var.artist1: It is a character (text). It is the first artist, shown as the
#                red line. It is case-sensitive and must match album_data$Artist.
#   var.artist2: It is a character (text). It is the second artist, shown as the
#                blue line. It is case-sensitive and must match album_data$Artist.
# -----------------------------------------------------------------------------
band_album_comparison_chart <- function(var.artist1, var.artist2){
  band1_albums <- select(filter(album_data[order(album_data$Year),], Artist==var.artist1), Artist, Album, Year, Rating)
  band2_albums <- select(filter(album_data[order(album_data$Year),], Artist==var.artist2), Artist, Album, Year, Rating)
  
  ggplot() +
    geom_line(data = band1_albums, aes(x = Year, y = Rating), color = "red") +
    geom_line(data = band2_albums, aes(x = Year, y = Rating), color = "blue") +
    geom_point(data = band1_albums, aes(x = Year, y = Rating)) +
    geom_point(data = band2_albums, aes(x = Year, y = Rating)) +
    xlab("Year")+
    ylab("Rating")+
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
    ggtitle(paste0("Album Ratings for " , band1_albums$Artist, "(Red) and ", band2_albums$Artist, "(Blue)"))+
    scale_x_continuous(breaks=seq(1993,2024,1))+
    scale_y_continuous(breaks=seq(0,10,1))+
    expand_limits(x=c(1993,2024), y=c(0,10))
}