

# This file is a generated template, your changes will not be overwritten

tmeanClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "tmeanClass",
            inherit = tmeanBase,
            private = list(
                .run = function() {

                  calculate <- self$options$calculate
                  mu <- self$options$mu
                  mu0 <- self$options$mu0
                  alpha <- self$options$alpha
                  power <- NULL
                  alternative <- self$options$alternative
                  margin <- self$options$margin
                  n <- NULL

                  if (calculate == "selectpower") {

                    n <- self$options$n


                    results_1 <- pwrss::pwrss.t.mean(
                      mu = mu,
                      mu0 = mu0,
                      alpha = alpha,
                      alternative = alternative,
                      n = n,
                      margin = margin
                    )

                  }

                  if (calculate == "selectsamplesize") {
                    power <- self$options$power


                    results_1 <- pwrss::pwrss.t.mean(
                      mu = mu,
                      mu0 = mu0,
                      alpha = alpha,
                      alternative = alternative,
                      power = power,
                      margin = margin
                    )

                  }


                  results_2 <- paste0(
                        "We test our expected mean, mu = ",  mu , "\n",
                        " against a known mean mu0 = ", mu0 , "\n",
                        "The hypotheses are:", "\n",
                        switch(
                            alternative,
                            `not equal` = "H0: mu = mu0 \n HA: mu != mu0 \n",
                            `greater` = "H0: mu = mu0 \n HA: mu > mu0 \n",
                            `less` = "H0: mu = mu0 \n HA: mu < mu0 \n",
                            `non-inferior` = "H0: mu - mu0 <= margin \n HA: mu - mu0 > margin \n",
                            `superior` = "H0: mu - mu0 <= margin \n HA: mu - mu0 > margin \n",
                            `equivalent` = "H0: |mu - mu0| >= margin \n HA: |mu - mu0| < margin \n"
                        ),
                        "------------------------------ \n",
                        " Statistical power =",
                        round(as.numeric(results_1[["power"]]), 3),
                        "\n",
                        " n =",
                        ceiling(results_1[["n"]]),
                        "\n",
                        "------------------------------ \n",
                        "Alternative =",
                        dQuote(results_1[["parms"]][["alternative"]]),
                        "\n",
                        "Non-centrality parameter =",
                        round(as.numeric(results_1[["ncp"]]), 3),
                        "\n",
                        "Type I error rate =",
                        round(as.numeric(results_1[["parms"]][["alpha"]]), 3),
                        "\n",
                        "Type II error rate =",
                        round(1 - as.numeric(results_1[["power"]]), 3),
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
