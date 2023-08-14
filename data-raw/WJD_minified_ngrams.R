
library(tidyverse)

WJD::ngram_item_bank %>% nrow()

# 2,179,098

# With 20 melodies and the standard sampling method, what melody lengths would we end up with?
t <- WJD::phrase_item_bank %>% as_tibble() %>% musicassessr::item_sampler(20)

range(t$N)

# You would end up with only lengths 2 to 21

WJD_ngram_minified <- WJD::ngram_item_bank %>%
  itembankr::subset_item_bank(item_length = c(2, 21),
                              retain_classes = TRUE)

nrow(WJD_ngram_minified)/nrow(WJD::ngram_item_bank)

# Copy a version to PBET to don't need to import the (large) WJD package
WJD_phrase_item_bank <- WJD::phrase_item_bank

# Class
WJD_phrase_item_bank <- WJD_phrase_item_bank %>% itembankr::set_item_bank_class()
WJD_ngram_minified <- WJD_ngram_minified %>% itembankr::set_item_bank_class()


use_data(WJD_ngram_minified, WJD_phrase_item_bank, compress = "xz", overwrite = TRUE)
