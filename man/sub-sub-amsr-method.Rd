% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/amsr.R
\docType{methods}
\name{[[,amsr-method}
\alias{[[,amsr-method}
\title{Extract Something From an amsr Object}
\usage{
\S4method{[[}{amsr}(x, i, j, ...)
}
\arguments{
\item{x}{An \code{amsr} object, i.e. one inheriting from \code{\link{amsr-class}}.}

\item{i}{Character string indicating the name of item to extract.}

\item{j}{Optional additional information on the \code{i} item.}

\item{...}{Optional additional information (ignored).}
}
\value{
In all cases, the returned value is a matrix with 
with dimension 1440 by 720, with \code{NA} values if the 
satellite data are over land (coded to \code{0x255}),
have no observations (coded to \code{0xfe}),
are bad observations (coded to \code{0xfd}),
indicate sea ice (coded to \code{0xfc}),
are are faulty owing to high rain (coded to \code{0xfb}).
}
\description{
Extract something from the \code{metadata} or \code{data} slot of an
\code{\link{amsr-class}} object.

The \code{[[} method works for all \code{oce} objects, i.e.
objects inheriting from \code{\link{oce-class}}.  The purpose,
as with the related replacement method, \code{\link{[[<-}}, 
is to insulate users from the internal details of \code{oce}
objects, by looking for items within the various storage
slots of the object. Items not actually stored can also be 
extracted, including derived data, units of measurement,
and data-quality flags.

The method uses a two-step process to try to find the
requested information. First, a class-specific function 
is used to try to access the requested information (see
\dQuote{Details of the specialized ... method}). 
Second, if no match is found, a general function is used
(see \sQuote{Details of the general method}). If neither
method can locates the requested item, \code{NULL} is returned.
}
\details{
Partial matches for \code{i}
are permitted for \code{metadata}, and \code{j} is ignored.

Data within the \code{data} slot must be matched exactly by name,
and may be retrieved with units (the default) or as raw bytes (if
\code{j="raw"}.)  The available items are:
seconds from the start of day (\code{time}),
temperature in degC (\code{SST});
wind speed in m/s (\code{LFwind} and \code{MFwindDay});
water vapor content (\code{vaporDay});
cloudiness (\code{cloud}),
and rainfall in mm/h (\code{rain}).  Each of these is
an average across day-time and night-time passes; to get
the day/night data separately, use e.g. \code{SSTDay}
\code{SSTNight}, and similarly-named versions of all
bands.
}
\section{Details of the general method}{


If the specialized method produces no matches, the following generalized
method is applied. As with the specialized method, the procedure hinges
first on the value of \code{i}.

First, a check is made as to whether \code{i} names one of the standard
\code{oce} slots, and returns the slot contents if so. Thus, 
\code{x[["metadata"]]} will retrieve the \code{metadata} slot, 
while \code{x[["data"]]} and \code{x[["processingLog"]]} return
those slots.

Next, if \code{i} is a string ending in the
\code{"Unit"}, then the characters preceding that string
are taken to be the name of an item in the data object, and a list
containing the unit is returned. This list consists of an item
named \code{unit}, which is an \code{\link{expression}}, and
an item named \code{scale}, which is a string describing the
measurement scale.  If the string ends in \code{" unit"}, e.g.
\code{x[["temperature unit"]]}, then just the expression is returned, 
and if it ends in \code{" scale"}, then just the scale is returned.

Next, if \code{i} is a string ending in \code{"Flag"}, then the corresponding
data-quality flag is returned (or \code{NULL} if there is no such flag). 
For example, \code{x[["salinityFlag"]]} returns a vector of salinity
flags if \code{x} is a ctd object.

If none of the preceding conditions are met, a check is done
to see if the \code{metadata} slot contains an item with
the provided name, and that is returned, if so. A direct match
is required for this condition.

Finally, the \code{data} slot is checked to see if it contains 
an item with the name indicated by \code{i}. In this case, a partial
match will work; this is accomplished by using \code{\link{pmatch}}.

If none of the above-listed conditions holds, then \code{NULL} is returned.
}
\author{
Dan Kelley
}
\seealso{
Other functions that extract parts of \code{oce} objects: \code{\link{[[,adp-method}},
  \code{\link{[[,adv-method}},
  \code{\link{[[,argo-method}},
  \code{\link{[[,bremen-method}},
  \code{\link{[[,cm-method}},
  \code{\link{[[,coastline-method}},
  \code{\link{[[,ctd-method}},
  \code{\link{[[,echosounder-method}},
  \code{\link{[[,g1sst-method}},
  \code{\link{[[,gps-method}},
  \code{\link{[[,ladp-method}},
  \code{\link{[[,lisst-method}},
  \code{\link{[[,lobo-method}},
  \code{\link{[[,met-method}}, \code{\link{[[,odf-method}},
  \code{\link{[[,rsk-method}},
  \code{\link{[[,sealevel-method}},
  \code{\link{[[,section-method}},
  \code{\link{[[,tidem-method}},
  \code{\link{[[,topo-method}},
  \code{\link{[[,windrose-method}},
  \code{\link{[[<-,adv-method}}
}

