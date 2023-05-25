

#' No examples helper
#'
#' @return
#' @export
#'
#' @examples
no_examples <- function() {
  list(
    arrhythmic = list("key_easy" = 0, "key_hard" = 0),
    rhythmic = list("key_easy" = 0, "key_hard" = 0),
    find_this_note = 0L,
    wjd_audio = list("key_easy" = 0, "key_hard" = 0),
    interval_perception = 0L)
}

is.null.or <- function(x, f) {
  is.null(x) || f(x)
}

is.scalar.character <- function(x) {
  is.character(x) && is.scalar(x)
}

is.scalar.numeric <- function(x) {
  is.numeric(x) && is.scalar(x)
}

is.scalar.logical <- function(x) {
  is.logical(x) && is.scalar(x)
}

is.scalar <- function(x) {
  identical(length(x), 1L)
}

is_na_length_1 <- function(x) {
  all(is.na(x)) & length(x) == 1
}

is_null_length_1 <- function(x) {
  all(is.null(x)) & length(x) == 1
}

is_null_or_na_length_1 <- function(x) {
  is_na_length_1(x) | is.null(x)
}

is_equal_to_length_1 <- function(x, equal_to) {
  all(x == equal_to) & length(x) == 1
}
