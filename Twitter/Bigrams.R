Italy_pairs <- Italy %>% select(stripped_text) %>% unnest_tokens(pairs, stripped_text, token = "ngrams", n = 2)
Germany_pairs <- Germany %>% select(stripped_text) %>% unnest_tokens(pairs, stripped_text, token = "ngrams", n = 2)

library(tidyr)
Italy_pairs_sep <- Italy_pairs %>% separate(pairs, c("Word1", "Word2"), sep = " ")
Italy_cleanpairs <- Italy_pairs_sep %>% filter(!Word1 %in% stop_words$word) %>% filter(!Word2 %in% stop_words$word)
Italy_pairs_new <- Italy_cleanpairs %>% count(Word1, Word2, sort = TRUE)
head(Italy_pairs_new)

Germany_pairs_sep <- Germany_pairs %>% separate(pairs, c("Word1", "Word2"), sep = " ")
Germany_cleanpairs <- Germany_pairs_sep %>% filter(!Word1 %in% stop_words$word) %>% filter(!Word2 %in% stop_words$word)
Germany_pairs_new <- Germany_cleanpairs %>% count(Word1, Word2, sort = TRUE)
head(Germany_pairs_new)
