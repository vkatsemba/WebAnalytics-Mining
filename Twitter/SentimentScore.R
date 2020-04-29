bing_Italy <- Italy_clean %>% inner_join(get_sentiments("bing")) %>% count(word, sentiment, sort = TRUE) %>% ungroup()
bing_Germany <- Germany_clean %>% inner_join(get_sentiments("bing")) %>% count(word, sentiment, sort = TRUE) %>% ungroup()

sentiment_bing = function(twt){
      twt_tbl = tibble(text = twt) %>% 
        mutate(
          stripped_text = gsub("http\\S+","",text)
        ) %>%
      unnest_tokens(word,stripped_text) %>% 
        anti_join(stop_words) %>%  
      inner_join(get_sentiments("bing")) %>%
        count(word, sentiment, sort = TRUE) %>% 
        ungroup() %>% 
        mutate(
          score = case_when(
     sentiment == 'negative'~ n*(-1),
     sentiment == 'positive'~ n*1)
   )
      sent.score = case_when(
        nrow(twt_tbl)==0~0, 
        nrow(twt_tbl)>0~sum(twt_tbl$score) 
        )
      zero.type = case_when(
        nrow(twt_tbl)==0~"Type 1", 
        nrow(twt_tbl)>0~"Type 2" 
      )
      list(score = sent.score, type = zero.type, twt_tbl = twt_tbl)
}

sentiment_bing(Italy$text)$score
sentiment_bing(Germany$text)$score
