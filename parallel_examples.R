## ggparallel

library(ggplot2)
library(ggparallel)

# Examples

data(mtcars)

ggparallel(list("gear", "cyl"), data=mtcars)
ggparallel(list("gear", "cyl"), data=mtcars, method="hammock")

## combination of common angle plot and hammock adjustment:
ggparallel(list("gear", "cyl"), data=mtcars, method="adj.angle")

## compare with method='parset'
ggparallel(list("gear", "cyl"), data=mtcars, method='parset')

## flip plot and rotate text
ggparallel(list("gear", "cyl"), data=mtcars, text.angle=0) + coord_flip()

## change colour scheme
ggparallel(list("gear", "cyl"), data=mtcars, text.angle=0) + coord_flip() +
  scale_fill_brewer(palette="Set1") +
  scale_colour_brewer(palette="Set1")

## Example with more than two variables:

titanic <- as.data.frame(Titanic)

ggparallel(names(titanic)[c(1,4,2,1)], order=0, titanic, weight="Freq") +
  scale_fill_brewer(palette="Paired", guide="none") +
  scale_colour_brewer(palette="Paired", guide="none")

## hammock plot with same width lines
ggparallel(names(titanic)[c(1,4,2,3)], titanic, weight=1, asp=0.5, method="hammock", ratio=0.2, order=c(0,0)) +
  theme( legend.position="none") +
  scale_fill_brewer(palette="Paired") +
  scale_colour_brewer(palette="Paired")

## hammock plot with line widths adjusted by frequency
ggparallel(names(titanic)[c(1,4,2,3)], titanic, weight="Freq", asp=0.5, method="hammock", order=c(0,0)) +
  theme( legend.position="none")

## Example biological examples: genes and pathways

data(genes)

genes$chrom <- factor(genes$chrom, levels=c(paste("chr", 1:22, sep=""), "chrX", "chrY"))
ggparallel(list("path", "chrom"), text.offset=c(0.03, 0,-0.03), data = genes, width=0.1, order=c(1,0), text.angle=0, color="white",
           factorlevels = c(sapply(unique(genes$chrom), as.character),
                            unique(genes$path))) +
  scale_fill_manual(values = c( brewer.pal("YlOrRd", n = 9), rep("grey80", 24)), guide="none") +
  scale_colour_manual(values = c( brewer.pal("YlOrRd", n = 9), rep("grey80", 24)), guide="none") +
  coord_flip()