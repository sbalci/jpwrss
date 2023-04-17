

# This file is a generated template, your changes will not be overwritten

zlogregClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "zlogregClass",
            inherit = zlogregBase,
            private = list(
                .run = function() {
                    
                    
                    pwrss.z.logreg(p0 = 0.15, p1 = 0.10, r2.other.x = 0.20,
                                   power = 0.80, alpha = 0.05,
                                   dist = "normal")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.logreg(p0 = 0.15, odds.ratio = 0.6296, r2.other.x = 0.20,
                                   alpha = 0.05, power = 0.80,
                                   dist = "normal")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.logreg(p0 = 0.15, beta1 = -0.4626, r2.other.x = 0.20,
                                   alpha = 0.05, power = 0.80,
                                   dist = "normal")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    dist.x <- list(dist = "normal", mean = 25, sd = 8)

                    pwrss.z.logreg(p0 = 0.15, beta1 = -0.4626, r2.other.x = 0.20,
                                   alpha = 0.05, power = 0.80,
                                   dist = dist.x)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.logreg(p0 = 0.15, beta1 = -0.4626, r2.other.x = 0.20,
                                   alpha = 0.05, power = 0.80,
                                   dist = "bernoulli")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    dist.x <- list(dist = "bernoulli", prob = 0.40)

                    pwrss.z.logreg(p0 = 0.15, beta1 = -0.4626, r2.other.x = 0.20,
                                   alpha = 0.05, power = 0.80,
                                   dist = dist.x)
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    pwrss.z.logreg(
                        p1 = 0.10,
                        p0 = 0.15,
                        odds.ratio = (p1 / (1 - p1)) / (p0 / (1 - p0)),
                        beta0 = log(p0 / (1 - p0)),
                        beta1 = log(odds.ratio),
                        n = NULL,
                        power = NULL,
                        r2.other.x = 0,
                        alpha = 0.05,
                        alternative = c("not equal", "less", "greater"),
                        method = c("demidenko(vc)", "demidenko", "hsieh"),
                        distribution = "normal",
                        verbose = TRUE
                    )
                    pwrss.z.logistic(
                        p1 = 0.10,
                        p0 = 0.15,
                        odds.ratio = (p1 / (1 - p1)) / (p0 / (1 - p0)),
                        beta0 = log(p0 / (1 - p0)),
                        beta1 = log(odds.ratio),
                        n = NULL,
                        power = NULL,
                        r2.other.x = 0,
                        alpha = 0.05,
                        alternative = c("not equal", "less", "greater"),
                        method = c("demidenko(vc)", "demidenko", "hsieh"),
                        distribution = "normal",
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
