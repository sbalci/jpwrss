

# This file is a generated template, your changes will not be overwritten

zcorrClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "zcorrClass",
            inherit = zcorrBase,
            private = list(
                .run = function() {
                    
                    
                    
                    pwrss.z.corr(r = 0.20, r0 = 0.10,
                                 power = 0.80, alpha = 0.05,
                                 alternative = "greater")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.corr(r = 0.20, r0 = 0,
                                 power = 0.80, alpha = 0.05,
                                 alternative = "not equal")
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    pwrss.z.corr(
                        r = 0.50,
                        r0 = 0,
                        alpha = 0.05,
                        alternative = c("not equal", "greater", "less"),
                        n = NULL,
                        power = NULL,
                        verbose = TRUE
                    )

                    pwrss.z.cor <-
                        pwrss.z.corr <- function (r = 0.50,
                                                  r0 = 0,
                                                  alpha = 0.05,
                                                  alternative = c("not equal", "greater", "less"),
                                                  n = NULL,
                                                  power = NULL,
                                                  verbose = TRUE)

















                    cat(
                        " A Correlation against a Constant (z Test) \n",
                        switch(
                            hypothesis,
                            `not equal` = "H0: r = r0 \n HA: r != r0 \n",
                            `greater` = "H0: r = r0 \n HA: r > r0 \n",
                            `less` = "H0: r = r0 \n HA: r < r0 \n"
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
