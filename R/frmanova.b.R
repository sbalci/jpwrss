

# This file is a generated template, your changes will not be overwritten

frmanovaClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "frmanovaClass",
            inherit = frmanovaBase,
            private = list(
                .run = function() {
                    
                    
                    pwrss.f.rmanova(eta2 = 0.059,  n.levels = 2, n.rm = 1,
                                    power = 0.80, alpha = 0.05,
                                    type = "between")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.f.rmanova(eta2 = 0.022,  n.levels = 1, n.rm = 2,
                                    power = 0.80, alpha = 0.05,
                                    corr.rm = 0.50, type = "within")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.f.rmanova(eta2 = 0.038,  n.levels = 2, n.rm = 2,
                                    power = 0.80, alpha = 0.05,
                                    corr.rm = 0.50, type = "between")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.f.rmanova(eta2 = 0.022,  n.levels = 2, n.rm = 2,
                                    power = 0.80, alpha = 0.05,
                                    corr.rm = 0.50, type = "within")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.f.rmanova(eta2 = 0.01,  n.levels = 2, n.rm = 2,
                                    power = 0.80, alpha = 0.05,
                                    corr.rm = 0.50, type = "interaction")

                    
                    
                    
                    
                    
                    
                    
                    
                    pwrss.f.rmanova(
                        eta2 = 0.10,
                        f2 = eta2 / (1 - eta2),
                        corr.rm = 0.50,
                        n.levels = 2,
                        n.rm = 2,
                        epsilon = 1,
                        alpha = 0.05,
                        type = c("between", "within", "interaction"),
                        n = NULL,
                        power = NULL,
                        verbose = TRUE
                    )



                    pwrss.f.rmanova <-
                        function (eta2 = 0.10,
                                  f2 = eta2 / (1 - eta2),
                                  corr.rm = 0.50,
                                  n.levels = 2,
                                  n.rm = 2,
                                  epsilon = 1,
                                  alpha = 0.05,
                                  type = c("between", "within", "interaction"),
                                  n = NULL,
                                  power = NULL,
                                  verbose = TRUE)


                            cat(
                                " One-way Repeated Measures \n Analysis of Variance (F test) \n",
                                "H0: eta2 = 0 (or f2 = 0) \n HA: eta2 > 0 (or f2 > 0) \n",
                                "------------------------------ \n",
                                "Number of levels (groups) =",
                                n.levels,
                                "\n",
                                "Number of repeated measurements =",
                                n.rm,
                                "\n",
                                "------------------------------ \n",
                                " Statistical power =",
                                round(power, 3),
                                "\n",
                                " Total n =",
                                ceiling(n),
                                "\n",
                                "------------------------------ \n",
                                "Type of the effect =",
                                dQuote(effect),
                                "\n",
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
