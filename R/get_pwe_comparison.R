#' Extract model name, exponents, comments, DIC and pD from list of NMA fits (jags) of piecewise exponential models.
#'
#' @param nmaout.list List of results lists (which must contain the names elements `descr_s, model.pars, fit, DICsamp`).
#' @export
#'
#' @return matrix comparing the models
get_pwe_comparison <- function(nmaout.list){

  all_ls <- lapply(nmaout.list, get_pwe_elements)
  all_ls2<- lapply(all_ls, FUN = function(x) t(as.matrix(x)))

  all_ma <- c()
  for (i in seq_along(all_ls2)) {
    all_ma <- rbind(all_ma, all_ls2[[i]])
  }

  return(all_ma)
}
