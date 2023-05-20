

# This file is a generated template, your changes will not be overwritten

zcorrClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "zcorrClass",
            inherit = zcorrBase,
            private = list(
                .run = function() {
                    
                    
                    
                  calculate <- self$options$calculate
                  r <- self$options$r
                  r0 <- self$options$r0
                  alpha <- self$options$alpha
                  power <- self$options$power
                  alternative <- self$options$alternative
                  n <- self$options$n




                  if (calculate == "selectpower") {
                    power <- NULL
                    n <- self$options$n


                    results_1 <- pwrss::pwrss.z.corr(
                      r = r,
                      r0 = r0,
                      alpha = alpha,
                      alternative = alternative,
                      n = n
                    )

                  }

                  if (calculate == "selectsamplesize") {
                    power <- self$options$power
                    n <- NULL


                    results_1 <- pwrss::pwrss.z.corr(
                      r = r,
                      r0 = r0,
                      alpha = alpha,
                      alternative = alternative,
                      power = power
                    )

                  }


                 

					results_2 <- cat(
                        "We test our expected correlation, r = ",  r , "\n",
                        " against a known correlation r0 = ", r0 , "\n",
                        "The hypotheses are:", "\n",
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
