
library(tidyverse)

WJD::ngram_item_bank %>% nrow()

# 1,713,401

# With 20 melodies and the standard sampling method, what melody lengths would we end up with?
t <- WJD::phrase_item_bank %>% as_tibble() %>% item_sampler(20)

# You would end up with only lengths 2 to 21

WJD_ngram_minified <- WJD::ngram_item_bank %>%
  as_tibble() %>%
  itembankr::subset_item_bank(item_length = c(2, 21))

nrow(WJD_ngram_minified)/nrow(WJD::ngram_item_bank)

# Copy a version to PBET to don't need to import the (large) WJD package
WJD_phrase_item_bank <- WJD::phrase_item_bank

use_data(WJD_ngram_minified, WJD_phrase_item_bank, compress = "xz", overwrite = TRUE)
