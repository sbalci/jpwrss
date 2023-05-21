# This file is a generated template, your changes will not be overwritten

z2propsClass <-
    if (requireNamespace("jmvcore", quietly = TRUE)) {
        R6::R6Class(
            "z2propsClass",
            inherit = z2propsBase,
            private = list(
                .run = function() {
                    pwrss.z.2props(
                        p1 = 0.45, p2 = 0.50,
                        alpha = 0.05, power = 0.80,
                        alternative = "less",
                        arcsin.trans = FALSE
                    )
                    # arcsine transformation
                    pwrss.z.2props(
                        p1 = 0.45, p2 = 0.50,
                        alpha = 0.05, power = 0.80,
                        alternative = "less",
                        arcsin.trans = TRUE
                    )

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.2props(
                        p1 = 0.45, p2 = 0.50,
                        alpha = 0.05, power = 0.80,
                        alternative = "not equal"
                    )

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.2props(
                        p1 = 0.45, p2 = 0.50, margin = 0.01,
                        alpha = 0.05, power = 0.80,
                        alternative = "non-inferior"
                    )

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.2props(
                        p1 = 0.55, p2 = 0.50, margin = -0.01,
                        alpha = 0.05, power = 0.80,
                        alternative = "non-inferior"
                    )

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.2props(
                        p1 = 0.45, p2 = 0.50, margin = -0.01,
                        alpha = 0.05, power = 0.80,
                        alternative = "superior"
                    )

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.2props(
                        p1 = 0.55, p2 = 0.50, margin = 0.01,
                        alpha = 0.05, power = 0.80,
                        alternative = "superior"
                    )

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.2props(
                        p1 = 0.50, p2 = 0.50, margin = 0.01,
                        alpha = 0.05, power = 0.80,
                        alternative = "equivalent"
                    )









                    pwrss.z.2props(
                        p1,
                        p2,
                        margin = 0,
                        arcsin.trans = FALSE,
                        kappa = 1,
                        alpha = 0.05,
                        alternative = c(
                            "not equal",
                            "greater",
                            "less",
                            "equivalent",
                            "non-inferior",
                            "superior"
                        ),
                        n2 = NULL,
                        power = NULL,
                        verbose = TRUE
                    )





                    pwrss.z.2props <-
                        function(p1,
                                 p2,
                                 margin = 0,
                                 arcsin.trans = FALSE,
                                 kappa = 1,
                                 alpha = 0.05,
                                 alternative = c(
                                     "not equal",
                                     "greater",
                                     "less",
                                     "equivalent",
                                     "non-inferior",
                                     "superior"
                                 ),
                                 n2 = NULL,
                                 power = NULL,
                                 verbose = TRUE) {
                            paste0(
                                " Difference between Two Proportions \n (Independent Samples z Test) \n",
                                switch(alternative,
                                    `not equal` = "H0: p1 = p2 \n HA: p1 != p2 \n",
                                    `greater` = "H0: p1 = p2 \n HA: p1 > p2 \n",
                                    `less` = "H0: p1 = p2 \n HA: p1 < p2 \n",
                                    `non-inferior` = "H0: p1 - p2 <= margin \n HA: p1 - p2 > margin \n",
                                    `superior` = "H0: p1 - p2 <= margin \n HA: p1 - p2 > margin \n",
                                    `equivalent` = "H0: |p1 - p2| >= margin \n HA: |p1 - p2| < margin \n"
                                ),
                                "------------------------------ \n",
                                " Statistical power =",
                                round(as.numeric(results_1[["power"]]), 3),
                                "\n",
                                " n1 =",
                                ceiling(n1),
                                "\n",
                                " n2 =",
                                ceiling(n2),
                                "\n",
                                "------------------------------ \n",
                                "Alternative =",
                                dQuote(results_1[["parms"]][["alternative"]]),
                                "\n",
                                "Non-centrality parameter =",
                                round(lambda, 3),
                                "\n",
                                "Type I error rate =",
                                round(as.numeric(results_1[["parms"]][["alpha"]]), 3),
                                "\n",
                                "Type II error rate =",
                                round(1 - as.numeric(results_1[["power"]]), 3),
                                "\n"
                            )
                        }




                    # self$results$text1$setContent(print(results_1))

                    self$results$text2$setContent(print(results_2))


                    image <- self$results$plot
                    image$setState(results_1)
                },
                .plot = function(image, ggtheme, theme, ...) {
                    # read data ----

                    plotData <- image$state

                    plot <- plot(plotData)

                    print(plot)
                    TRUE
                }
            )
        )
    }
