# This file is a generated template, your changes will not be overwritten

fregClass <-
    if (requireNamespace("jmvcore", quietly = TRUE)) {
        R6::R6Class(
            "fregClass",
            inherit = fregBase,
            private = list(
                .run = function() {
                    
					calculate <- self$options$calculate
                    r2 <- self$options$r2
                    k <- self$options$k
					if(type == "rsqdev") {m <- k}
					if(type == "rsqdif") {m <- self$options$m}
                    alpha <- self$options$alpha
                    power <- NULL
                    alternative <- self$options$alternative
                    n <- NULL
					
					 if (calculate == "selectpower") {

                       n <- self$options$n

                       results_1 <- pwrss::pwrss.f.reg(
							r2 = r2,
							k = k,
							m = m,
							alpha = alpha,
							n = n
						)

                    }

                    if (calculate == "selectsamplesize") {
                        
						power <- self$options$power

                        results_1 <- pwrss::pwrss.f.reg(
							r2 = r2,
							k = k,
							m = m,
							alpha = alpha,
							power = power
						)

                    }


                    results_2 <- paste0(
                                ifelse(
                                    m == k,
                                    " Linear Regression (F test) \n R-squared Deviation from 0 (zero) \n",
                                    " Hierarchical Linear Regression (F test) \n R-squared Change \n"
                                ),
                                "H0: r2 = 0 \n HA: r2 > 0 \n",
                                "------------------------------ \n",
                                " Statistical power =",
                                round(as.numeric(results_1[["power"]]), 3),
                                "\n",
                                " n =",
                                ceiling(results_1[["n"]]),
                                "\n",
                                "------------------------------ \n",
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
