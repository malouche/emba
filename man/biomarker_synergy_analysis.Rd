% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/general.R
\name{biomarker_synergy_analysis}
\alias{biomarker_synergy_analysis}
\title{Biomarker analysis per synergy predicted}
\usage{
biomarker_synergy_analysis(
  model.predictions,
  models.stable.state,
  models.link.operator = NULL,
  observed.synergies,
  threshold,
  calculate.subsets.stats = FALSE,
  penalty = 0.1
)
}
\arguments{
\item{model.predictions}{a \code{data.frame} object with rows the models and
columns the drug combinations. Possible values for each \emph{model-drug combination
element} are either \emph{0} (no synergy predicted), \emph{1} (synergy was
predicted) or \emph{NA} (couldn't find stable states in either the drug
combination inhibited model or in any of the two single-drug inhibited models).}

\item{models.stable.state}{a \code{data.frame} (nxm) with n models and m nodes. The row
names specify the models' names whereas the column names specify the network
nodes (gene, proteins, etc.). Possible values for each \emph{model-node element}
can be between \emph{0} (inactive node) and \emph{1} (active node) inclusive.
Note that the rows (models) have to be in the same order as in the \code{model.predictions}
parameter.}

\item{models.link.operator}{a \code{data.frame} (nxm) with n models and m nodes. The row
names specify the models' names (same order as in the \code{model.predictions}
parameter) whereas the column names specify
the network nodes (gene, proteins, etc.). Possible values for each
\emph{model-node element} are either \emph{0} (\strong{AND NOT} link operator),
\emph{1} (\strong{OR NOT} link operator) or \emph{0.5} if the node is not targeted
by both activating and inhibiting regulators (no link operator). Default value:
NULL (no analysis on the models parameterization regarding the mutation of the
boolean equation link operator will be done).}

\item{observed.synergies}{a character vector with elements the names of the
drug combinations that were found as synergistic. This should be a subset of
the tested drug combinations, that is the column names of the \code{model.predictions}
parameter.}

\item{threshold}{numeric. A number in the [0,1] interval, above which (or
below its negative value) a biomarker will be registered in the returned result.
Values closer to 1 translate to a more strict threshold and thus less
biomarkers are found.}

\item{calculate.subsets.stats}{logical. If \emph{TRUE}, then the results will
include a vector of integers, representing the number of models that predicted
every subset of the given \code{observed.synergies} (where at least one model
predicts every synergy in the subset). The default value is \emph{FALSE}, since
the powerset of the predicted \code{observed.synergies} can be very large to compute.}

\item{penalty}{value between 0 and 1 (inclusive). A value of 0 means no
penalty and a value of 1 is the strickest possible penalty. Default value is 0.1.
This penalty is used as part of a weighted term to the difference in a value of
interest (e.g. activity or link operator difference) between two group of
models, to account for the difference in the number of models from each
respective model group.}
}
\value{
a list with various elements:
\itemize{
  \item \code{predicted.synergies}: a character vector of the synergies (drug
  combination names) that were predicted by \strong{at least one} of the models
  in the dataset.
  \item \code{synergy.subset.stats}: an integer vector with elements the number
  of models the predicted each \strong{observed synergy subset} if the
  \emph{calculate.subsets.stats} option is enabled.
  \item \code{synergy.comparison.sets}: a \code{data.frame} with pairs of
  \emph{(set, subset)} for each model-predicted synergy where each respective
  subset misses just one synergy from the larger set (present only if the
  \emph{calculate.subsets.stats} option is enabled). Can be used to refine
  the synergy biomarkers by comparing any two synergy sets with the functions
  \code{\link{get_avg_activity_diff_based_on_synergy_set_cmp}} or
  \code{\link{get_avg_link_operator_diff_based_on_synergy_set_cmp}}.
  \item \code{diff.state.synergies.mat}: a matrix whose rows are
  \strong{vectors of average node activity state differences} between two
  groups of models where the classification for each individual row was based
  on the prediction or not of a specific synergistic drug combination. The
  row names are the predicted synergies, one per row, while the columns
  represent the network's node names. Values are in the [-1,1] interval.
  \item \code{activity.biomarkers}: a \code{data.frame} object with rows
  the \code{predicted synergies} and columns the nodes (column names of the
  \code{models.stable.states} matrix). Possible values for each
  \emph{synergy-node} element are either \emph{1} (\emph{active state}
  biomarker), \emph{-1} (\emph{inhibited state} biomarker) or \emph{0} (not
  a biomarker) for the given \code{threshold} value.
  \item \code{diff.link.synergies.mat}: a matrix whose rows are
  \strong{vectors of average node link operator differences} between two
  groups of models where the classification for each individual row was
  based on the prediction or not of a specific synergistic drug combination.
  The row names are the predicted synergies, one per row, while the columns
  represent the network's node names. Values are in the [-1,1] interval.
  \item \code{link.operator.biomarkers}: a \code{data.frame} object with rows
  the \code{predicted synergies} and columns the nodes (column names of the
  \code{models.link.operator} matrix). Possible values for each
  \emph{synergy-node} element are either \emph{1} (\emph{OR} link operator
  biomarker), \emph{-1} (\emph{AND} link operator biomarker) or \emph{0} (not
  a biomarker) for the given \code{threshold} value.
}
}
\description{
Use this function to discover \emph{synergy biomarkers}, i.e. nodes whose
activity and/or boolean equation parameterization (link operator) affect the
manifestation of synergies in the boolean models. Models are classified to groups based on
whether they predict or not each of the predicted synergies.
}
\seealso{
Other general analysis functions: 
\code{\link{biomarker_mcc_analysis}()},
\code{\link{biomarker_tp_analysis}()}
}
\concept{general analysis functions}
