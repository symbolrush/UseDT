test_that("test function with DT", {
  library(data.table)
  # Import and make sure routes are unique and ordered:
  path <- "C:/07 Rprogress/00 Erste Testprogramme/UseDT/data/"
  routes <- imsbasics::load_rdata("34 routes", path)
  routes <- unique(routes) # ................................................... force uniqueness
  cond <- (routes$lat1 != 0) & (routes$lng1 != 0) & (routes$lat2 != 0) & (routes$lng2 != 0)
  routes <- routes[cond, ]
  routes <- routes[with(routes, order(lat1, lng1, lat2, lng2, na.last = T)), ] # force ordering
  rm(cond)

  # Create search task with generated data.table
  nmax <- 10
  DT <- generate_routes_dt(nmax)
})
