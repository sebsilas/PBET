
#' Deploy the PBET
#'
#' @param aws_credentials
#' @param num_items
#' @param item_bank
#' @param demographics
#' @param demo
#' @param feedback
#' @param admin_password
#' @param SNR_test
#' @param get_range
#' @param absolute_url
#' @param examples
#' @param final_results
#'
#' @return
#' @export
#'
#' @examples
PBET <- function(aws_credentials,
                 num_items = list("find_the_note" = 6L,
                                  "arrhythmic" = 10L,
                                  "rhythmic" = 10L),
                 item_bank = itembankr::WJD,
                 demographics = TRUE,
                 demo = FALSE,
                 feedback = FALSE,
                 admin_password = "demo",
                 SNR_test = TRUE,
                 get_range = TRUE,
                 absolute_url = "https://adaptiveeartraining.com",
                 examples = 2,
                 final_results = TRUE) {

  if(demo) warning('Running PBET in demo mode!')

  timeline <- psychTestR::join(
    psychTestR::new_timeline(
      psychTestR::join(

        psychTestR::module("PBET",
                           # introduction, same for all users
                           PBET_intro(aws_credentials, demo, SNR_test, get_range, absolute_url = absolute_url),

                           # long tone trials
                           musicassessr::find_this_note_trials(num_items$find_the_note, num_examples = examples, feedback = feedback, page_type = "reactive"),

                           # arrhythmic
                           musicassessr::arrhythmic_melody_trials(item_bank = item_bank,
                                                                  num_items = num_items$arrhythmic,
                                                                  num_examples = examples,
                                                                  feedback = feedback),

                           # rhythmic
                           musicassessr::rhythmic_melody_trials(item_bank = item_bank,
                                                                num_items = num_items$rhythmic,
                                                                num_examples = examples,
                                                                feedback = feedback),

                           psychTestR::elt_save_results_to_disk(complete = FALSE),

                           if(final_results) musicassessr::final_results()

        )
      ),
      dict = PBET_dict
    ),
    psyquest::GMS(subscales = c("Musical Training")),
    musicassessr::deploy_demographics(demographics),
    psychTestR::elt_save_results_to_disk(complete = TRUE),
    psychTestR::final_page("You have completed the Playing By Ear Test!")
  )

  # run the test
  psychTestR::make_test(
    elts = timeline,
    opt = psychTestR::test_options(title = "Playing By Ear Test",
                                   admin_password = admin_password,
                                   display = psychTestR::display_options(
                                     left_margin = 1L,
                                     right_margin = 1L,
                                     css = system.file('www/css/style.css', package = "musicassessr")
                                   ),
                                   languages = c("en")
    ))
}

PBET_intro <- function(aws_credentials = list("api_url" = "api url",
                                             "bucket_name" = "bucket name",
                                             "bucket_region" = "bucket region",
                                             "identity_pool_id" = "identity pool id",
                                             "destination_bucket" = "destination bucket"),
                      demo = FALSE,
                      SNR_test = TRUE,
                      get_range = TRUE,
                      absolute_url) {

  musicassessr::make_aws_credentials_global(aws_credentials)

  c(

    # introduction page
    psychTestR::one_button_page(body = shiny::tags$div(shiny::tags$h2(psychTestR::i18n("PBET_welcome")),
                                                       shiny::tags$img(src = 'custom-assets/img/music.png', height = 100, width = 100),
                                                       shiny::tags$img(src = 'custom-assets/img/saxophone.png', height = 100, width = 100),
                                                       shiny::tags$p(psychTestR::i18n("PBET_welcome_1")),
                                                       shiny::tags$p(psychTestR::i18n("PBET_welcome_2")),
                                                       musicassessr::musicassessr_js_scripts(api_url = aws_credentials$api_url,
                                                                                             bucket_name = aws_credentials$bucket_name,
                                                                                             bucket_region = aws_credentials$bucket_region,
                                                                                             identity_pool_id = aws_credentials$identity_pool_id,
                                                                                             destination_bucket = aws_credentials$destination_bucket)),
                                button_text = psychTestR::i18n("Next")),

    musicassessr::setup_pages(input = "midi_keyboard_or_microphone", demo = demo, get_instrument_range = get_range,
                              SNR_test = SNR_test, absolute_url = absolute_url, select_instrument = TRUE),
    # instructions
    PBET_instructions()
  )

}

PBET_instructions <- function() {

  c(
    psychTestR::one_button_page(body = shiny::tags$div(shiny::tags$h2("Instructions"),
                                                       shiny::tags$p(psychTestR::i18n("test_instructions_1.1")),
                                                       shiny::tags$p(psychTestR::i18n("test_instructions_1.2"))),
                                button_text = psychTestR::i18n("Next")),

    psychTestR::one_button_page(body = shiny::tags$div(shiny::tags$h2("Instructions"),
                                                       shiny::tags$p(psychTestR::i18n("test_instructions_2.1")),
                                                       shiny::tags$p(psychTestR::i18n("test_instructions_2.2"))),
                                button_text = psychTestR::i18n("Next"))
  )



}


.onLoad <- function(...) {
  shiny::addResourcePath(
    prefix = "custom-assets", # custom prefix that will be used to reference your directory
    directoryPath = system.file("www", package = "PBET") # path to resource in your package
  )
  shiny::addResourcePath(
    prefix = "item_banks", # custom prefix that will be used to reference your directory
    directoryPath = system.file("item_banks", package = "itembankr") # path to resource in your package
  )
}

