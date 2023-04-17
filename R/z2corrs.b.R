

# This file is a generated template, your changes will not be overwritten

z2corrsClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "z2corrsClass",
            inherit = z2corrsBase,
            private = list(
                .run = function() {
                    
                    
                    
                    
                    pwrss.z.2corrs(r1 = 0.30, r2 = 0.20,
                                   power = .80, alpha = 0.05,
                                   alternative = "greater")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.2corrs(r1 = 0.30, r2 = 0.20,
                                   power = .80, alpha = 0.05,
                                   alternative = "not equal")
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    pwrss.z.2corrs(
                        r1 = 0.50,
                        r2 = 0.30,
                        alpha = 0.05,
                        kappa = 1,
                        alternative = c("not equal", "greater", "less"),
                        n2 = NULL,
                        power = NULL,
                        verbose = TRUE
                    )

                    pwrss.z.2cors <-
                        pwrss.z.2corrs <- function (r1 = 0.50,
                                                    r2 = 0.30,
                                                    alpha = 0.05,
                                                    kappa = 1,
                                                    alternative = c("not equal", "greater", "less"),
                                                    n2 = NULL,
                                                    power = NULL,
                                                    verbose = TRUE)


                            cat(
                                " Difference between Two Correlations \n (Independent Samples z Test) \n",
                                switch(
                                    hypothesis,
                                    `not equal` = "H0: r1 = r2 \n HA: r1 != r2 \n",
                                    `greater` = "H0: r1 = r2 \n HA: r1 > r2 \n",
                                    `less` = "H0: r1 = r2 \n HA: r1 < r2 \n"
                                ),
                                "------------------------------ \n",
                                " Statistical power =",
                                round(power, 3),
                                "\n",
                                " n1 =",
                                ceiling(n1),
                                "\n",
                                " n2 =",
                                ceiling(n2),
                                "\n",
                                "------------------------------ \n",
                                "Alternative =",
                                dQuote(alternative),
                                "\n",
                                "Non-centrality parameter =",
                                round(ncp, 3),
                                "\n",
                                "Type I error rate =",
                                round(alpha, 3),
                                "\n",
                                "Type II error rate =",
                                round(1 - power, 3),
                                "\n"
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
