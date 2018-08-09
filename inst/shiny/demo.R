library(shiny)
library(googleAuthR)
library(googleID)
options(googleAuthR.scopes.selected = c("https://www.googleapis.com/auth/userinfo.email",
                                        "https://www.googleapis.com/auth/userinfo.profile"))
options("googleAuthR.webapp.client_id" = "201908948134-cjjs89cffh3k429vi7943ftpk3jg36ed.apps.googleusercontent.com")
options("googleAuthR.webapp.client_secret" = "mE7rHl0-iNtzyI1MQia-mg1o")

ui <- shinyUI(fluidPage(
  googleAuthUI("example1"),
  p("Logged in as: ", textOutput("user_name"))  
))

server <- shinyServer(function(input, output, session) {
  access_token <- callModule(googleAuth, "example1")
  
  ## to use in a shiny app:
  user_details <- reactive({
    validate(
      need(access_token(), "Authenticate")
    )
    with_shiny(get_user_info, shiny_access_token = access_token())
  })
  
  output$user_name <- renderText({
    validate(
      need(user_details(), "getting user details")
    )
    user_details()$displayName
  })  
})

shinyApp(ui = ui, server = server)