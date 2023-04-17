

# This file is a generated template, your changes will not be overwritten

ftestClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "ftestClass",
            inherit = ftestBase,
            private = list(
                .run = function() {
                    
                    
                    power.f.test(ncp = 3, df1 = 2, df2 = 98,
                                 alpha = 0.05, plot = TRUE)
                    
                    
                    
                    
                    
                    power.f.test(
                        ncp,
                        df1,
                        df2,
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
