#' @title One Proportion z test
#' @importFrom R6 R6Class
#' @import jmvcore
#'

# This file is a generated template, your changes will not be overwritten

zpropClass <- if (requireNamespace('jmvcore', quietly=TRUE)) R6::R6Class(
    "zpropClass",
    inherit = zpropBase,
    private = list(
        .run = function() {

            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)


            # pwrss.z.prop <- function (p,
            #                           p0 = 0,
            #                           margin = 0,
            #                           arcsin.trans = FALSE,
            #                           alpha = 0.05,
            #                           alternative = c("not equal",
            #                                           "greater",
            #                                           "less",
            #                                           "equivalent",
            #                                           "non-inferior",
            #                                           "superior"),
            #                           n = NULL,
            #                           power = NULL,
            #                           verbose = TRUE
            #                           )



                results_1 <- pwrss::pwrss.z.prop(p = 0.45, p0 = 0.50,
                             alpha = 0.05, power = 0.80,
                             alternative = "less",
                             arcsin.trans = FALSE)


                results_2 <-
                    paste0(
                        "Approach: Normal Approximation \n",
                        "A Proportion against a Constant (z Test) \n",
                    switch(results_1[["parms"]][["alternative"]],
                           `not equal` = " H0: p = p0 \n HA: p != p0 \n",
                           `greater` = " H0: p = p0 \n HA: p > p0 \n",
                           `less` = " H0: p = p0 \n HA: p < p0 \n",
                           `non-inferior` = " H0: p - p0 <= margin \n HA: p - p0 > margin \n",
                           `superior` = " H0: p - p0 <= margin \n HA: p - p0 > margin \n",
                           `equivalent` = " H0: |p - p0| >= margin \n HA: |p - p0| < margin \n"),
                    "------------------------------ \n",
                    " Statistical power =", round(as.numeric(results_1[["power"]]), 3), "\n",
                    " n =", ceiling(results_1[["n"]]), "\n",
                    "------------------------------ \n",
                    "Alternative =", dQuote(results_1[["parms"]][["alternative"]]),"\n",
                    "Non-centrality parameter =", round(as.numeric(results_1[["ncp"]]), 3), "\n",
                    "Type I error rate =", round(as.numeric(results_1[["parms"]][["alpha"]]), 3), "\n",
                    "Type II error rate =", round(1 - as.numeric(results_1[["power"]]), 3), "\n"
                    )



            self$results$text1$setContent(print(results_1))

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
