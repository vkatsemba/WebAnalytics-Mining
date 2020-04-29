library(tidytext)
library(dplyr)
Italy$stripped_text <- gsub("http\\S+","", Italy$text)
Germany$stripped_text <- gsub("http\\S+", "", Germany$text)

Italy_stem <- Italy %>% select(stripped_text) %>% unnest_tokens(word, stripped_text)
Germany_stem <- Germany %>% select(stripped_text) %>% unnest_tokens(word, stripped_text)

data("stop_words")
Italy_clean <- Italy_stem %>% anti_join(stop_words)
Germany_clean <- Germany_stem %>% anti_join(stop_words)
