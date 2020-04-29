library(tm)

Doc1.TestPath <- system.file("texts", "20Newsgroups", "20news-bydate-test", "sci.space", package = "tm")
Doc1.TrainPath <- system.file("texts", "20Newsgroups", "20news-bydate-train", "sci.space", package = "tm")
Doc2.TestPath <- system.file("texts", "20Newsgroups", "20news-bydate-test", "rec.autos", package = "tm")
Doc2.TrainPath <- system.file("texts", "20Newsgroups", "20news-bydate-train", "rec.autos", package = "tm")

Doc1Test <- DirSource(Doc1.TestPath)
Doc1Train <- DirSource(Doc1.TrainPath)
Doc2Test <- DirSource(Doc2.TestPath)
Doc2Train <- DirSource(Doc2.TrainPath)

Doc1Test <- Corpus(URISource(Doc1Test[1:100]), readerControl = list(reader = readPlain))
Doc1Train <- Corpus(URISource(Doc1Train[1:100]), readerControl = list(reader = readPlain))
Doc2Test <- Corpus(URISource(Doc2Test[1:100]), readerControl = list(reader = readPlain))
Doc2Train <- Corpus(URISource(Doc2Train[1:100]), readerControl = list(reader = readPlain))

Merged_corpus <- c(Doc1Train, Doc2Train, Doc1Test, Doc2Test)
