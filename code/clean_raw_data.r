# clean_raw_data.r
# this script is designed to clean the raw data for the WP ICO analysis.

#globals
raw_filename <- "../data/raw/wp_ico.csv"
proc_filename <- "../data/preprocessed/cleaned_wp_ico.csv"
row_removal_start <- 440 #where artifacts exist

#load in data
raw_wp_ico_frame <- read.csv(raw_filename,header = TRUE)

#remove artifact rows
rows_to_remove <- seq(from = row_removal_start,to = dim(raw_wp_ico_frame)[1],
                      by = 1)
proc_wp_ico_frame <- raw_wp_ico_frame[-rows_to_remove,]

#save
write.csv(proc_wp_ico_frame,file = proc_filename,row.names = FALSE)
