context("Must extract model name, exponents, comments, DIC abd pD from a list of `rjags` objects containing peicewise exponential models")

test_that("`get_pwe_comparison`", {
  # load rjags fit list object from tests/data
  # for details on how this object was generated refer to the generation script:
  # tests/data/rjags_generation.R
  rjags_list_ex <- readRDS(system.file("tests",
                                       "data",
                                       "rjags_output_list.RDS",
                                       package = "gemtcPlus"))

  output <- get_pwe_comparison(rjags_list_ex)

  # check class
  expect_is(output, "matrix")
  # values
  out_ex <-  matrix(data = list("PWE, FE", "3, 10", 2665.4, 36, 2629.3),
                  nrow = 1,
                  byrow = TRUE)
  colnames(out_ex) <- c("Model", "CutPoints", "DIC", "pD", "meanDev")
  expect_equal(output, out_ex)

})



