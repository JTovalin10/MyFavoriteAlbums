# -----------------------------------------------------------------------------
# Behavior: Finds highly rated albums you don't own on vinyl. You pick the
#           minimum rating. Sorted by rating (best first).
# Examples: missing_vinyl(8.5)
#           missing_vinyl(9)
# Exceptions: Empty table if nothing matches; returns NA if you pass a non-number
# Returns:  Table with Album, Artist, Rating columns
# Parameters:
#   missing_vinyl_rating.var: It is a number. It is the minimum rating (0 to 10
#                             scale). Only albums with a rating greater than or
#                             equal to this value are included. Can be a decimal
#                             like 8.5.
# -----------------------------------------------------------------------------
missing_vinyl <- function(missing_vinyl_rating.var){
  buy_vinyl <- select(filter(album_data[order(-album_data$Rating),], Rating >= as.numeric(missing_vinyl_rating.var), Vinyl ==""), Album, Artist, Rating)
}

