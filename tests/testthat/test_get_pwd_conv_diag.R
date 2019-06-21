context("Must extract convergence diagnostics from a piece-wise exponential model fit contained in a `rjags` object")

test_that("`get_pwe_conv_diag`", {
  # load mtc.result object from tests/data
  # for details on how this object was generated refer to the generation script:
  # tests/data/rjags_generation.R


  rjags_ex <- readRDS(system.file("tests",
                                  "data",
                                  "rjags_output.RDS",
                                   package = "gemtcPlus"))


  output <- get_pwe_conv_diag(rjags_ex)

})

context("Should control convergence assessment with argument `patterns`")

test_that("`get_pwe_conv_diag`", {
  expect_true(FALSE)
})
