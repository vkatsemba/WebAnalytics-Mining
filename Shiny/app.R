library(wordcloud)
# library(proxy)
source("WikiSearch.R")

server <- shinyServer(function(input, output) {
    output$distPlot <- renderPlot({ 
        
        # Progress Bar while executing function
        withProgress({
            setProgress(message = "Mining Wikipedia ...")
            result <- SearchWiki(input$select)
        })
        
        freq <- colSums(as.matrix(result))
        ord <- order(freq)
        set.seed(123)
        wordcloud( names(freq[tail(ord,n=50)]), freq[tail(ord,n=50)], scale=c(4,0.9), colors=brewer.pal(6, "Dark2"))
    })
    output$freqtable <- renderTable({
        
        result <- SearchWiki(input$select)
        freq <- colSums(as.matrix(result))
        ord <- order(freq)
        set.seed(123)
        df <- data.frame(word = names(freq[tail(ord,n=50)]), frequency = unname(freq[tail(ord,n=50)]))
        df[with(df, order(-frequency)),]
        })

})

# Run the application 
shinyApp(ui = ui, server = server)
