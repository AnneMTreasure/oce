% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/section.R
\name{sectionSmooth}
\alias{sectionSmooth}
\title{Smooth a Section}
\usage{
sectionSmooth(section, method = c("spline", "barnes"),
  debug = getOption("oceDebug"), ...)
}
\arguments{
\item{section}{A \code{section} object containing the section to be smoothed.
For \code{method="spline"}, the pressure levels must match for each station in
the section.}

\item{method}{Specifies the method to use; see \sQuote{Details}.}

\item{debug}{A flag that turns on debugging.  Set to 1 to get a moderate amount
of debugging information, or to 2 to get more.}

\item{...}{Optional extra arguments, passed to either
\code{\link{smooth.spline}} or \code{\link{interpBarnes}}.}
}
\value{
An object of \code{\link{section-class}} that ordered in some way.
}
\description{
Smooth a section in the lateral (alpha version that may change).
}
\details{
This function should be used with caution, as should any operation that changes
data.  Although smoothing may be desirable to produce aesthetically-pleasing
plots, it can also introduce artifacts that can lead to erroneous conclusions.
The prudent analyst starts by comparing plots of the raw data with plots of the
smoothed data.
    
For \code{method="spline"}, the section is smoothed using
\code{\link{smooth.spline}} on individual pressure levels, with any parameters
listed in \code{parameters} being passed to that function.  If \code{df} is not
present in \code{parameters}, then this function sets it to the number of
stations divided by 5.  Smoothing is done separately for temperature, salinity,
and sigma-theta.

For the (much slower) \code{method="barnes"} method, smoothing is done across
both horizontal and vertical coordinates, using \code{\link{interpBarnes}}.
Any arguments in \code{\dots} being passed to that function; see
\sQuote{Examples}.
}
\examples{
library(oce)
data(section)
gs <- subset(section, 109<=stationId&stationId<=129)
gsg <- sectionGrid(gs, p=seq(0, 5000, 150))
gss1 <- sectionSmooth(gsg, "spline", df=16)
plot(gss1)
gss2 <- sectionSmooth(gsg, "barnes", xr=24, yr=100)
plot(gss2)

}
\author{
Dan Kelley
}
\seealso{
Other things related to \code{section} data: \code{\link{[[,section-method}},
  \code{\link{[[<-,section-method}},
  \code{\link{as.section}},
  \code{\link{handleFlags,section-method}},
  \code{\link{plot,section-method}},
  \code{\link{read.section}}, \code{\link{section-class}},
  \code{\link{sectionAddStation}},
  \code{\link{sectionGrid}}, \code{\link{sectionSort}},
  \code{\link{section}},
  \code{\link{subset,section-method}},
  \code{\link{summary,section-method}}
}

