

# This file is a generated template, your changes will not be overwritten

tmeanClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "tmeanClass",
            inherit = tmeanBase,
            private = list(
                .run = function() {
                    pwrss.t.mean(
                        mu,
                        sd = 1,
                        mu0 = 0,
                        margin = 0,
                        alpha = 0.05,
                        alternative = c(
                            "not equal",
                            "greater",
                            "less",
                            "equivalent",
                            "non-inferior",
                            "superior"
                        ),
                        n = NULL,
                        power = NULL,
                        verbose = TRUE
                    )
                    pwrss.z.mean(
                        mu,
                        sd = 1,
                        mu0 = 0,
                        margin = 0,
                        alpha = 0.05,
                        alternative = c(
                            "not equal",
                            "greater",
                            "less",
                            "equivalent",
                            "non-inferior",
                            "superior"
                        ),
                        n = NULL,
                        power = NULL,
                        verbose = TRUE
                    )



                    pwrss.z.mean <-
                        function (mu,
                                  sd = 1,
                                  mu0 = 0,
                                  margin = 0,
                                  alpha = 0.05,
                                  alternative = c("not equal",
                                                  "greater",
                                                  "less",
                                                  "equivalent",
                                                  "non-inferior",
                                                  "superior"),
                                  n = NULL,
                                  power = NULL,
                                  verbose = TRUE)

                    pwrss.t.mean <-
                        function (mu,
                                  sd = 1,
                                  mu0 = 0,
                                  margin = 0,
                                  alpha = 0.05,
                                  alternative = c("not equal",
                                                  "greater",
                                                  "less",
                                                  "equivalent",
                                                  "non-inferior",
                                                  "superior"),
                                  n = NULL,
                                  power = NULL,
                                  verbose = TRUE)



                    cat(
                        " A Mean against a Constant (z Test) \n",
                        switch(
                            hypothesis,
                            `not equal` = "H0: mu = mu0 \n HA: mu != mu0 \n",
                            `greater` = "H0: mu = mu0 \n HA: mu > mu0 \n",
                            `less` = "H0: mu = mu0 \n HA: mu < mu0 \n",
                            `non-inferior` = "H0: mu - mu0 <= margin \n HA: mu - mu0 > margin \n",
                            `superior` = "H0: mu - mu0 <= margin \n HA: mu - mu0 > margin \n",
                            `equivalent` = "H0: |mu - mu0| >= margin \n HA: |mu - mu0| < margin \n"
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



                    cat(
                        " A Mean against a Constant (t Test) \n",
                        switch(
                            hypothesis,
                            `not equal` = "H0: mu = mu0 \n HA: mu != mu0 \n",
                            `greater` = "H0: mu = mu0 \n HA: mu > mu0 \n",
                            `less` = "H0: mu = mu0 \n HA: mu < mu0 \n",
                            `non-inferior` = "H0: mu - mu0 <= margin \n HA: mu - mu0 > margin \n",
                            `superior` = "H0: mu - mu0 <= margin \n HA: mu - mu0 > margin \n",
                            `equivalent` = "H0: |mu - mu0| >= margin \n HA: |mu - mu0| < margin \n"
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
                        "Degrees of freedom =",
                        round(ceiling(n) - 1, 3),
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
