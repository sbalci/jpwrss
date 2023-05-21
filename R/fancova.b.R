

# This file is a generated template, your changes will not be overwritten

fancovaClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "fancovaClass",
            inherit = fancovaBase,
            private = list(
                .run = function() {
                    
                    
                    
                    pwrss.f.ancova(eta2 = 0.059, n.levels = 2,
                                   power = .80, alpha = 0.05)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.f.ancova(eta2 = 0.048, n.levels = 2, n.cov = 1,
                                   alpha = 0.05, power = .80)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.f.ancova(eta2 = 0.03, n.levels = c(2,2),
                                   alpha = 0.05, power = 0.80)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.f.ancova(eta2 = 0.02, n.levels = c(2,2), n.cov = 1,
                                   alpha = 0.05, power = .80)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.f.ancova(eta2 = 0.02, n.levels = c(2,2,3),
                                   alpha = 0.05, power = 0.80)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.f.ancova(eta2 = 0.01, n.levels = c(2,2,3), n.cov = 1,
                                   alpha = 0.05, power = .80)
                                   
                                   
                                   
                                   
                    
                    
                    
                    design2 <- pwrss.f.ancova(eta2 = 0.10, n.levels = c(2,3),
                                              power = .80, alpha = 0.05)
                    plot(design2)
                    
                    
                    
                    
                    
                    
                    
                    pwrss.f.ancova(
                        eta2 = 0.01,
                        f2 = eta2 / (1 - eta2),
                        n.way = length(n.levels),
                        n.levels = 2,
                        n.covariates = 0,
                        alpha = 0.05,
                        n = NULL,
                        power = NULL,
                        verbose = TRUE
                    )










                    pwrss.f.ancova <-
                        function(eta2 = 0.01,
                                 f2 = eta2 / (1 - eta2),
                                 n.way = length(n.levels),
                                 n.levels = 2,
                                 n.covariates = 0,
                                 alpha = 0.05,
                                 n = NULL,
                                 power = NULL,
                                 verbose = TRUE)



                            paste0(
                                " ",
                                switch(
                                    n.way,
                                    `1` = "One",
                                    `2` = "Two",
                                    `3` = "Three"
                                ),
                                ifelse(
                                    n.covariates > 0,
                                    "-way Analysis of Covariance (ANCOVA) \n ",
                                    "-way Analysis of Variance (ANOVA) \n "
                                ),
                                " H0: 'eta2' or 'f2' = 0 \n  HA: 'eta2' or 'f2' > 0 \n --------------------------------------\n",
                                switch(
                                    n.way,
                                    `1` = c(" Factor A: ", n.levels, " levels \n"),
                                    `2` = c(
                                        " Factor A: ",
                                        n.levels[1],
                                        " levels \n",
                                        " Factor B: ",
                                        n.levels[2],
                                        " levels \n"
                                    ),
                                    `3` = c(
                                        " Factor A: ",
                                        n.levels[1],
                                        " levels \n",
                                        " Factor B: ",
                                        n.levels[2],
                                        " levels \n",
                                        " Factor C: ",
                                        n.levels[3],
                                        " levels \n"
                                    )
                                ),
                                " --------------------------------------\n",
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
