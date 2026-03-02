# -----------------------------------------------------------------------------
# Behavior: Gets the #1 album for each year in the range you pick. One row per year.
# Examples: number_one_album(2018, 2024)
#           number_one_album(1993, 2000)
# Exceptions: Empty table if no #1 albums in that range
# Returns:  Table with Year, Album, Artist columns
# Parameters:
#   var.startyear: It is an integer. It is the start of the year range (included).
#                  It should be a positive year and less than or equal to var.endyear.
#   var.endyear:   It is an integer. It is the end of the year range (included).
#                  It should be a positive year and greater than or equal to var.startyear.
# -----------------------------------------------------------------------------
number_one_album <- function(var.startyear, var.endyear){
  top_albums <- select(filter(album_data, Ranking ==1, Year >= var.startyear, Year <= var.endyear), Year, Album, Artist)
}
