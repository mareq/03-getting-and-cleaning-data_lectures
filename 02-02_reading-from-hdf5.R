#source("http://bioconductor.org/biocLite.R")
#biocLite("rhdf5")
library(rhdf5)

hdf5file = "./data/02-02_example.h5"

h5createFile(hdf5file)
h5createGroup(hdf5file, "foo")
h5createGroup(hdf5file, "foo/bar")
h5createGroup(hdf5file, "baz")
h5ls(hdf5file)

A = matrix(1:10, nr=5, nc=2)
A
h5write(A, hdf5file, "foo/A")
B = array(seq(0.1, 2.0, by=0.1), dim=c(5,2,2))
attr(B, "scale") <- "liter"
B
h5write(B, hdf5file, "foo/bar/B")
h5ls(hdf5file)

df = data.frame(1L:5L, seq(0,1,length.out=5), c("ab", "cde", "fghi", "a", "s"), stringsAsFactors=FALSE)
df
h5write(df, hdf5file, "df")
h5ls(hdf5file)

readA = h5read(hdf5file, "foo/A")
readA
readB = h5read(hdf5file, "foo/bar/B")
readB
readdf= h5read(hdf5file, "df")
readdf

h5write( c(42,23,82), # write these values
  hdf5file, # to this file
  "foo/A", # at this path
  index=list(1:3,1) # to these indicies (rows 1-3, column 1)
)
h5read(hdf5file, "foo/A")
h5read(hdf5file, "foo/A", index=list(1:4, 1)) # read only some part of data (rows 1-4, column 1)

unlink(hdf5file)


