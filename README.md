---
title: "gemtcPlus README"
output: github_document
---


## Introduction


This package was created to centralise some functions and reports which have
been in development by the ACE team at Roche. This has the benefit of allowing 
other users to more easily run the same analyses and also contribute to the suite
of functions that aid the workflow. In creating the package several processes
and standards were decided upon which aim to ensure that analysis is reproducible
and scalable.


## Installation

Installation is simple, either install directly from this repo, or download a source and install from the tarball.

## Getting Started

There are some quick-start guides which are built into this pacakge in vignettes. The guides cover the basics and any specific conventions regarding report writing, function building, unit testing. An easy way to see these guides (and example analysis reports) is by calling `browseVignettes(package = "gemtcPlus")` after the package has been installed.

## To-Do

- Expand (and fill in) the documentation for `nma_pre_proc` and `nma_jags_inits` functions.
- Add additional data workflows in `nma_pre_proc`.
- Rework `pwe_conv_diag` function, breaking into smaller (testable) modules and potentially removing the dependency on the `R2jags` package.
- Reduce complexity of example reports in `/vignettes` in order to reduce build time for the package.
- Build tests for `nma_pre_proc` and `nma_jags_inits` functions.
- Finish development of utility function `get_segments` & `get_pw_segments`. These two functions could be one.
- Replace all instances of `reshape2::melt` with `tidyr::gather` to reduce dependencies (also `tidyr` is newer and supported more than `reshape2`).


