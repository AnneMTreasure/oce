% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geod.R
\name{geodXy}
\alias{geodXy}
\title{Convert From Geographical to Geodesic Coordinates}
\usage{
geodXy(longitude, latitude, longitudeRef = 0, latitudeRef = 0, rotate = 0)
}
\arguments{
\item{longitude}{vector of longitudes}

\item{latitude}{vector of latitudes}

\item{longitudeRef}{numeric, reference longitude}

\item{latitudeRef}{numeric, reference latitude}

\item{rotate}{numeric, counterclockwise angle, in degrees, by which to
rotate the (\code{x}, \code{y}) coordinates about the reference point.  This
is useful in rotating the coordinate system to align with a coastline, a
mean current, etc.}
}
\value{
Data frame of \code{x} and \code{y}, geodesic distance components,
measured in metres. See \dQuote{Details} for the definitions.
}
\description{
The method employs geodesic calculations of the distances along geodesic
curves, i.e. akin to great-circle curves that go along the surface of the
ellipsoidal earth; see \code{\link{geodDist}}. The results are minimally
sensitive to the ellipsoidal geometry assumed, but this is not a matter in
serious question today. Note that the results are quite unlike the values
returned from a map projection; in the latter case, the results vary greatly
across a range of popular projections. Use the present function for things
like gridding data or calculating drifter speeds.
}
\details{
Consider the \code{i}-th point in the \code{longitude} and \code{latitude}
vectors.  The value of \code{x[i]} is inferred from the distance along a
geodesic curve from from (\code{longitude[i]}, \code{latitude[i]}) to
(\code{longitudeRef[i]}, \code{latitude[i]}), i.e. the distance along a line
of constant latitude.  Similarly, \code{y[i]} is inferred the geodesic
distance from (\code{longitude[i]}, \code{latitude[i]}) to
(\code{longitude[i]}, \code{latitudeRef}). Once the distances are inferred,
signs are calculated from determining the sign of
\code{longitude[i]-longitudeRef} for \code{x[i]} and similarly \code{y[i]}.
}
\section{Change notification}{
 Until 2015-11-02, the names of the arguments
were \code{lon}, \code{lat}, \code{lon.ref} and \code{lat.ref}; these were
changed to be more in keeping with names in the rest of oce.
}

\section{Caution}{
 The calculation is devised by the author and is without known
precedent in the literature, so users might have to explain it in their
publications--hence the detailed discussion below.

 This is possibly useful, possibly not. The method changed in Oct, 2015.
}
\examples{
library(oce)
data(section)
lon <- section[["longitude", "byStation"]]
lat<- section[["latitude", "byStation"]]
lon <- lon
lat <- lat
lonR <- lon[1]
latR <- lat[1]
## 1. ellipse
km <- 1e3 # nicer for graphs
xy <- geodXy(lon, lat, lonR, latR) / km
## 2. sphere, with scale tailored to mean local latitude
kmperdeg <- geodDist(0, mean(lat)-0.5, 0, mean(lat)+0.5) # mid-latitude estimate
X <- (lon - lonR) * kmperdeg * cos(lat * pi / 180)
Y <- (lat - latR) * kmperdeg
XY <- list(x=X, y=Y)
## plot, with labels for sphere-ellipse deviations
par(mfrow=c(2,1), mar=c(3, 3, 1, 1), mgp=c(2, 0.7, 0))
plot(lon, lat, asp=1/cos(median(lat*pi/180)))
plot(xy$x, xy$y, asp=1, xlab="x [km]", ylab="y [km]")
rms<- function(x) sqrt(mean(x^2))
mtext(sprintf("RMS dev.: x \%.2f km, y \%.2f km",
              rms(xy$x-XY$x), rms(xy$y-XY$y)), side=3, line=-1)
mtext(sprintf("RMS dev / span: x \%.2g, y \%.2g",
              rms(xy$x-XY$x)/diff(range(xy$x)),
              rms(xy$y-XY$y)/diff(range(xy$y))),
      side=3, line=-2)

}
\author{
Dan Kelley
}
\seealso{
\code{\link{geodDist}}

Other functions relating to geodesy: \code{\link{geodDist}},
  \code{\link{geodGc}}, \code{\link{geodXyInverse}}
}

