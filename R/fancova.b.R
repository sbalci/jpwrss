

# This file is a generated template, your changes will not be overwritten

fancovaClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "fancovaClass",
            inherit = fancovaBase,
            private = list(
                .run = function() {
                    
                    
                    calculate <- self$options$calculate
                    eta2 <- self$options$eta2
                    nway <- self$options$nway
					if (nway == "1") {nlevels <- self$options$nlevelsA}
					if (nway == "2") {nlevels <- c(self$options$nlevelsA, self$options$nlevelsB)}
					if (nway == "3") {nlevels <- c(self$options$nlevelsA, self$options$nlevelsB, self$options$nlevelsC)}
					covadj <- self$options$covadj
					ncov <- self$options$ncov
                    alpha <- self$options$alpha
                    power <- NULL
                    n <- NULL
					
					if (calculate == "selectpower") {

                       n <- self$options$n

                       results_1 <- pwrss::pwrss.f.ancova(
							eta2 = eta2,
							n.levels = nlevels,
							n.covariates = ncov,
							alpha = alpha,
							n = n
                    )

                    }

                    if (calculate == "selectsamplesize") {
                        
						power <- self$options$power

                        results_1 <- pwrss::pwrss.f.ancova(
							eta2 = eta2,
							n.levels = nlevels,
							n.covariates = ncov,
							alpha = alpha,
							power = power
                    )

                    }
					
                  

                    results_2 <- paste0(
                                " ",
                                switch(
                                    nway,
                                    `1` = "One",
                                    `2` = "Two",
                                    `3` = "Three"
                                ),
                                ifelse(
                                    covadj == true,
                                    "-way Analysis of Covariance (ANCOVA) \n ",
                                    "-way Analysis of Variance (ANOVA) \n "
                                ),
                                " H0: 'eta2' or 'f2' = 0 \n  HA: 'eta2' or 'f2' > 0 \n --------------------------------------\n",
                                switch(
                                    nway,
                                    `1` = c(" Factor A: ", nlevels, " levels \n"),
                                    `2` = c(
                                        " Factor A: ",
                                        nlevels[1],
                                        " levels \n",
                                        " Factor B: ",
                                        nlevels[2],
                                        " levels \n"
                                    ),
                                    `3` = c(
                                        " Factor A: ",
                                        nlevels[1],
                                        " levels \n",
                                        " Factor B: ",
                                        nlevels[2],
                                        " levels \n",
                                        " Factor C: ",
                                        nlevels[3],
                                        " levels \n"
                                    )
                                ),
                                " --------------------------------------\n",
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
                                "\n",
                                sep = ""
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
