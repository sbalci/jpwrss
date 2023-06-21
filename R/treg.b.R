# This file is a generated template, your changes will not be overwritten

tregClass <-
    if (requireNamespace("jmvcore", quietly = TRUE)) {
        R6::R6Class(
            "tregClass",
            inherit = tregBase,
            private = list(
                .run = function() {

					calculate <- self$options$calculate
					predictor <- self$options$predictor
					stdinput <- self$options$stdinput
                    beta1 <- self$options$beta1
                    beta0 <- self$options$beta0
					k <- self$options$k
					r2 <- self$options$r2
					alternative <- self$options$alternative
						
					if (stdinput) {
						if (predictor == "binary") {
							p <- self$options$p
							sdx <- sqrt(p * (1 - p))
						} else {
							sdx <- 1
						}
						sdy <- 1
					} else {
						if (predictor == "binary") {
							p <- self$options$p
							sdx <- sqrt(p * (1 - p))
						} else {
							sdx <- self$options$sdx
						}
						sdy <- self$options$sdy
					}

					if (alternative %in% c("equivalent", "non-inferior", "superior"))) {
							margin <- self$options$margin
						} else {
							margin <- 0
						}
						
                    alpha <- self$options$alpha
                    power <- NULL
                    n <- NULL

					if (calculate == "selectpower") {

                       n <- self$options$n

                       results_1 <- pwrss::pwrss.t.reg(
							beta1 = beta1,
							beta0 = beta0,
							margin = margin,
							sdx = sdx,
							sdy = sdy,
							k = k,
							r2 = r2,
							alpha = alpha,
							n = n,
							alternative = alternative
						)

                    }

                    if (calculate == "selectsamplesize") {

						power <- self$options$power

                       results_1 <- pwrss::pwrss.t.reg(
							beta1 = beta1,
							beta0 = beta0,
							margin = margin,
							sdx = sdx,
							sdy = sdy,
							k = k,
							r2 = r2,
							alpha = alpha,
							power = power,
							alternative = alternative
						)

                    }

					results_2 <-  paste0(
                                switch(alternative,
                                    `not equal` = "H0: beta1 = beta0 \n HA: beta1 != beta0 \n",
                                    `greater` = "H0: beta1 = beta0 \n HA: beta1 > beta0 \n",
                                    `less` = "H0: beta1 = beta0 \n HA: beta1 < beta0 \n",
                                    `non-inferior` = ifelse(
                                        beta1 > beta0,
                                        "H0: beta1 - beta0 <= margin \n HA: beta1 - beta0 > margin \n",
                                        "H0: beta1 - beta0 >= margin \n HA: beta1 - beta0 < margin \n"
                                    ),
                                    `superior` = ifelse(
                                        beta1 > beta0,
                                        "H0: beta1 - beta0 <= margin \n HA: beta1 - beta0 > margin \n",
                                        "H0: beta1 - beta0 >= margin \n HA: beta1 - beta0 < margin \n"
                                    ),
                                    `equivalent` = "H0: |beta1 - beta0| >= margin \n HA: |beta1 - beta0| < margin \n"
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
                                dQuote(alternative),
                                "\n",
                                "Degrees of freedom =",
                                 round(results_1[["df"]], 3),
                                "\n",
                                "Non-centrality parameter =",
                                 round(results_1[["ncp"]], 3),
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

