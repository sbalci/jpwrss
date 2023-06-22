# This file is a generated template, your changes will not be overwritten

t2meansindepClass <-
    if (requireNamespace("jmvcore", quietly = TRUE)) {
        R6::R6Class(
            "t2meansindepClass",
            inherit = t2meansindepBase,
            private = list(
                .run = function() {
                    
					calculate <- self$options$calculate
					mu1 <- self$options$mu1
					mu2 <- self$options$mu2
					sd1 <- self$options$sd1
					sd2 <- self$options$sd2
					alpha <- self$options$alpha
					power <- NULL
					alternative <- self$options$alternative
					margin <- self$options$margin
					kappa <- self$options$kappa
					n2 <- NULL
					
					if (calculate == "selectpower") {

						n <- self$options$n

						results_1 <- pwrss::pwrss.t.2means(
							mu1 = mu1,
							mu2 = mu2,
							sd1 = sd1,
							sd2 = sd2,
							paired = FALSE,
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
							paired = FALSE,
							alpha = alpha,
							alternative = alternative,
							power = power,
							margin = margin
							)

					}

                          

                    results_2 <-  paste0(
                        switch(alternative,
                            ,
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
                           c(" n1 =", ceiling(results_1[["n"]][[1]]),
							"\n  n2 =", ceiling(results_1[["n"]][[2]])),
                        "\n",
                        "------------------------------ \n",
                        "Alternative =",
                        dQuote(results_1[["parms"]][["alternative"]]),
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