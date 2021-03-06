% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sffsHull.R
\name{sffsHull}
\alias{sffsHull}
\title{Sequential Forward Floating Selection (SFFS) to approximate convex hull}
\usage{
sffsHull(Xall, Aall, Kmax, deltaK = 8)
}
\arguments{
\item{Xall}{Data in a matrix. Each column is a data point.
The cost is computed based on all data points.}

\item{Aall}{Candiatie corners in a matrix. Each column is a candidate corner.}

\item{Kmax}{The target number of corners to be selected.}

\item{deltaK}{The extra number of corners that need to be searched.
The default is 8 and will be truncated based on all the available
corners.
SFFS runs until a corner set of cardinality (\code{Kmax} + \code{deltak})
is obtained. The set of cardinality Kmax might be improved during
backtracking from extra corners.}
}
\value{
A list with length (\code{Kmax} + \code{deltak}). Each component is
a vector of the corner indices of the SFFS-selected subset with
certain cardinality.
}
\description{
This function detects the corners of convex hull by greedy search. It will
be used to reduce the number of candidate corners and thus reduce the time
complexity in the further exhaustive search by \code{\link{cornerSort}}.
}
\details{
The Sequential Floating Forward selection (SFFS) is one of greedy
search methods for feature selection. With sum of margin-of-errors
as cost function and candidate corners as features, SFFS is used to select
best \code{Kmax} corners to form an approximated hull. The best subset of
candidate corners is initialized as the empty set and at each step a new
corner is added. After that, the algorithm searches for corner that can be
removed from the best subset until the cost function does not decrease.
}
\examples{
data <- matrix(c(0.1,0.2,1.0,0.0,0.0,0.5,0.3,
                 0.1,0.7,0.0,1.0,0.0,0.5,0.3,
                 0.8,0.1,0.0,0.0,1.0,0.0,0.4), nrow =3, byrow = TRUE)
rsffs <- sffsHull(data, data, 3)
rsffs <- sffsHull(data, data[,1:5], 3)
}
