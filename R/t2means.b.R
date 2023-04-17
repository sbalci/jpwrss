

# This file is a generated template, your changes will not be overwritten

t2meansClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "t2meansClass",
            inherit = t2meansBase,
            private = list(
                .run = function() {
                    
                    design1 <- pwrss.t.2means(mu1 = 0.20, margin = -0.05, paired = TRUE,
                                              power = 0.80, alpha = 0.05,
                                              alternative = "non-inferior")
                    plot(design1)
                    
                    
                    
                    pwrss.t.2means(mu1 = 30, mu2 = 28, sd1 = 12, sd2 = 8, kappa = 1,
                                   n2 = 50, alpha = 0.05,
                                   alternative = "not equal")
                    
                    
                    pwrss.t.2means(mu1 = 30, mu2 = 28, sd1 = 12, sd2 = 8, kappa = 1,
                                   power = .80, alpha = 0.05,
                                   alternative = "not equal")
                                   
                                   
                                   pwrss.t.2means(mu1 = 30, mu2 = 28, sd1 = 10.198, kappa = 1,
                                                  power = .80, alpha = 0.05,
                                                  pwrss.t.2means(mu1 = 0.196, kappa = 1,
                                                                 power = .80, alpha = 0.05,
                                                                 alternative = "not equal")                               alternative = "not equal")
 
 
 
 pwrss.t.2means(mu1 = 0.1883, paired = TRUE, paired.r = 0.50,
                power = .80, alpha = 0.05,
                alternative = "not equal")
 
 
 
 pwrss.t.2means(mu1 = 30, mu2 = 28, sd1 = 12, sd2 = 8,
                margin = -1, power = 0.80,
                alternative = "non-inferior")
                
                pwrss.t.2means(mu1 = 30, mu2 = 28, sd1 = 12, sd2 = 8,
                               margin = 1, power = 0.80,
                               alternative = "superior")

                               pwrss.t.2means(mu1 = 30, mu2 = 30, sd1 = 12, sd2 = 8,
                                              margin = 1, power = 0.80,
                                              alternative = "equivalent")
                                              
                                              
 
                    
                    pwrss.t.2means(mu1 = 30, mu2 = 28, sd1 = 10.583,
                                   paired = TRUE, paired.r = 0.50,
                                   power = .80, alpha = 0.05,
                                   alternative = "not equal")
                    
                    
                    
                    pwrss.t.2means(
                        mu1,
                        mu2 = 0,
                        margin = 0,
                        sd1 = ifelse(paired, sqrt(1 / (2 * (
                            1 - paired.r
                        ))), 1),
                        sd2 = sd1,
                        kappa = 1,
                        paired = FALSE,
                        paired.r = 0.50,
                        alpha = 0.05,
                        welch.df = FALSE,
                        alternative = c(
                            "not equal",
                            "greater",
                            "less",
                            "equivalent",
                            "non-inferior",
                            "superior"
                        ),
                        n2 = NULL,
                        power = NULL,
                        verbose = TRUE
                    )
                    pwrss.z.2means(
                        mu1,
                        mu2 = 0,
                        sd1 = 1,
                        sd2 = sd1,
                        margin = 0,
                        kappa = 1,
                        alpha = 0.05,
                        alternative = c(
                            "not equal",
                            "greater",
                            "less",
                            "equivalent",
                            "non-inferior",
                            "superior"
                        ),
                        n2 = NULL,
                        power = NULL,
                        verbose = TRUE
                    )


                    pwrss.z.2means <-
                        function (mu1,
                                  mu2 = 0,
                                  sd1 = 1,
                                  sd2 = sd1,
                                  margin = 0,
                                  kappa = 1,
                                  alpha = 0.05,
                                  alternative = c("not equal",
                                                  "greater",
                                                  "less",
                                                  "equivalent",
                                                  "non-inferior",
                                                  "superior"),
                                  n2 = NULL,
                                  power = NULL,
                                  verbose = TRUE)


                    pwrss.t.2means <- function (mu1,
                                                mu2 = 0,
                                                margin = 0,
                                                sd1 = ifelse(paired, sqrt(1 / (2 *
                                                                                   (1 - paired.r))), 1),
                                                sd2 = sd1,
                                                kappa = 1,
                                                paired = FALSE,
                                                paired.r = 0.50,
                                                alpha = 0.05,
                                                welch.df = FALSE,
                                                alternative = c("not equal",
                                                                "greater",
                                                                "less",
                                                                "equivalent",
                                                                "non-inferior",
                                                                "superior"),
                                                n2 = NULL,
                                                power = NULL,
                                                verbose = TRUE)










                    cat(
                        " Difference between Two Means (Independent Samples z Test) \n",
                        switch(
                            hypothesis,
                            `not equal` = "H0: mu1 = mu2 \n HA: mu1 != mu2 \n",
                            `greater` = "H0: mu1 = mu2 \n HA: mu1 > mu2 \n",
                            `less` = "H0: mu1 = mu2 \n HA: mu1 < mu2 \n",
                            `non-inferior` = "H0: mu1 - mu2 <= margin \n HA: mu1 - mu2 > margin \n",
                            `superior` = "H0: mu1 - mu2 <= margin \n HA: mu1 - mu2 > margin \n",
                            `equivalent` = "H0: |mu1 - mu2| >= margin \n HA: |mu1 - mu2| < margin \n"
                        ),
                        "------------------------------ \n",
                        " Statistical power =",
                        round(power, 3),
                        "\n",
                        " n1 =",
                        ceiling(n1),
                        "\n",
                        " n2 =",
                        ceiling(n2),
                        "\n",
                        "------------------------------ \n",
                        "Alternative =",
                        dQuote(alternative),
                        "\n",
                        "Non-centrality parameter =",
                        round(ncp, 3),
                        "\n",
                        "Type I error rate =",
                        round(alpha, 3),
                        "\n",
                        "Type II error rate =",
                        round(1 - power, 3),
                        "\n"
                    )



                    cat(
                        ifelse(
                            paired,
                            " Difference between Two means \n (Paired Samples t Test) \n",
                            " Difference between Two means \n (Independent Samples t Test) \n"
                        ),
                        switch(
                            hypothesis,
                            `not equal` = "H0: mu1 = mu2 \n HA: mu1 != mu2 \n",
                            `greater` = "H0: mu1 = mu2 \n HA: mu1 > mu2 \n",
                            `less` = "H0: mu1 = mu2 \n HA: mu1 < mu2 \n",
                            `non-inferior` = "H0: mu1 - mu2 <= margin \n HA: mu1 - mu2 > margin \n",
                            `superior` = "H0: mu1 - mu2 <= margin \n HA: mu1 - mu2 > margin \n",
                            `equivalent` = "H0: |mu1 - mu2| >= margin \n HA: |mu1 - mu2| < margin \n"
                        ),
                        "------------------------------ \n",
                        " Statistical power =",
                        round(power, 3),
                        "\n",
                        if (paired) {
                            c(" n =", ceiling(n))
                        } else {
                            c(" n1 =", ceiling(n1), "\n  n2 =", ceiling(n2))
                        },
                        "\n",
                        "------------------------------ \n",
                        "Alternative =",
                        dQuote(alternative),
                        "\n",
                        "Degrees of freedom =",
                        round(df, 2),
                        "\n",
                        "Non-centrality parameter =",
                        round(ncp, 3),
                        "\n",
                        "Type I error rate =",
                        round(alpha, 3),
                        "\n",
                        "Type II error rate =",
                        round(1 - power, 3),
                        "\n"
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
