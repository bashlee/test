Keep Track of what changes from version to version and throught development

## v1.0.0

##### Beth
* Re-factor the `nma_pre_proc`. This function should ready data for modeling. Eg. create the jags list and also create a network from the data
* priors passed to `groupedTTE_pwe_pre_proc` and `groupedTTE_fp_pre_proc` and appended to jags list here
* Added new functions:
    * `plan_pwe`, `plan_fp`, `plan_hr` and `plan_binary`, these collate a list of all the inputs required for modeling the specified data & implement some basic checks
    * `nma_fit` takes the pre-processed data and the model plan and runs the model for the selected engine.
    * `bth_prior` collates and check inputs for random effect priors. Used by jags()
    * `match_args_to_func`: helper function to extract plan elements into lists corresponding to destination functions
    * `create_jags_init` internal function to automate jags seed being passed to mtc.run based on number of chains supplied.
* Converted both GSD vingettes & Binary example to work with the new workflow. 
* When running jags the BUGS file is detected using a combination of the data, model type and priors supplied unless otherwise specified by user.
* `create_template` function added.
* Harmonize arguments between PWE and FP: rm cut.pts and treatments from PWE calls and extract the info from the fit object instead

##### Sandro
New functions:

  * groupedTTE_pwe_pre_proc
  * get_nw_fromto
  * get_fp_comparison
  * get_fp_elements
  * get_fp_HR


## v0.1.0

* Package development best practices implemented
* Example vignettes created
* Testing framework introduced
