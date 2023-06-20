# This file is a generated template, your changes will not be overwritten

frmanovaClass <-
    if (requireNamespace("jmvcore", quietly = TRUE)) {
        R6::R6Class(
            "frmanovaClass",
            inherit = frmanovaBase,
            private = list(
                .run = function() {
                    
					calculate <- self$options$calculate
                    eta2 <- self$options$eta2
                    nlevels <- self$options$nlevels
					nrm <- self$options$nrm
					corrrm <- self$options$corrrm
					type <- self$options$type
					epsilon <- self$options$epsilon
                    alpha <- self$options$alpha
                    power <- NULL
                    n <- NULL
					
					
					if (calculate == "selectpower") {

                       n <- self$options$n

                       results_1 <- pwrss::pwrss.f.rmanova(
							eta2 = eta2,
							corr.rm = corrrm,
							n.levels = nlevels,
							n.rm = nrm,
							epsilon = epsilon,
							alpha = alpha,
							type = type,
							n = n
							)

                    }

                    if (calculate == "selectsamplesize") {
                        
						power <- self$options$power

                       results_1 <- pwrss::pwrss.f.rmanova(
							eta2 = eta2,
							corr.rm = corrrm,
							n.levels = nlevels,
							n.rm = nrm,
							epsilon = epsilon,
							alpha = alpha,
							type = type,
							power = power
							)

                    }
					
            
                    results_2 <- paste0(
                                "H0: eta2 = 0 (or f2 = 0) \n HA: eta2 > 0 (or f2 > 0) \n",
                                "------------------------------ \n",
                                "Number of levels (groups) =",
                                nlevels,
                                "\n",
                                "Number of repeated measurements =",
                                nrm,
                                "\n",
                                "------------------------------ \n",
                                " Statistical power =",
                                round(as.numeric(results_1[["power"]]), 3),
                                "\n",
                                " Total n =",
                                ceiling(results_1[["n"]]),
                                "\n",
                                "------------------------------ \n",
                                "Type of the effect =",
                                dQuote(type),
                                "\n",
                                "Numerator degrees of freedom =",
                                round(results_1[["df1"]], 3),
                                "\n",
                                "Denominator degrees of freedom =",
                                round(results_1[["df2"]], 3),
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
