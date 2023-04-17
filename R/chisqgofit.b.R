

# This file is a generated template, your changes will not be overwritten

chisqgofitClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "chisqgofitClass",
            inherit = chisqgofitBase,
            private = list(
                .run = function() {
                    
                    
                    prob.mat <- c(0.28, 0.72)
                    pwrss.chisq.gofit(p1 = c(0.28, 0.72),
                                      p0 = c(0.50, 0.50),
                                      alpha = 0.05, power = 0.80)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.chisq.gofit(w = 0.44, df = 1,
                                      alpha = 0.05, power = 0.80)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    prob.mat <- rbind(c(0.056, 0.132),
                                      c(0.944, 0.868))
                    colnames(prob.mat) <- c("Girl", "Boy")
                    rownames(prob.mat) <- c("ADHD", "No ADHD")
                    prob.mat
                    pwrss.chisq.gofit(p1 = prob.mat,
                                      alpha = 0.05, power = 0.80)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.chisq.gofit(w = 0.1302134, df = 1,
                                      alpha = 0.05, power = 0.80)


                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    prob.mat <- cbind(c(0.6759, 0.1559, 0.1281, 0.0323, 0.0078),
                                      c(0.6771, 0.1519, 0.1368, 0.0241, 0.0101))
                    rownames(prob.mat) <- c("Normal", "Mild", "Moderate", "Severe", "Extremely Severe")
                    colnames(prob.mat) <- c("Female", "Male")
                    prob.mat
                    pwrss.chisq.gofit(p1 = prob.mat,
                                      alpha = 0.05, power = 0.80)

                    ## ---- message = FALSE, fig.width = 7, fig.height = 5, results = TRUE----------
                    pwrss.chisq.gofit(w = 0.03022008, df = 4,
                                      alpha = 0.05, power = 0.80)

                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    pwrss.chisq.gofit(
                        p1 = c(0.50, 0.50),
                        p0 = .chisq.fun(p1)$p0,
                        w = .chisq.fun(p1)$w,
                        df = .chisq.fun(p1)$df,
                        n = NULL,
                        power = NULL,
                        alpha = 0.05,
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
