# This file is a generated template, your changes will not be overwritten

t2meansdepClass <-
    if (requireNamespace("jmvcore", quietly = TRUE)) {
        R6::R6Class(
            "t2meansdepClass",
            inherit = t2meansdepBase,
            private = list(
                .run = function() {

					calculate <- self$options$calculate
					stdinput <- self$options$stdinput
					alternative <- self$options$alternative
						
					if(stdinput) {
						mu1 <- self$options$d
						mu2 <- 0
						sd1 <- 1
						sd2 <- 1
					} else {
						mu1 <- self$options$mu1
						mu2 <- self$options$mu2
						sd1 <- self$options$sd1
						sd2 <- self$options$sd2
					}
					
					if (alternative %in% c("equivalent", "non-inferior", "superior"))) {
						margin <- self$options$margin
					} else {
						margin <- 0
					}
					
					alpha <- self$options$alpha
					pairedr <- self$options$pairedr
					power <- NULL
					kappa <- self$options$kappa
					n <- NULL

					if (calculate == "selectpower") {

						n2 <- self$options$n2

						results_1 <- pwrss::pwrss.t.2means(
							mu1 = mu1,
							mu2 = mu2,
							sd1 = sd1,
							sd2 = sd2,
							paired = TRUE,
							paired.r = pairedr,
							alpha = alpha,
							alternative = alternative,
							n2 = n2,
							margin = margin
							)

					}

					if (calculate == "selectsamplesize") {

						power <- self$options$power

						results_1 <- pwrss::pwrss.t.2means(
							mu1 = mu1,
							mu2 = mu2,
							sd1 = sd1,
							sd2 = sd2,
							paired = TRUE,
							paired.r = pairedr,
							alpha = alpha,
							alternative = alternative,
							power = power,
							margin = margin
							)

					}



                    results_2 <-  paste0(
                        switch(alternative,
                            `not equal` = "H0: mu1 = mu2 \n HA: mu1 != mu2 \n",
                            `greater` = "H0: mu1 = mu2 \n HA: mu1 > mu2 \n",
                            `less` = "H0: mu1 = mu2 \n HA: mu1 < mu2 \n",
                            `non-inferior` = "H0: mu1 - mu2 <= margin \n HA: mu1 - mu2 > margin \n",
                            `superior` = "H0: mu1 - mu2 <= margin \n HA: mu1 - mu2 > margin \n",
                            `equivalent` = "H0: |mu1 - mu2| >= margin \n HA: |mu1 - mu2| < margin \n"
                        ),
                        "------------------------------ \n",
                        " Statistical power =",
                        round(as.numeric(results_1[["power"]]), 3),
                        "\n",
                        c(" n =", ceiling(results_1[["n"]])),
                        "\n",
                        "------------------------------ \n",
                        "Alternative =",
                        sQuote(alternative),
                        "\n",
                        "Degrees of freedom =",
                        round(as.numeric(results_1[["df"]]), 3),
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
