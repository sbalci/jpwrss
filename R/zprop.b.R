#' @title One Proportion z test
#' @importFrom R6 R6Class
#' @import jmvcore
#'

# This file is a generated template, your changes will not be overwritten

zpropClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "zpropClass",
            inherit = zpropBase,
            private = list(
                .run = function() {
                    
                    
                    
                    
                    
                    
                    calculate <- self$options$calculate
                    p <- self$options$p
                    p0 <- self$options$p0
                    alpha <- self$options$alpha
                    power <- self$options$power
                    alternative <- self$options$alternative
                    arcsin.trans <- self$options$arcsin.trans
                    margin <- self$options$margin
                    n <- self$options$n




                    if (calculate == "selectpower") {
                        power <- NULL
                        n <- self$options$n


                        results_1 <- pwrss::pwrss.z.prop(
                            p = p,
                            p0 = p0,
                            alpha = alpha,
                            alternative = alternative,
                            arcsin.trans = arcsin.trans,
                            n = n,
                            margin = margin
                        )

                    }

                    if (calculate == "selectsamplesize") {
                        power <- self$options$power
                        n <- NULL


                        results_1 <- pwrss::pwrss.z.prop(
                            p = p,
                            p0 = p0,
                            alpha = alpha,
                            power = power,
                            alternative = alternative,
                            arcsin.trans = arcsin.trans,
                            margin = margin
                        )

                    }



                    if (arcsin.trans) {
                        results_2 <- paste0("Approach: Arcsin Transformation \n")
                    }

                    if (!arcsin.trans) {
                        results_2 <- paste0("Approach: Normal Approximation \n")
                    }

                    results_2 <- paste0(
                        results_2,
                        "A Proportion against a Constant (z Test) \n",
                        "We test our expected proportion, p = ",
                        p ,
                        " against known proportion p0 = ",
                        p0 ,
                        "\n",
                        "The hypotheses are:",
                        "\n",
                        switch(
                            alternative,
                            `not equal` = paste0(
                                " H0: p = p0 \n HA: p != p0 \n",
                                " H0: ",
                                p,
                                " = ",
                                p,
                                "\n HA: ",
                                p,
                                "!= ",
                                p0,
                                "\n"
                            ),
                            `greater` = paste0(
                                " H0: p = p0 \n HA: p > p0 \n",
                                " H0: ",
                                p,
                                " = ",
                                p0,
                                "\n HA: ",
                                p,
                                " > ",
                                p0,
                                "\n"
                            ),
                            `less` = paste0(
                                " H0: p = p0 \n HA: p < p0 \n",
                                " H0: ",
                                p,
                                " = ",
                                p0,
                                " \n HA: ",
                                p,
                                " < ",
                                p0,
                                " \n"
                            ),
                            `non-inferior` = paste0(
                                " H0: p - p0 <= margin \n HA: p - p0 > margin \n",
                                " H0: ",
                                p,
                                " - ",
                                p0,
                                " <= ",
                                margin,
                                "\n HA: ",
                                p,
                                " - ",
                                p0,
                                " > ",
                                margin,
                                "\n"
                            ),
                            `superior` = paste0(
                                " H0: p - p0 <= margin \n HA: p - p0 > margin \n",
                                " H0: ",
                                p,
                                " - ",
                                p0,
                                " <= ",
                                margin,
                                "\n HA: ",
                                p,
                                " - ",
                                p0,
                                " > ",
                                margin,
                                "\n"
                            ),
                            `equivalent` = paste0(
                                " H0: |p - p0| >= margin \n HA: |p - p0| < margin \n",
                                " H0: |",
                                p,
                                " - ",
                                p0,
                                "| >= ",
                                margin,
                                "\n HA: |",
                                p,
                                " - ",
                                p0,
                                "| < ",
                                margin,
                                "\n"
                            )
                        ),
                        "------------------------------ \n",
                        " Statistical power = ",
                        round(as.numeric(results_1[["power"]]), 3),
                        "\n",
                        " n = ",
                        ceiling(results_1[["n"]]),
                        "\n",
                        "------------------------------ \n",
                        "Alternative Hypothesis is ",
                        dQuote(results_1[["parms"]][["alternative"]]),
                        "\n",
                        "Non-centrality parameter = ",
                        round(as.numeric(results_1[["ncp"]]), 3),
                        "\n",
                        "Type I error rate = ",
                        round(as.numeric(results_1[["parms"]][["alpha"]]), 3),
                        "\n",
                        "Type II error rate = ",
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
