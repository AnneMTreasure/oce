% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/landsat.R
\docType{methods}
\name{plot,landsat-method}
\alias{plot,landsat-method}
\title{Plot a landsat Object}
\usage{
\S4method{plot}{landsat}(x, band, which = 1, decimate = TRUE, zlim,
  utm = FALSE, col = oce.colorsPalette, drawPalette = TRUE,
  showBandName = TRUE, alpha.f = 1, red.f = 1.7, green.f = 1.5,
  blue.f = 6, offset = c(0, -0.05, -0.2, 0), transform = diag(c(red.f,
  green.f, blue.f, alpha.f)), debug = getOption("oceDebug"), ...)
}
\arguments{
\item{x}{A \code{landsat} object, e.g. as read by \code{\link{read.landsat}}.}

\item{band}{If given, the name of the band.  For Landsat-8 data, this may be
one of: \code{"aerosol"}, \code{"blue"}, \code{"green"}, \code{"red"},
\code{"nir"}, \code{"swir1"}, \code{"swir2"}, \code{"panchromatic"},
\code{"cirrus"}, \code{"tirs1"}, or \code{"tirs2"}.  For Landsat-7 data,
this may be one of \code{"blue"}, \code{"green"}, \code{"red"},
\code{"nir"}, \code{"swir1"}, \code{"tirs1"}, \code{"tirs2"},
\code{"swir2"}, or \code{"panchromatic"}.  For Landsat data prior to
Landsat-7, this may be one of \code{"blue"}, \code{"green"},
\code{"red"}, \code{"nir"}, \code{"swir1"}, \code{"tirs1"},
\code{"tirs2"}, or \code{"swir2"}.  If \code{band} is not given, the
(\code{"tirs1"}) will be used if it exists in the object data, or
otherwise the first band will be used.  In addition to the above, using
\code{band="temperature"} will plot an estimate of at-satellite
brightness temperature, computed from the \code{tirs1} band, and
\code{band="terralook"} will plot a sort of natural colour by combining
the \code{red}, \code{green}, \code{blue} and \code{nir} bands
according to the formula provided at
\url{http://terralook.cr.usgs.gov/what_is_terralook.php}}

\item{which}{Desired plot type; 1=image, 2=histogram.}

\item{decimate}{An indication of the desired decimation,
passed to \code{\link{imagep}} for image plots.
The default yields faster plotting.  Some decimation is sensible for
full-size images, since no graphical displays can show 16 thousand pixels
on a side.}

\item{zlim}{Either a pair of numbers giving the limits for the colourscale,
or \code{"histogram"} to have a flattened histogram (i.e. to maximally
increase contrast throughout the domain.)  If not given, the 1 and 99
percent quantiles are calculated and used as limits.}

\item{utm}{A logical value indicating whether to use UTS (easting and northing) instead
of longitude and latitude on plot.}

\item{col}{Either a function yielding colours, taking a single integer
argument with the desired number of colours, or the string
\code{"natural"}, which combines the information in the \code{red},
\code{green} and \code{blue} bands and produces a natural-hue image.  In
the latter case, the band designation is ignored, and the object must
contain the three colour bands.}

\item{drawPalette}{Indication of the type of palette to draw, if
any. See \code{\link{imagep}} for details.}

\item{showBandName}{A logical indicating whether the band name is to
plotted in the top margin, near the right-hand side.}

\item{alpha.f}{Argument used if \code{col="natural"}, to adjust colours
with \code{\link{adjustcolor}}.}

\item{red.f}{Argument used if \code{col="natural"}, to adjust colours with
\code{\link{adjustcolor}}.  Higher values of \code{red.f} cause red hues
to be emphasized (e.g. dry land).}

\item{green.f}{Argument used if \code{col="natural"}, to adjust colours with
\code{\link{adjustcolor}}.  Higher values of \code{green.f} emphasize
green hues (e.g. forests).}

\item{blue.f}{Argument used if \code{band="terralook"}, to adjust colours with
\code{\link{adjustcolor}}.  Higher values of \code{blue.f} emphasize blue
hues (e.g. ocean).}

\item{offset}{Argument used if \code{band="terralook"}, to adjust colours with
\code{\link{adjustcolor}}.}

\item{transform}{Argument used if \code{band="terralook"}, to adjust colours
with \code{\link{adjustcolor}}.}

\item{debug}{Set to a positive value to get debugging information during
processing.}

\item{...}{optional arguments passed to plotting functions.}
}
\description{
Plot the data within a landsat image, or information computed from the
data. The second category includes possibilities such as an estimate of
surface temperature and the \code{"terralook"} estimate of a natural-colour
view.
}
\details{
For Landsat-8 data, the \code{band} may be
one of: \code{"aerosol"}, \code{"blue"}, \code{"green"}, \code{"red"},
\code{"nir"}, \code{"swir1"}, \code{"swir2"}, \code{"panchromatic"},
\code{"cirrus"}, \code{"tirs1"}, or \code{"tirs2"}.

For Landsat-7 data, \code{band} may be one of \code{"blue"}, \code{"green"}, \code{"red"},
\code{"nir"}, \code{"swir1"}, \code{"tirs1"}, \code{"tirs2"},
\code{"swir2"}, or \code{"panchromatic"}.

For Landsat data prior to
Landsat-7, \code{band} may be one of \code{"blue"}, \code{"green"},
\code{"red"}, \code{"nir"}, \code{"swir1"}, \code{"tirs1"},
\code{"tirs2"}, or \code{"swir2"}.  

If \code{band} is not given, the
(\code{"tirs1"}) will be used if it exists in the object data, or
otherwise the first band will be used.

In addition to the above there are also some pseudo-bands that
can be plotted, as follows.
\itemize{
\item Setting \code{band="temperature"} will plot an estimate
of at-satellite brightness temperature, computed from the
\code{tirs1} band.
\item Setting \code{band="terralook"} will plot a sort of natural
colour by combining the \code{red}, \code{green}, \code{blue} and
\code{nir} bands according to the formula provided at
\url{http://terralook.cr.usgs.gov/what_is_terralook.php}, namely
that the \code{red}-band data are provided as the \code{red}
argument of the \code{\link{rgb}} function, while
the \code{green} argument is computed as
2/3 of the \code{green}-band data plus 1/3 of the \code{nir}-band data, and
the \code{blue} argument is computed as 2/3 of the \code{green}-band
data minus 1/3 of the \code{nir}-band data. (This is not a typo: the
\code{blue} band is not used.)
}
}
\author{
Dan Kelley
}
\seealso{
Other things related to \code{landsat} data: \code{\link{[[,landsat-method}},
  \code{\link{landsat-class}}, \code{\link{landsatAdd}},
  \code{\link{landsatTrim}}, \code{\link{landsat}},
  \code{\link{read.landsat}},
  \code{\link{summary,landsat-method}}
}
\concept{
satellite
}

