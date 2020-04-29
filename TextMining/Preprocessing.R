docs.transf <- tm_map(Merged_corpus, content_transformer(tolower)) #Convert to lowercase
Merged_corpus[[1]]$content[1:5]
docs.transf[[1]]$content[1:5]

docs.transf <- tm_map(docs.transf, removePunctuation) #Remove punctuation
docs.transf[[1]]$content[1:5]

docs.transf <- tm_map(docs.transf, removeWords, stopwords("english")) #Remove stopwords
docs.transf[[1]]$content[1:5]
