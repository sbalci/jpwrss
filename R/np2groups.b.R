

# This file is a generated template, your changes will not be overwritten

np2groupsClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "np2groupsClass",
            inherit = np2groupsBase,
            private = list(
                .run = function() {
                    
                    
                    
                    pwrss.np.2groups(mu1 = 30, mu2 = 28, sd1 = 12, sd2 = 8, kappa = 1,
                                     power = .80, alpha = 0.05,
                                     alternative = "not equal")
                    
                    
                    
                    pwrss.np.2groups(mu1 = 30, mu2 = 28, sd1 = 12, sd2 = 8,
                                     paired = TRUE, paired.r = 0.50,
                                     power = .80, alpha = 0.05,
                                     alternative = "not equal")
                    
                    
                    
                    
                    pwrss.np.2groups(mu1 = 30, mu2 = 28, sd1 = 12, sd2 = 8,
                                     margin = -1, power = 0.80,
                                     alternative = "non-inferior")

                                     pwrss.np.2groups(mu1 = 30, mu2 = 28, sd1 = 12, sd2 = 8,
                                                      margin = 1, power = 0.80,
                                                      alternative = "superior")


                                     pwrss.np.2groups(mu1 = 30, mu2 = 30, sd1 = 12, sd2 = 8,
                                                      margin = 1, power = 0.80,
                                                      alternative = "equivalent")
                    
                    pwrss.np.2groups(
                        mu1 = 0.20,
                        mu2 = 0,
                        sd1 = ifelse(paired, sqrt(1 / (2 * (
                            1 - paired.r
                        ))), 1),
                        sd2 = sd1,
                        margin = 0,
                        alpha = 0.05,
                        paired = FALSE,
                        paired.r = 0.50,
                        kappa = 1,
                        n2 = NULL,
                        power = NULL,
                        alternative = c(
                            "not equal",
                            "greater",
                            "less",
                            "non-inferior",
                            "superior",
                            "equivalent"
                        ),
                        distribution = c(
                            "normal",
                            "uniform",
                            "double exponential",
                            "laplace",
                            "logistic"
                        ),
                        method = c("guenther", "noether"),
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
