#' NMA data pre-processing
#'
#' @param dat input \code{data.frame}
#' @param data.type \code{character} of either "GSD" or "CONT"
#' @param ref.std \code{character} the reference study
#' @param nma.ref.trt \code{character} the reference treatment
#' @param cut.pts \code{numeric} of cut pointes for PWE model.
#'
#' @return
#' @export
#'
#' @examples
nma_pre_proc <- function(dat,
                         data.type = c("GSD", "CONT"),
                         ref.std = NULL,
                         nma.ref.trt = NULL,
                         cut.pts = NULL){

  `%>%` <- magrittr::`%>%`

  Nobs <- nrow(dat)

  switch(data.type,
          GSD = {# Re-level factors based on `ref.std` and `nma.ref.trt`
                 if(any(is.null(ref.std), is.null(nma.ref.trt))) stop("Please supply arguments `ref.std` and `nma.ref.trt`")
                 dat <- dat %>%
                   dplyr::mutate(studyf = relevel(study, ref = ref.std),
                                 treatmentf = relevel(treatment, ref = nma.ref.trt),
                                 studyn = as.numeric(studyf),
                                 treatmentn = as.numeric(treatmentf),
                                 dt = t.end - t.start)

                 # Create segments factor if `cut.pts` is provided
                 if(is.numeric(cut.pts)){

                   cuts <- c(0, cut.pts, Inf)
                   segments <- cut(dat$t.start,
                                   breaks = cuts,
                                   include.lowest = TRUE,
                                   labels = 1:(length(cuts)-1),
                                   right = TRUE,
                                   ordered_result = TRUE
                   )
                   dat$segments <- segments
                 }

                 dat},
          CONT = {darm2 <- dat %>%
                           dplyr::transmute(
                             study,
                             treatment = new,
                             diff = lhr,
                             std.err = lhrse
                           )
                  darm1 <- dat %>%
                           dplyr::transmute(
                             study,
                             treatment = ref,
                             diff = NA,
                             std.err = NA
                           )

                  dmtc <- rbind(darm1, darm2)}
         )




}


#' Create list of initial JAGS parameters
#'
#' @param dat
#'
#' @return \code{list} of 4 elements containing the JAGS inits (see details)
##' @details The output list contains
##' \itemize{
##'  \item{"dat"}{The original data with labels for `arm` and `n_arm`}
##'  \item{"d_arms"}{inits for arms}
##'  \item{"d_std"}{inits for std}
##'  \item{"d_trts"}{inits for treatments}
##' }
#' @export
#'
#' @examples
nma_jags_inits <- function(dat) {

  `%>%` <- magrittr::`%>%`
  d_arms <- dat %>%
    # dplyr::mutate(study = as.character(study),
    #               treatment = as.character(treatment)) %>%
    dplyr::group_by(study, treatment) %>%
    dplyr::slice(1) %>%
    dplyr::group_by(study) %>%
    dplyr::mutate(arm = 1:n(), n_arms = max(arm)) %>%
    dplyr::select(study, treatment, studyn, treatmentn, arm, n_arms)

  dat <- dat %>%
    dplyr::left_join(d_arms,
                     by = c("study", "treatment", "studyn", "treatmentn"))

  d_std <- d_arms %>%
    dplyr::group_by(studyn) %>%
    dplyr::select(studyn, n_arms) %>%
    dplyr::slice(1)


  d_trts <- dat %>%
    dplyr::mutate(studyn.arm = interaction(studyn, arm)) %>%
    dplyr::filter(!duplicated(studyn.arm)) %>%
    dplyr::select(studyn, arm, treatmentn) %>%
    dplyr::arrange(studyn, arm) %>%
    tidyr::spread(key = arm, treatmentn, drop = FALSE) # identify trt in each am for each study

  list(dat = dat,
       d_arms = d_arms,
       d_std = d_std,
       d_trts = d_trts)
}
