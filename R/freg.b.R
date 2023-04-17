

# This file is a generated template, your changes will not be overwritten

fregClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "fregClass",
            inherit = fregBase,
            private = list(
                .run = function() {
                    pwrss.f.reg(
                        r2 = 0.10,
                        f2 = r2 / (1 - r2),
                        k = 1,
                        m = k,
                        alpha = 0.05,
                        n = NULL,
                        power = NULL,
                        verbose = TRUE
                    )


                    pwrss.f.reg(r2 = 0.30, k = 3, power = 0.80, alpha = 0.05)

                    
                    pwrss.f.reg(r2 = 0.15, k = 5, m = 2, power = 0.80, alpha = 0.05)

                    
                    
                    
                    pwrss.f.regression <-
                        pwrss.f.reg <- function (r2 = 0.10,
                                                 f2 = r2 / (1 - r2),
                                                 k = 1,
                                                 m = k,
                                                 alpha = 0.05,
                                                 n = NULL,
                                                 power = NULL,
                                                 verbose = TRUE)



                            cat(
                                ifelse(
                                    m == k,
                                    " Linear Regression (F test) \n R-squared Deviation from 0 (zero) \n",
                                    " Hierarchical Linear Regression (F test) \n R-squared Change \n"
                                ),
                                "H0: r2 = 0 \n HA: r2 > 0 \n",
                                "------------------------------ \n",
                                " Statistical power =",
                                round(power, 3),
                                "\n",
                                " n =",
                                ceiling(n),
                                "\n",
                                "------------------------------ \n",
                                "Numerator degrees of freedom =",
                                round(df1, 3),
                                "\n",
                                "Denominator degrees of freedom =",
                                round(df2, 3),
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
