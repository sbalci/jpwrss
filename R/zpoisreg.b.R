

# This file is a generated template, your changes will not be overwritten

zpoisregClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "zpoisregClass",
            inherit = zpoisregBase,
            private = list(
                .run = function() {
                    
                    
                    pwrss.z.poisreg(beta0 = 0.50, beta1 = -0.10,
                                    power = 0.80, alpha = 0.05,
                                    dist = "normal")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.poisreg(exp.beta0 = exp(0.50),
                                    exp.beta1 = exp(-0.10),
                                    power = 0.80, alpha = 0.05,
                                    dist = "normal")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    dist.x <- list(dist = "normal", mean = 25, sd = 8)

                    pwrss.z.poisreg(exp.beta0 = exp(0.50),
                                    exp.beta1 = exp(-0.10),
                                    alpha = 0.05, power = 0.80,
                                    dist = dist.x)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.poisreg(beta0 = 0.50, beta1 = -0.10,
                                    alpha = 0.05, power = 0.80,
                                    dist = "bernoulli")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.z.poisreg(exp.beta0 = exp(0.50),
                                    exp.beta1 = exp(-0.10),
                                    alpha = 0.05, power = 0.80,
                                    dist = "bernoulli")

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    dist.x <- list(dist = "bernoulli", prob = 0.40)

                    pwrss.z.poisreg(exp.beta0 = exp(0.50),
                                    exp.beta1 = exp(-0.10),
                                    alpha = 0.05, power = 0.80,
                                    dist = dist.x)
                    
                    
                    
                    
                    
                    
                    pwrss.z.poisreg(
                        exp.beta0 = 1.10,
                        exp.beta1 = 1.16,
                        beta0 = log(exp.beta0),
                        beta1 = log(exp.beta1),
                        mean.exposure = 1,
                        n = NULL,
                        power = NULL,
                        r2.other.x = 0,
                        alpha = 0.05,
                        alternative = c("not equal", "less", "greater"),
                        method = c("demidenko(vc)", "demidenko", "signorini"),
                        distribution = "normal",
                        verbose = TRUE
                    )
                    pwrss.z.poisson(
                        exp.beta0 = 1.10,
                        exp.beta1 = 1.16,
                        beta0 = log(exp.beta0),
                        beta1 = log(exp.beta1),
                        mean.exposure = 1,
                        n = NULL,
                        power = NULL,
                        r2.other.x = 0,
                        alpha = 0.05,
                        alternative = c("not equal", "less", "greater"),
                        method = c("demidenko(vc)", "demidenko", "signorini"),
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
