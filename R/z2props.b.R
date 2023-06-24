# This file is a generated template, your changes will not be overwritten

z2propsClass <-
    if (requireNamespace("jmvcore", quietly = TRUE)) {
        R6::R6Class(
            "z2propsClass",
            inherit = z2propsBase,
            private = list(
                .run = function() {
                  
					calculate <- self$options$calculate
                    p1 <- self$options$p1
                    p2 <- self$options$p2
                    alpha <- self$options$alpha
                    alternative <- self$options$alternative
					
					if (alternative %in% c("equivalent", "non-inferior", "superior"))) {
						margin <- self$options$margin
					} else {
						margin <- 0
					}
					
                    arcsintrans <- self$options$arcsintrans
					kappa <- self$options$kappa
					power <- NULL
                    n2 <- NULL
				

					if (calculate == "selectpower") {

                        n2 <- self$options$n2

                        results_1 <- pwrss::pwrss.z.2props(
                            p1 = p1,
                            p2 = p2,
                            alpha = alpha,
                            alternative = alternative,
                            arcsin.trans = arcsintrans,
							kappa = kappa,
                            n2 = n2,
                            margin = margin
                        )

                    }

                    if (calculate == "selectsamplesize") {
					
                        power <- self$options$power

                        results_1 <- pwrss::pwrss.z.2props(
                            p1 = p1,
                            p2 = p2,
                            alpha = alpha,
                            power = power,
                            alternative = alternative,
                            arcsin.trans = arcsintrans,
							kappa = kappa,
                            margin = margin
                        )

                    }



                    if (arcsintrans) {
                        results_2 <- paste0("Approach: Arcsin Transformation \n")
                    }

                    if (!arcsintrans) {
                        results_2 <- paste0("Approach: Normal Approximation \n")
                    }

					results_2 <- paste0(
                        results_2,
                        "The hypotheses are:", "\n",
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
                                ceiling(results_1[["n"]][[1]]),
                                "\n",
                                " n2 =",
                                ceiling(results_1[["n"]][[2]]),
                                "\n",
                                "------------------------------ \n",
                                "Alternative =",
                                sQuote(alternative),
                                "\n",
                                "Non-centrality parameter =",
                                ceiling(results_1[["ncp"]]),
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
