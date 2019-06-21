#'  Extract model name, exponents, comments, DIC and pD from NMA fit in jags of a piecewise-exponential model.
#'
#' @param nmaout A list with the results from NMA fit (jags). The list must contain the names elements `descr_s, model.pars, fit, DICsamp`.
#'
#' @return list with description and fit metrics
get_pwe_elements <- function(nmaout){
  
  rc <- list(Model = nmaout$descr_s,
             CutPoints = paste(unlist(nmaout$model.pars), collapse = ", "),
             DIC = round(nmaout$fit$BUGSoutput$DIC, 1),
             pD = round(nmaout$fit$BUGSoutput$pD, 1),
             meanDev = round(sum(nmaout$DICsamp$deviance), 1))
  
  return(rc)
}
