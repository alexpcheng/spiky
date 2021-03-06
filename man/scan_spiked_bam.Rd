% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scan_spiked_bam.R
\name{scan_spiked_bam}
\alias{scan_spiked_bam}
\title{pretty much what it says: scan standard chroms + spike contigs from a BAM}
\usage{
scan_spiked_bam(
  bam,
  mapq = 20,
  binwidth = 300L,
  bins = NULL,
  spike = NULL,
  how = c("max", "mean"),
  dupe = FALSE,
  paired = TRUE,
  standard = TRUE,
  ...
)
}
\arguments{
\item{bam}{the BAM file}

\item{mapq}{minimum mapq value to count a pair (20)}

\item{binwidth}{width of the bins for chromosomal tiling (300)}

\item{bins}{a pre-tiled GRanges for binning coverage (NULL)}

\item{spike}{the spike-in references, if not using the defaults (NULL)}

\item{how}{how to record spike read coverage (max or mean)? (max)}

\item{dupe}{unique (FALSE), duplicte (TRUE), or all (NA) reads? (FALSE)}

\item{paired}{restrict coverage to that from properly paired reads? (TRUE)}

\item{standard}{restrict non-spike contigs to "standard" chromosomes? (TRUE)}

\item{...}{additional arguments to pass to scanBamFlag()}
}
\value{
\preformatted{     a CompressedGRangesList with bin- and spike-level coverage
}
}
\description{
pretty much what it says: scan standard chroms + spike contigs from a BAM
}
\details{
For a more realistic example (not run), one might do something like:

data(spike, package="spiky");
bam <- "2021_ctl.hg38_withSpikes.bam";
ssb_res <- scan_spiked_bam(bam, mapq=20, spikes=spike);

An extract from the resulting \code{ssb_res} object is available via

data(ssb_res, package="spiky");

The full ssb_res is a GRangesList object with 300bp-binned coverage on the
standard (chr1-22, chrX, chrY, chrM) chromosomes (as determined by the
GenomeInfoDb::standardChromosomes() function against the assembly defined
in the BAM or CRAM file, by default; if desired, a user can scan all
genomic contigs by setting standard=FALSE when calling the function).
By default, the mean base-level coverage of genomic bins is reported,
and the maximum spike-level coverage is reported, though this can also
be adjusted as needed. The results then inform the reliability of
measurements from replicate samples in multiple labs, as well as the
adjusted quantitative coverage in each bin once the absolute quantity
of captured cell-free methylated DNA has been fit by model_glm_pmol and
predict_pmol. In some sense, this function converts BAMs/CRAMs into usable
data structures for high-throughput standardized cfMeDIP experiments.

The data extract used in other examples is the same as the full version,
with the sole difference being that genomic bins are limited to chr22.
}
\examples{
library(GenomicRanges)
sb <- system.file("extdata", "example.spike.bam", package="spiky", 
                  mustWork=TRUE)
res <- scan_spiked_bam(sb, bins=GRanges())
summary(res$spikes$coverage)

}
\seealso{
\preformatted{    GenomeInfoDb::keepStandardChromosomes
}

\preformatted{    Rsamtools::ScanBamParam
}
}
