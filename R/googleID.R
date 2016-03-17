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
get_user_info <- function(id = "me"){

  
  url <- sprintf("https://www.googleapis.com/plus/v1/people/%s", id)
  
  g <- googleAuthR::gar_api_generator(url, "GET")
  
  req <- g()
  
  req$content
  
}