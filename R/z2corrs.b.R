# This file is a generated template, your changes will not be overwritten

z2corrsClass <-
    if (requireNamespace("jmvcore", quietly = TRUE)) {
        R6::R6Class(
            "z2corrsClass",
            inherit = z2corrsBase,
            private = list(
                .run = function() {
                   

                  calculate <- self$options$calculate
                  r1 <- self$options$r1
                  r2 <- self$options$r2
                  alpha <- self$options$alpha
                  power <- NULL
                  alternative <- self$options$alternative
				  kappa <- self$options$kappa
                  n2 <- NULL
				  
				  if (calculate == "selectpower") {

                    n2 <- self$options$n2

                    results_1 <- pwrss::pwrss.z.2corrs(
                      r1 = r1,
                      r2 = r2,
                      alpha = alpha,
                      alternative = alternative,
					  kappa = kappa,
                      n2 = n2
                    )

                  }

                  if (calculate == "selectsamplesize") {
                    
					power <- self$options$power

                    results_1 <- pwrss::pwrss.z.2corrs(
                      r1 = r1,
                      r2 = r2,
                      alpha = alpha,
                      alternative = alternative,
					  kappa = kappa,
                      power = power
                    )

                  }


                  results_2 <- paste0(
                                switch(alternative,
                                    `not equal` = "H0: r1 = r2 \n HA: r1 != r2 \n",
                                    `greater` = "H0: r1 = r2 \n HA: r1 > r2 \n",
                                    `less` = "H0: r1 = r2 \n HA: r1 < r2 \n"
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
