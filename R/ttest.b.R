

# This file is a generated template, your changes will not be overwritten

ttestClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "ttestClass",
            inherit = ttestBase,
            private = list(
                .run = function() {
                    
                    
                    power.t.test(ncp = 1.96, df = 99, alpha = 0.05,
                                 alternative = "equivalent", plot = TRUE)
                    
                    power.t.test(ncp = c(0.50, 1.00, 1.50, 2.00, 2.50), plot = FALSE,
                                 df = 99, alpha = 0.05, alternative = "not equal")
                    
                    power.t.test(
                        ncp,
                        df,
                        alpha = 0.05,
                        alternative = c(
                            "not equal",
                            "greater",
                            "less",
                            "non-inferior",
                            "superior",
                            "equivalent"
                        ),
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
