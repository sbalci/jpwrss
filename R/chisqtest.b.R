

# This file is a generated template, your changes will not be overwritten

chisqtestClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "chisqtestClass",
            inherit = chisqtestBase,
            private = list(
                .run = function() {
                    
                    
                    power.chisq.test(ncp = 15, df = 20,
                                     alpha = 0.05, plot = TRUE)
                    
                    
                    
                    power.chisq.test(df = c(80, 90, 100, 120, 150, 200), plot = FALSE,
                                     ncp = 2, alpha = 0.05)
                    
                    
                    power.chisq.test(
                        ncp,
                        df,
                        alpha = 0.05,
                        plot = TRUE,
                        plot.main = NULL,
                        plot.sub = NULL,
                        verbose = TRUE
                    )

                    # self$results$text1$setContent(print(results_1))

                    self$results$text2$setContent(print(results_2))


                    image <- self$results$plot
                    image$setState(results_1)

                }

                ,

                .plot = function(image, ggtheme, theme, ...) {
                    # read data ----

                    plotData <- image$state

                    plot <- plot(plotData)

                    print(plot)
                    TRUE

                }





            )
        )
