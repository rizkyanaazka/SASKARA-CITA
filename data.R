library(sf)
library(rmapshaper)
library(readr)

geojson_url <- "https://raw.githubusercontent.com/rizkyanaazka/SASKARA-CITA/main/Indonesia%20dalam%20511.geojson"
sovi_map_geojson_original <- st_read(geojson_url)

s_keep <- 0.01 
sovi_map_geojson_simple <- ms_simplify(sovi_map_geojson_original, keep = s_keep, keep_shapes = TRUE)

st_write(sovi_map_geojson_simple, "Indonesia_simplified_map.geojson", delete_layer = TRUE, quiet = TRUE)

data_url <- "https://raw.githubusercontent.com/bmlmcmc/naspaclust/main/data/sovi_data.csv"
distance_matrix_url <- "https://raw.githubusercontent.com/bmlmcmc/naspaclust/main/data/distance.csv"

sovi_data <- read_csv(data_url, show_col_types = FALSE)
write.csv(sovi_data, "sovi_data_local.csv", row.names = FALSE)

distance_matrix <- read_csv(distance_matrix_url, show_col_types = FALSE)
write.csv(distance_matrix, "distance_local.csv", row.names = FALSE)

rm(list=c("sovi_map_geojson_original", "sovi_map_geojson_simple", "sovi_data", "distance_matrix"))
gc()