

# This file is a generated template, your changes will not be overwritten

zmedClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "zmedClass",
            inherit = zmedBase,
            private = list(
                .run = function() {
                    
                    
                    
                    pwrss.z.med(a = 0.25, b = 0.25, cp = 0.10,
                                power = 0.80, alpha = 0.05)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    # base R-squared values are 0 (zero)
                    # do not specify 'cp'
                    pwrss.z.med(a = 0.25, b = 0.25,
                                r2m = 0, r2y = 0,
                                power = 0.80, alpha = 0.05)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    p <- 0.50 # proportion of subjects in one of the groups
                    pwrss.z.med(a = 0.25, b = 0.25, cp = 0.10,
                                sdx = sqrt(p*(1-p)),
                                power = 0.80, alpha = 0.05)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    # binary X
                    p <- 0.50 # proportion of subjects in one of the groups
                    pwrss.z.med(a = 0.25, b = 0.25, cp = 0.10,
                                sdx = sqrt(p*(1-p)),
                                n = 300, alpha = 0.05)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    # continuous X
                    pwrss.z.med(a = 0.25, b = 0.25, cp = 0.10,
                                r2m = 0.50, r2y = 0.50,
                                power = 0.80, alpha = 0.05)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    # binary X
                    p <- 0.50 # proportion of subjects in one of the groups
                    pwrss.z.med(a = 0.25, b = 0.25, cp = 0.10,
                                sdx = sqrt(p*(1-p)), r2y = 0.50,
                                power = 0.80, alpha = 0.05)
                    
                    
                    
                    
                    
                    
                    design3 <- pwrss.z.med(a = 0.10, b = 0.20, cp = 0.10,
                                           power = .80, alpha = 0.05)
                    plot(design3)
                    
                    
                    
                    
                    
                    
                    
                    
                    pwrss.z.med(
                        a,
                        b,
                        cp = 0,
                        sdx = 1,
                        sdm = 1,
                        sdy = 1,
                        r2m.x = a ^ 2 * sdx ^ 2 / sdm ^ 2,
                        r2y.mx = (b ^ 2 * sdm ^ 2 + cp ^ 2 * sdx ^ 2) / sdy ^
                            2,
                        n = NULL,
                        power = NULL,
                        alpha = 0.05,
                        alternative = c("not equal", "less", "greater"),
                        mc = TRUE,
                        nsims = 1000,
                        ndraws = 1000,
                        verbose = TRUE
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
