
# This file is automatically generated, you probably don't want to edit this

zcorrOptions <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "zcorrOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            calculate = "selectpower",
            r = 0.5,
            r0 = 0,
            power = 0.8,
            alpha = 0.05,
            alternative = "not equal",
            n = 200, ...) {

            super$initialize(
                package="jpwrss",
                name="zcorr",
                requiresData=FALSE,
                ...)

            private$..calculate <- jmvcore::OptionList$new(
                "calculate",
                calculate,
                options=list(
                    "selectpower",
                    "selectsamplesize"),
                default="selectpower")
            private$..r <- jmvcore::OptionNumber$new(
                "r",
                r,
                default=0.5)
            private$..r0 <- jmvcore::OptionNumber$new(
                "r0",
                r0,
                default=0)
            private$..power <- jmvcore::OptionNumber$new(
                "power",
                power,
                default=0.8)
            private$..alpha <- jmvcore::OptionNumber$new(
                "alpha",
                alpha,
                default=0.05)
            private$..alternative <- jmvcore::OptionList$new(
                "alternative",
                alternative,
                options=list(
                    "not equal",
                    "greater",
                    "less"),
                default="not equal")
            private$..n <- jmvcore::OptionNumber$new(
                "n",
                n,
                default=200)

            self$.addOption(private$..calculate)
            self$.addOption(private$..r)
            self$.addOption(private$..r0)
            self$.addOption(private$..power)
            self$.addOption(private$..alpha)
            self$.addOption(private$..alternative)
            self$.addOption(private$..n)
        }),
    active = list(
        calculate = function() private$..calculate$value,
        r = function() private$..r$value,
        r0 = function() private$..r0$value,
        power = function() private$..power$value,
        alpha = function() private$..alpha$value,
        alternative = function() private$..alternative$value,
        n = function() private$..n$value),
    private = list(
        ..calculate = NA,
        ..r = NA,
        ..r0 = NA,
        ..power = NA,
        ..alpha = NA,
        ..alternative = NA,
        ..n = NA)
)

zcorrResults <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "zcorrResults",
    inherit = jmvcore::Group,
    active = list(
        text2 = function() private$.items[["text2"]],
        plot = function() private$.items[["plot"]]),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="One Correlation z Test",
                refs=list(
                    "pwrss"))
            self$add(jmvcore::Preformatted$new(
                options=options,
                name="text2",
                title="One Correlation z Test"))
            self$add(jmvcore::Image$new(
                options=options,
                name="plot",
                title="One Correlation z Test",
                renderFun=".plot"))}))

zcorrBase <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "zcorrBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = "jpwrss",
                name = "zcorr",
                version = c(1,0,0),
                options = options,
                results = zcorrResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE,
                requiresMissings = FALSE,
                weightsSupport = 'na')
        }))

#' One Correlation z Test
#'
#' 
#' @param calculate .
#' @param r .
#' @param r0 .
#' @param power .
#' @param alpha .
#' @param alternative .
#' @param n .
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$text2} \tab \tab \tab \tab \tab a preformatted \cr
#'   \code{results$plot} \tab \tab \tab \tab \tab an image \cr
#' }
#'
#' @export
zcorr <- function(
    calculate = "selectpower",
    r = 0.5,
    r0 = 0,
    power = 0.8,
    alpha = 0.05,
    alternative = "not equal",
    n = 200) {

    if ( ! requireNamespace("jmvcore", quietly=TRUE))
        stop("zcorr requires jmvcore to be installed (restart may be required)")


    options <- zcorrOptions$new(
        calculate = calculate,
        r = r,
        r0 = r0,
        power = power,
        alpha = alpha,
        alternative = alternative,
        n = n)

    analysis <- zcorrClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}

