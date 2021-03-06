% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis.R
\name{calculate_models_synergies_fn}
\alias{calculate_models_synergies_fn}
\title{Count the non-synergies of the observed synergies per model (FN)}
\usage{
calculate_models_synergies_fn(observed.model.predictions)
}
\arguments{
\item{observed.model.predictions}{\code{data.frame} object with rows the models
and columns the drug combinations that were found/observed as \strong{synergistic}
(\emph{negative results}). Possible values for each \emph{model-drug combination
element} are either \emph{0} (no synergy predicted), \emph{1} (synergy was
predicted) or \emph{NA} (couldn't find stable states in either the drug
combination inhibited model or in any of the two single-drug inhibited models)}
}
\value{
an integer vector with elements the number of false negative predictions
per model. The model names are given in the \emph{names} attribute (same order
as in the \emph{rownames} attribute of the observed.model.predictions
\code{data.frame}).
}
\description{
Since the given \code{observed.model.predictions} data.frame has only the
positive results, this function returns the total number of 0's \emph{and}
NA's in each row.
}
\seealso{
Other confusion matrix calculation functions: 
\code{\link{calculate_mcc}()},
\code{\link{calculate_models_mcc}()},
\code{\link{calculate_models_synergies_fp}()},
\code{\link{calculate_models_synergies_tn}()},
\code{\link{calculate_models_synergies_tp}()}
}
\concept{confusion matrix calculation functions}
