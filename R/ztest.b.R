

# This file is a generated template, your changes will not be overwritten

ztestClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "ztestClass",
            inherit = ztestBase,
            private = list(
                .run = function() {
                    
                    power.z.test(ncp = 1.96, alpha = 0.05,
                                 alternative = "not equal", plot = TRUE)
                    
                    
                    power.z.test(alpha = c(0.001, 0.010, 0.025, 0.050), plot = FALSE,
                                 ncp = 1.96, alternative = "greater")
                    
                    
                    power.z.test(
                        ncp,
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
