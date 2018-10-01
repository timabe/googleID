#' Get the logged in user's email and other info
#' 
#' @param id ID of the person to get the profile data for. 'me' to get current user.
#' 
#' @return A People resource
#' 
#' https://developers.google.com/+/web/api/rest/latest/people#resource-representations
#' 
#' @seealso https://developers.google.com/+/web/api/rest/latest/people
#' 
#' @export
#' 
#' @examples 
#' 
#' \dontrun{
#' library(googleAuthR)
#' library(googleID)
#' options(googleAuthR.scopes.selected = 
#'    c("https://www.googleapis.com/auth/userinfo.email",
#'      "https://www.googleapis.com/auth/userinfo.profile"))
#'                                         
#' googleAuthR::gar_auth()
#' 
#' ## default is user logged in
#' user <- get_user_info()
#' }
#' 
get_user_info <- function(id = "me"){

  
  url <- sprintf("https://www.googleapis.com/plus/v1/people/%s", id)
  
  g <- googleAuthR::gar_api_generator(url, "GET")
  
  req <- g()
  
  req$content
  
}

#' Whitelist check
#' 
#' After a user logs in, check to see if they are on a whitelist
#' 
#' @param user_info the object returned by \link{get_user_info}
#' @param whitelist A character vector of emails on whitelist
#' 
#' @return TRUE if on whitelist or no whitelist, FALSE if not
#' @export
#' 
#' @examples 
#' 
#' \dontrun{
#' library(googleAuthR)
#' library(googleID)
#' options(googleAuthR.scopes.selected = 
#'    c("https://www.googleapis.com/auth/userinfo.email",
#'      "https://www.googleapis.com/auth/userinfo.profile"))
#'                                         
#' googleAuthR::gar_auth()
#' 
#' ## default is user logged in
#' user <- get_user_info()
#' 
#' the_list <- whitelist(user, c("your@email.com", 
#'                               "another@email.com", 
#'                               "yet@anotheremail.com"))
#' 
#' if(the_list){
#'   message("You are on the list.")
#' } else {
#'   message("If you're not on the list, you're not getting in.")
#'}
#' 
#' 
#' 
#' }
whitelist <- function(user_info, whitelist = NULL){
  
  if(user_info$kind != "plus#person"){
    stop("Invalid user object used for user_info")
  }
  
  out <- FALSE
  
  if(is.null(whitelist)){
    message("No whitelist found")
    out <- TRUE
  }
  
  # google emails are case insensitive
  whitelist <- tolower(whitelist)
  check <- tolower(user_info$emails$value)
  
  if(is.null(check)){
    stop("No user email found")
  }
  
  if(any(stringr::str_detect(check, whitelist))) {
    message(check, " is in whitelist ")
    out <- TRUE
  } else {
    message(check, " is NOT on whitelist")
  }
  
  out
  
}