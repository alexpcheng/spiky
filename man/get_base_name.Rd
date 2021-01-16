% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_base_name.R
\name{get_base_name}
\alias{get_base_name}
\title{refactored out of rename_spikes and rename_spike_seqlevels}
\usage{
get_base_name(contig_names, sep = "_")
}
\arguments{
\item{contig_names}{the names of contigs}

\item{sep}{separator character in contig names ("_")}
}
\value{
\preformatted{               a vector of atoms 1:3 from each contig name 
}
}
\description{
A common task between generate_spike_fasta, rename_spikes, and
rename_spike_seqlevels is to determine what the largest common subset of
characters between existing contig names and stored standardized contigs
might be. This function eases that task.
}