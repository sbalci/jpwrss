

# This file is a generated template, your changes will not be overwritten

zmedClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "zmedClass",
            inherit = zmedBase,
            private = list(
                .run = function() {
                    
                    calculate <- self$options$calculate
					predictor <- self$options$predictor
					stdinput <- self$options$stdinput
					a <- self$options$a
                    b <- self$options$b
					cp <- self$options$cp
					
					if(stdinput) {
						if(predictor == "binary") {
							p <- self$options$p
							sdx <- sqrt(p * (1 - p))
						} else {
							sdx <- 1
						}
						sdm <- 1
						sdy <- 1
					} else {
						if(predictor == "binary") {
							p <- self$options$p
							sdx <- sqrt(p * (1 - p))
						} else {
							sdx <- self$options$sdx
						}
						sdm <- self$options$sdm
						sdy <- self$options$sdy
					}
					
					r2y <- self$options$r2y
					alpha <- self$options$alpha
					alternative <- self$options$alternative
                    power <- NULL
                    n <- NULL
                    

                    if (calculate == "selectpower") {

                        n <- self$options$n
						
						results_1 <- pwrss::pwrss.z.med(
								a = a,
								b = b,
								cp = cp,
								sdx = sdx,
								sdm = sdm,
								sdy = sdy,
								r2m.x = 0,
								r2y.mx = r2y,
								alpha = alpha,
								alternative = alternative,
								n = n,
								mc = FALSE
								)
								
                    }




                    if (calculate == "selectsamplesize") {
                        
						power <- self$options$power

						results_1 <- pwrss::pwrss.z.med(
								a = a,
								b = b,
								cp = cp,
								sdx = sdx,
								sdm = sdm,
								sdy = sdy,
								r2m.x = 0,
								r2y.mx = r2y,
								alpha = alpha,
								alternative = alternative,
								power = power,
								mc = FALSE
								)

                    }
                    
                   


					results_2 <-  paste0(
						switch(alternative,
							`not equal` = "H0: a * b = 0 \n HA: a * b != 0 \n",
							`greater` = "H0: a * b <= 0 \n HA: a * b > 0 \n",
							`less` = "H0: a * b >= 0 \n HA: a * b < 0 \n"),
						"------------------------------ \n",
						" Statistical power (Sobel) =", round(as.numeric(results_1[["power"]][[1]]), 3), "\n",
						" n (Sobel) =",  ceiling(results_1[["n"]][[1]]), "\n",
						"------------------------------ \n",
						"Alternative =", sQuote(alternative),"\n",
						"Non-centrality parameter =", round(results_1[["ncp"]][[1]], 3), "\n",
						"Type I error rate =", round(as.numeric(alpha), 3), "\n",
						"Type II error rate =", round(1 - as.numeric(results_1[["power"]][[1]]), 3), "\n"
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
