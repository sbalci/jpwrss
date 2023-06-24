

# This file is a generated template, your changes will not be overwritten

chisqgofitClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "chisqgofitClass",
            inherit = chisqgofitBase,
            private = list(
                .run = function() {
				
                    calculate <- self$options$calculate
					typeinput <- self$options$typeinput
					
					if(typeinput == "stdeff") {
						w <- self$options$w
						df <- self$options$df
					} else {
						p1 <- self$options$p1
					}
					
					alpha <- self$options$alpha
                    power <- NULL
                    n <- NULL
                    
                    
					if (calculate == "selectpower") {

                       n <- self$options$n
						
						if(typeinput == "stdeff") {
							results_1 <- pwrss::pwrss.chisq.gofit(
								w = w,
								df = df,
								alpha = alpha,
								n = n
								)
						} else {
							results_1 <- pwrss::pwrss.chisq.gofit(
								p1 = p1,
								alpha = alpha,
								n = n
								)
						}

								
                    }



                    if (calculate == "selectsamplesize") {
                        
						power <- self$options$power

						if(typeinput == "stdeff") {
							results_1 <- pwrss::pwrss.chisq.gofit(
								w = w,
								df = df,
								alpha = alpha,
								power = power
								)
						} else {
							results_1 <- pwrss::pwrss.chisq.gofit(
								p1 = p1,
								alpha = alpha,
								power = power
								)
						}

                    }
					
					
                    
                    results_2 <-  paste0(
						"H0: w = 0 \n HA: w > 0 \n",
						"------------------------------ \n",
						" Statistical power =", round(as.numeric(results_1[["power"]]), 3), "\n",
						" n =",  ceiling(results_1[["n"]]), "\n",
						"------------------------------ \n",
						"Alternative =", dQuote(alternative),"\n",
						"Non-centrality parameter =", round(results_1[["ncp"]], 3), "\n",
						"Type I error rate =", round(as.numeric(alpha), 3), "\n",
						"Type II error rate =", round(1 - as.numeric(results_1[["power"]]), 3), "\n"
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
