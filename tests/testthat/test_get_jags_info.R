context("Must extract jags info from `rjags` object"
)

test_that("`get_jags_info`", {
  # load mtc.result object from tests/data
  # for details on how this object was generated refer to the generation script:
  # tests/data/rjags_generation.R

  rjags_ex <- readRDS(system.file("tests",
                                  "data",
                                  "rjags_output.RDS",
                                  package = "gemtcPlus"))

  output <- get_jags_info(rjags_ex)
  # capture print
  rjags_print <- capture.output(output)

  # check some of the print elements
  expect_match(rjags_print[1], "##############################################")
  expect_match(rjags_print[2], "# DATA                                       #")
  expect_match(rjags_print[3], "##############################################")
  # meta data
  expect_match(rjags_print[6], " Ncuts  =  2 ")
  expect_match(rjags_print[7], " Nobs  =  675 ")
  # jags code
  expect_match(rjags_print[62], "for \\(i in 1:Ns\\)")
  expect_match(rjags_print[63], "  for \\(j in 1:Na\\[i\\]\\)")
  expect_match(rjags_print[64], "    for \\(k in 1:\\(Ncuts \\+ 1\\)\\)")
  expect_match(rjags_print[65], "      Beta\\[i, j, k\\] <- mu\\[i, k\\] \\+ d\\[t\\[i, j\\], k\\] - d\\[t\\[i, 1\\], k\\]")
  expect_match(rjags_print[66], "    }\r")
  expect_match(rjags_print[67], "  }\r")
  expect_match(rjags_print[68], "}\r")

})






