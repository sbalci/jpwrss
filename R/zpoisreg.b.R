

# This file is a generated template, your changes will not be overwritten

zpoisregClass <-
    if (requireNamespace('jmvcore', quietly = TRUE))
        R6::R6Class(
            "zpoisregClass",
            inherit = zpoisregBase,
            private = list(
                .run = function() {
                    
					calculate <- self$options$calculate
					typeinput <- self$options$typeinput
                    beta1 <- self$options$beta1
                    beta0 <- self$options$beta0
					exp.beta1 <- self$options$expbeta1
                    exp.beta0 <- self$options$expbeta0
					mean.exposure <- self$options$meanexposure
					r2.other.x <- self$options$r2otherx
					alternative <- self$options$alternative
					distribution <- self$options$distribution
					mean <- self$options$mean
					sd <- self$options$sd
					meanlog <- self$options$meanlog
					sdlog <- self$options$sdlog
					min <- self$options$min
					max <- self$options$max
					size <- self$options$size
					prob <- self$options$prob
					lambda <- self$options$lambda
					rate <- self$options$rate
                    alpha <- self$options$alpha
                    power <- NULL
                    n <- NULL
					
					
					if(distribution == "normal") {dist <- list(dist = "normal", mean = mean, sd = sd)} 
					if(distribution == "poisson") {dist <- list(dist = "poisson", lambda = lambda)} 
					if(distribution == "uniform") {dist <- list(dist = "uniform", min = min, max = max)} 
					if(distribution == "exponential") {dist <- list(dist = "exponential", rate = rate)} 
					if(distribution == "binomial") {dist <- list(dist = "binomial", size = size, prob = prob)} 
					if(distribution == "bernoulli") {dist <- list(dist = "bernoulli", prob = prob)} 
					if(distribution == "lognormal") {dist <- list(dist = "lognormal", meanlog = meanlog, sdlog = sdlog)} 
                    
					
					
					
					if (calculate == "selectpower") {

                       n <- self$options$n
						
						if(typeinput == "rateratio") { 
							results_1 <- pwrss::pwrss.z.poisreg(
							exp.beta0 = exp.beta0,
							exp.beta1 = exp.beta1,
							mean.exposure = 1,
							r2.other.x = r2.other.x,
							alpha = alpha,
							alternative = alternative,
							distribution = dist,
							n = n
							)
						} else if(typeinput == "regcoef") {
							results_1 <- pwrss::pwrss.z.poisreg(
							beta0 = beta0,
							beta1 = beta1,
							mean.exposure = 1,
							r2.other.x = r2.other.x,
							alpha = alpha,
							alternative = alternative,
							distribution = dist,
							n = n
							)
						} 


                    }




                    if (calculate == "selectsamplesize") {
                        
						power <- self$options$power

						if(typeinput == "rateratio") { 
							results_1 <- pwrss::pwrss.z.poisreg(
							exp.beta0 = exp.beta0,
							exp.beta1 = exp.beta1,
							mean.exposure = 1,
							r2.other.x = r2.other.x,
							alpha = alpha,
							alternative = alternative,
							distribution = dist,
							power = power
							)
						} else if(typeinput == "regcoef") {
							results_1 <- pwrss::pwrss.z.poisreg(
							beta0 = beta0,
							beta1 = beta1,
							mean.exposure = 1,
							r2.other.x = r2.other.x,
							alpha = alpha,
							alternative = alternative,
							distribution = dist,
							power = power
							)
						}

                    }
                    
                    
       
				   results_2 <-  paste0(
						switch(alternative,
							`not equal` = "H0: beta1 = 0 \n HA: beta1 != 0 \n",
							`greater` = "H0: beta1 = 0 \n HA: beta1 > 0 \n",
							`less` = "H0: beta1 = 0 \n HA: beta1 < 0 \n"),
						"Distribution of X =", sQuote(tolower(distribution)), "\n",
						"------------------------------ \n",
						" Statistical power =", round(1 - as.numeric(results_1[["power"]]), 3), "\n",
						" n =",  ceiling(results_1[["n"]]), "\n",
						"------------------------------ \n",
						"Alternative =", dQuote(alternative),"\n",
						"Non-centrality parameter =", round(results_1[["ncp"]], 3), "\n",
						"Type I error rate =", round(as.numeric(results_1[["power"]]), 3), "\n",
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
