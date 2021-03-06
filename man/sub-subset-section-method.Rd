% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/section.R
\docType{methods}
\name{[[<-,section-method}
\alias{[[<-,section-method}
\title{Replace Parts of a Section Object}
\usage{
\S4method{[[}{section}(x, i, j) <- value
}
\arguments{
\item{x}{A \code{section} object, i.e. inheriting from \code{\link{section-class}}}

\item{i}{The item to replace.}

\item{j}{Optional additional information on the \code{i} item.}

\item{value}{The value to be placed into \code{x}, somewhere.}

\item{...}{Optional additional information (ignored).}
}
\description{
The \code{[[<-} method works for all \code{oce} objects, i.e.
objects inheriting from \code{\link{oce-class}}.  The purpose,
as with the related extraction method, \code{\link{[[}},
is to insulate users from the internal details of \code{oce}
objects, by looking for items within the various storage
slots of the object. Items not actually stored can also be 
replaced, including units and data-quality
flags.
}
\details{
As with \code{\link{[[}} method, the procedure
works in steps.

First, the \code{metadata} slot of \code{x} is checked to
see whether it contains something named with \code{i}.
If so, then the named item is replaced with \code{value}.

Otherwise, if the string value of \code{i} ends in \code{Unit}, then the
characters preceding that are taken as the name of a variable, and
the \code{metadata} slot of \code{x} is updated to store that unit, e.g.
\preformatted{    x[["temperatureUnits"]] <- list(unit=expression(degree*F),scale="")}

Similarly, if \code{i} ends in \code{Flag}, then quality-control
flags are set up as defined by \code{result}, e.g.
\preformatted{    x[["temperatureFlags"]] <- c(2,4,2,2)}

Otherwise, a partial string match is sought among the names of items
in the \code{data} slot of \code{x}. (This is done with \code{\link{pmatch}}.)
The first item found (if any) is then updated to hold the value \code{result}.

If none of these conditions is met, a warning is issued.
}
\examples{
# Change section ID from a03 to A03
data(section)
section[["sectionId"]]
section[["sectionId"]] <- toupper(section[["sectionId"]])
section[["sectionId"]]
}
\author{
Dan Kelley
}
\seealso{
Other functions that replace parts of \code{oce} objects: \code{\link{[[<-,adp-method}},
  \code{\link{[[<-,amsr-method}},
  \code{\link{[[<-,argo-method}},
  \code{\link{[[<-,bremen-method}},
  \code{\link{[[<-,cm-method}},
  \code{\link{[[<-,coastline-method}},
  \code{\link{[[<-,ctd-method}},
  \code{\link{[[<-,echosounder-method}},
  \code{\link{[[<-,g1sst-method}},
  \code{\link{[[<-,gps-method}},
  \code{\link{[[<-,lisst-method}},
  \code{\link{[[<-,lobo-method}},
  \code{\link{[[<-,met-method}},
  \code{\link{[[<-,oce-method}},
  \code{\link{[[<-,odf-method}},
  \code{\link{[[<-,rsk-method}},
  \code{\link{[[<-,sealevel-method}},
  \code{\link{[[<-,tidem-method}},
  \code{\link{[[<-,topo-method}},
  \code{\link{[[<-,windrose-method}}

Other things related to \code{section} data: \code{\link{[[,section-method}},
  \code{\link{as.section}},
  \code{\link{handleFlags,section-method}},
  \code{\link{plot,section-method}},
  \code{\link{read.section}}, \code{\link{section-class}},
  \code{\link{sectionAddStation}},
  \code{\link{sectionGrid}}, \code{\link{sectionSmooth}},
  \code{\link{sectionSort}}, \code{\link{section}},
  \code{\link{subset,section-method}},
  \code{\link{summary,section-method}}
}

