

# This file is a generated template, your changes will not be overwritten

tregClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "tregClass",
            inherit = tregBase,
            private = list(
                .run = function() {
                    
                    
                    pwrss.t.reg(beta1 = 0.20, k = 3, r2 = 0.30,
                                power = .80, alpha = 0.05, alternative = "not equal")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.t.reg(beta1 = 0.60, sdy = 12, sdx = 4, k = 3, r2 = 0.30,
                                power = .80, alpha = 0.05, alternative = "not equal")


                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    p <- 0.50
                    pwrss.t.reg(beta1 = 0.20, k = 3, r2 = 0.30, sdx = sqrt(p*(1-p)),
                                power = .80, alpha = 0.05, alternative = "not equal")


                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    p <- 0.50
                    pwrss.t.reg(beta1 = 0.20, beta0 = 0.10, margin = -0.05,
                                k = 3, r2 = 0.30, sdx = sqrt(p*(1-p)),
                                power = .80, alpha = 0.05, alternative = "non-inferior")


                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    p <- 0.50
                    pwrss.t.reg(beta1 = 0.20, beta0 = 0.10, margin = 0.05,
                                k = 3, r2 = 0.30, sdx = sqrt(p*(1-p)),
                                power = .80, alpha = 0.05, alternative = "superior")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    p <- 0.50
                    pwrss.t.reg(beta1 = 0.20, beta0 = 0.20, margin = 0.05,
                                k = 3, r2 = 0.30, sdx = sqrt(p*(1-p)),
                                power = .80, alpha = 0.05, alternative = "equivalent")
                    
                    
                    
                    
                    
                    
                    
                    
                    pwrss.t.reg(
                        beta1 = 0.25,
                        beta0 = 0,
                        margin = 0,
                        sdx = 1,
                        sdy = 1,
                        k = 1,
                        r2 = (beta1 * sdx / sdy) ^ 2,
                        alpha = 0.05,
                        n = NULL,
                        power = NULL,
                        alternative = c(
                            "not equal",
                            "less",
                            "greater",
                            "non-inferior",
                            "superior",
                            "equivalent"
                        ),
                        verbose = TRUE
                    )
                    pwrss.z.reg(
                        beta1 = 0.25,
                        beta0 = 0,
                        margin = 0,
                        sdx = 1,
                        sdy = 1,
                        k = 1,
                        r2 = (beta1 * sdx / sdy) ^ 2,
                        alpha = 0.05,
                        n = NULL,
                        power = NULL,
                        alternative = c(
                            "not equal",
                            "less",
                            "greater",
                            "non-inferior",
                            "superior",
                            "equivalent"
                        ),
                        verbose = TRUE
                    )





                    pwrss.t.regression <-
                        pwrss.t.reg <- function (beta1 = 0.25,
                                                 beta0 = 0,
                                                 margin = 0,
                                                 sdx = 1,
                                                 sdy = 1,
                                                 k = 1,
                                                 r2 = (beta1 * sdx / sdy) ^ 2,
                                                 alpha = 0.05,
                                                 n = NULL,
                                                 power = NULL,
                                                 alternative = c("not equal",
                                                                 "less",
                                                                 "greater",
                                                                 "non-inferior",
                                                                 "superior",
                                                                 "equivalent"),
                                                 verbose = TRUE)

                    cat(
                        " Linear Regression Coefficient (t Test) \n",
                        switch(
                            alternative,
                            `not equal` = "H0: beta1 = beta0 \n HA: beta1 != beta0 \n",
                            `greater` = "H0: beta1 = beta0 \n HA: beta1 > beta0 \n",
                            `less` = "H0: beta1 = beta0 \n HA: beta1 < beta0 \n",
                            `non-inferior` = ifelse(
                                beta1 > beta0,
                                "H0: beta1 - beta0 <= margin \n HA: beta1 - beta0 > margin \n",
                                "H0: beta1 - beta0 >= margin \n HA: beta1 - beta0 < margin \n"
                            ),
                            `superior` = ifelse(
                                beta1 > beta0,
                                "H0: beta1 - beta0 <= margin \n HA: beta1 - beta0 > margin \n",
                                "H0: beta1 - beta0 >= margin \n HA: beta1 - beta0 < margin \n"
                            ),
                            `equivalent` = "H0: |beta1 - beta0| >= margin \n HA: |beta1 - beta0| < margin \n"
                        ),
                        "------------------------------ \n",
                        " Statistical power =",
                        round(power, 3),
                        "\n",
                        " n =",
                        ceiling(n),
                        "\n",
                        "------------------------------ \n",
                        "Alternative =",
                        dQuote(alternative),
                        "\n",
                        "Degrees of freedom =",
                        round(v, 3),
                        "\n",
                        "Non-centrality parameter =",
                        round(lambda, 3),
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
