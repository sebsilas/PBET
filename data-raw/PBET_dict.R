## code to prepare `PBET_dict` dataset goes here
library(readxl)
library(musicassessr)

PBET_dict_df <- read_excel("data-raw/PBET_dict.xlsx")

PBET_dict <- musicassessr::dict(additional_dict = PBET_dict_df)

PBET_dict_t <- as.data.frame(PBET_dict)

# PBET_dict_t %>% dplyr::filter(key == "arrhythmic_melody_trial_instruction_text_sing_melody_first")

usethis::use_data(PBET_dict, overwrite = TRUE)

