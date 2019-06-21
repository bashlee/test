# NMA Project Document
This document should be used to keep track of ideas/future package features as well as handover notes for each phase.

# Project development (TODO)

#### From SG:

Minor:

  * Fix issue in `browseVignettes`: opens html page with vignettes list, but cross-links in there do not work (fixed ? BA)
  * Can minimal examples be transformed into templates?
  * Network plots based on `ggnet2` for all input data structures? (https://briatte.github.io/ggnet/)


Major:

  * check calculation of S(t) functions in FP case (use integrate instead of current approx, which relies on time-grid)
  * add RE (intercept) FP model
  * add zero-order FP model
  * add PWE without cutpoints

Add tests, properly handle namespace (calls like dplyr::mutate instead of mutate only), properly document:

* plot_fp_HR
* get_fp_1o
* get_fp_1o_HR
* get_fp_2o
* get_fp_2o_HR
* get_fp_contrasts
* get_fp_1o_S
* get_fp_2o_S
* get_fp_S
* get_fp_1o_GoF
* get_fp_2o_GoF
* get_fp_GoF
* get_fp_corrs
* groupedTTE_pwe_pre_proc
* get_nw_fromto
* get_fp_comparison
* get_fp_elements
* get_fp_HR

#### From NH:

* Rework `pwe_conv_diag` function, breaking into smaller (testable) modules and potentially removing the dependency on the `R2jags` package.
* Finish development of utility function `get_segments` & `get_pw_segments`. These two functions could be one.
* Replace all instances of `reshape2::melt` with `tidyr::gather` to reduce dependencies (also `tidyr` is newer and supported more than `reshape2`).

#### From BA
* Fully document each planning function with detailed roxygen headers
* Complete testing as above.

# Phase 1 
TODO

# Phase 2

### Summary

During phase 2 of the project, the architecture of the package has undergone major reconstruction to easily allow for the expansion of different data types (eg IPD) and methods (eg GLM) and engines (eg. STAN).
Current supported engines are gemtc and rjags. 
4 vignettes have been produced that serve as examples of the different data types and methods currently supported, these may serve as templates

## Development notes
For this phase I have pushed all code to the development branch. Once all new function roxygen headers are filled out and testing is complete then the branch should we merged into master. At this stage the major version number should be increased to 1.0.0 signifying the package is in production. 


## Other features to think about
* Include borrowing-of-strength (BoS) statistics in outputs  

[70] Dan Jackson, Ian R White, Malcolm Price, John Copas, and Richard D Riley. Borrowing of
strength and study weights in multivariate and network meta-analysis. Statistical methods in
medical research, 26(6):2853{2868, 2017.
  
  [71] Richard D Riley, Joie Ensor, Dan Jackson, and Danielle L Burke. Deriving percentage
  study weights in multi-parameter meta-analysis models: with application to meta-regression,
  network meta-analysis and one-stage individual participant data models. Statistical methods
  in medical research, 27(10):2885{2905, 2018.
    
    - Include radar chart in list of outputs (https://www.r-graph-gallery.com/spider-or-radar-chart/, https://plot.ly/r/radar-chart/)
    
    - See kick-off doc for list with other model types