## code to prepare `PBET_dict` dataset goes here

PBET_dict_df <- read_excel("data-raw/PBET_dict.xlsx")

# for now

PBET_dict_df <- PBET_dict_df %>% select(key, en)

PBET_dict <- musicassessr::dict(additional_dict = PBET_dict_df)


usethis::use_data(PBET_dict, overwrite = TRUE, internal = TRUE)
