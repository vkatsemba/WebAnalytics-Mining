DTM <- DocumentTermMatrix(docs.transf, control = list(wordLengths = c(2,Inf), bounds = list(global = c(5,Inf)) ))
