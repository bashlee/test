% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nma_pre_proc.R
\name{nma_pre_proc}
\alias{nma_pre_proc}
\title{NMA data pre-processing}
\usage{
nma_pre_proc(dat, data.type = c("GSD", "CONT"), ref.std = NULL,
  nma.ref.trt = NULL, cut.pts = NULL)
}
\arguments{
\item{dat}{input \code{data.frame}}

\item{data.type}{\code{character} of either "GSD" or "CONT"}

\item{ref.std}{\code{character} the reference study}

\item{nma.ref.trt}{\code{character} the reference treatment}

\item{cut.pts}{\code{numeric} of cut pointes for PWE model.}
}
\description{
NMA data pre-processing
}
