

#' Deploy the PBET as a standalone test
#'
#' @param num_items
#' @param melody_length
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
#' @param musicassessr_state
#' @param item_characteristics_sampler_function
#' @param get_trial_characteristics_function
#'
#' @return
#' @export
#'
#' @examples
PBET_standalone <- function(num_items = list("interval_perception" = 24L,
                                             "find_the_note" = 6L,
                                             "arrhythmic" = list("key_easy" = 5L, "key_hard" = 5L),
                                             "rhythmic" = list("key_easy" = 5L, "key_hard" = 5L),
                                             "wjd_audio" = list("key_easy" = 5L, "key_hard" = 5L)),
                            melody_length = 3:15,
                            item_bank = itembankr::WJD,
                            demographics = TRUE,
                            demo = FALSE,
                            feedback = FALSE,
                            admin_password = "demo",
                            SNR_test = TRUE,
                            get_range = TRUE,
                            absolute_url = "https://adaptiveeartraining.com",
                            examples = list("easy" = 1L, "hard" = 1L),
                            final_results = TRUE,
                            musicassessr_state = "production",
                            item_characteristics_sampler_function = item_characteristics_sampler_pbet,
                            get_trial_characteristics_function = get_trial_characteristics_pbet) {

  timeline <- PBET(num_items,
                   melody_length,
                    item_bank,
                    demographics,
                    demo,
                    feedback,
                    admin_password,
                    SNR_test,
                    get_range,
                    absolute_url,
                    examples,
                    final_results,
                    musicassessr_state,
                    item_characteristics_sampler_function,
                    get_trial_characteristics_function)


  # run the test
  psychTestR::make_test(
    elts = timeline,
    opt = psychTestR::test_options(title = "Playing By Ear Test",
                                   admin_password = admin_password,
                                   display = psychTestR::display_options(
                                     left_margin = 1L,
                                     right_margin = 1L,
                                     css = system.file('www/css/style.css', package = "musicassessr"),
                                     musicassessr::musicassessr_js(musicassessr_state)
                                   ),
                                   languages = c("en")
    ))
}
#' Deploy the PBET
#'
#' @param num_items
#' @param melody_length
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
#' @param musicassessr_state
#' @param item_characteristics_sampler_function
#' @param get_trial_characteristics_function
#'
#' @return
#' @export
#'
#' @examples
PBET <- function(num_items = list("interval_perception" = 24L,
                                  "find_the_note" = 6L,
                                  "arrhythmic" = list("key_easy" = 5L, "key_hard" = 5L),
                                  "rhythmic" = list("key_easy" = 5L, "key_hard" = 5L),
                                  "wjd_audio" = list("key_easy" = 5L, "key_hard" = 5L)),
                 melody_length = 3:15,
                 item_bank = itembankr::WJD,
                 demographics = TRUE,
                 demo = FALSE,
                 feedback = FALSE,
                 admin_password = "demo",
                 SNR_test = TRUE,
                 get_range = TRUE,
                 absolute_url = "https://adaptiveeartraining.com",
                 examples = list("easy" = 1L, "hard" = 1L),
                 final_results = TRUE,
                 musicassessr_state = "production",
                 item_characteristics_sampler_function = item_characteristics_sampler_pbet,
                 get_trial_characteristics_function = get_trial_characteristics_pbet) {

  pars_arrhythmic <- c(num_items$arrhythmic, list("melody_length" = melody_length))
  pars_rhythmic <- c(num_items$rhythmic, list("melody_length" = melody_length))


  if(demo) warning('Running PBET in demo mode!')

  timeline <- psychTestR::join(
    psychTestR::new_timeline(
      psychTestR::join(

        psychTestR::module("PBET",
                           # introduction, same for all users

                           PBET_intro(demo, SNR_test, get_range, absolute_url = absolute_url, musicassessr_state = musicassessr_state),

                           # interval perception
                           musicassessr::multi_interval_page(num_items$interval_perception),

                           # arrhythmic
                           psychTestR::conditional(test = function(state, ...) {
                             psychTestR::get_global("response_type", state) == "MIDI"
                           }, logic = musicassessr::arrhythmic_melody_trials(item_bank = item_bank("phrases"),
                                                                  num_items = num_items$arrhythmic,
                                                                  num_examples = examples,
                                                                  feedback = ifelse(feedback, musicassessr::feedback_melodic_production_simple, FALSE),
                                                                  page_text = "Press play to hear the melody, then play it back as best as you can when it finishes.",
                                                                  page_title = "Play the Melody",
                                                                  page_type = "record_midi_page",
                                                                  get_answer = musicassessr::get_answer_midi,
                                                                  instruction_text = "Now you will hear some melodies. Please try and play back the melodies as best as you can.",
                                                                  item_characteristics_pars = pars_arrhythmic,
                                                                  item_characteristics_sampler_function = item_characteristics_sampler_function,
                                                                  get_trial_characteristics_function = get_trial_characteristics_function)),

                           psychTestR::conditional(test = function(state, ...) {
                             psychTestR::get_global("response_type", state) == "Microphone"
                           }, logic = musicassessr::arrhythmic_melody_trials(item_bank = item_bank("phrases"),
                                                                             num_items = num_items$arrhythmic,
                                                                             num_examples = examples,
                                                                             get_answer = musicassessr::get_answer_pyin_mel_prod_only,
                                                                             feedback = ifelse(feedback, musicassessr::feedback_melodic_production_simple, FALSE),
                                                                             page_text = "Press play to hear the melody, then play it back as best as you can when it finishes.",
                                                                             page_title = "Play the Melody",
                                                                             page_type = "record_audio_page",
                                                                             instruction_text = "Now you will hear some melodies. Please try and play back the melodies as best as you can.",
                                                                             item_characteristics_pars = pars_arrhythmic,
                                                                             item_characteristics_sampler_function = item_characteristics_sampler_function,
                                                                             get_trial_characteristics_function = get_trial_characteristics_function)),


                           # rhythmic

                           psychTestR::conditional(test = function(state, ...) {
                             psychTestR::get_global("response_type", state) == "MIDI"
                           }, logic = musicassessr::rhythmic_melody_trials(item_bank = item_bank("phrases"),
                                                                           num_items = num_items$rhythmic,
                                                                           num_examples = examples,
                                                                           feedback = ifelse(feedback, musicassessr::feedback_melodic_production_simple, FALSE),
                                                                           page_text = "Press play to hear the melody, then play it back as best as you can when it finishes.",
                                                                           page_title = "Play the Melody Plus Rhythm",
                                                                           page_type = "record_midi_page",
                                                                           get_answer = musicassessr::get_answer_midi,
                                                                           instruction_text = "Now you will hear some melodies with rhythms. Please try and play back the melodies with their rhythms as best as you can.",
                                                                           item_characteristics_pars = pars_rhythmic,
                                                                           item_characteristics_sampler_function = item_characteristics_sampler_function,
                                                                           get_trial_characteristics_function = get_trial_characteristics_function)),

                           psychTestR::conditional(test = function(state, ...) {
                             psychTestR::get_global("response_type", state) == "Microphone"
                           }, logic = musicassessr::rhythmic_melody_trials(item_bank = item_bank("phrases"),
                                                                           num_items = num_items$rhythmic,
                                                                           num_examples = examples,
                                                                           feedback = ifelse(feedback, musicassessr::feedback_melodic_production_simple, FALSE),
                                                                           get_answer = musicassessr::get_answer_pyin_mel_prod_only,
                                                                           page_text = "Press play to hear the melody, then play it back as best as you can when it finishes.",
                                                                           page_title = "Play the Melody Plus Rhythm",
                                                                           page_type = "record_audio_page",
                                                                           instruction_text = "Now you will hear some melodies with rhythms. Please try and play back the melodies with their rhythms as best as you can.",
                                                                           item_characteristics_pars = pars_rhythmic,
                                                                           item_characteristics_sampler_function = item_characteristics_sampler_function,
                                                                           get_trial_characteristics_function = get_trial_characteristics_function)),




                           # find that note trials
                           musicassessr::find_this_note_trials(num_items$find_the_note, num_examples = examples,
                                                               feedback = feedback, page_type = "reactive"),

                           # wjd trials
                           musicassessr::wjd_audio_melody_trials(item_bank = item_bank("phrases"),
                                                                num_items = num_items$wjd_audio,
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

}

PBET_intro <- function(demo = FALSE,
                      SNR_test = TRUE,
                      get_range = TRUE,
                      absolute_url,
                      musicassessr_state = "production") {


  c(

    # introduction page
    psychTestR::one_button_page(body = shiny::tags$div(shiny::tags$h2(psychTestR::i18n("PBET_welcome")),
                                                       shiny::tags$img(src = 'custom-assets/img/music.png', height = 100, width = 100),
                                                       shiny::tags$img(src = 'custom-assets/img/saxophone.png', height = 100, width = 100),
                                                       shiny::tags$p(psychTestR::i18n("PBET_welcome_1")),
                                                       shiny::tags$p(psychTestR::i18n("PBET_welcome_2")),
                                button_text = psychTestR::i18n("Next"))),

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



get_trial_characteristics_pbet <- function(trial_df, trial_no) {
  # given the trial number, return what info is needed for the sampler
  list("melody_length" = trial_df[trial_df$trial_no == trial_no, "melody_length"],
       "key_difficulty" = trial_df[trial_df$trial_no == trial_no, "key_difficulty"]
  )
}




item_characteristics_sampler_pbet <- function(pars = list("key_easy" = 5L,
                                                          "key_hard" = 5L,
                                                          "melody_length" = 3:15)) {

  # given a range of stimuli lengths and a number of difficulties, produce the test parameters
  no_items <- pars$key_easy + pars$key_hard

  # what values are there?
  no_of_Ns <- length(pars$melody_length)
  # given the no. of items, how many of each N will we need? let's count

  idxes <- rep(1:no_of_Ns, ceiling(no_items/no_of_Ns))
  print(idxes)
  count <- 1
  N_list <- c()

  while(count < no_items+1) {
    N_list <- c(N_list, pars$melody_length[idxes[count]])
    count <- count + 1
  }

  data.frame(trial_no = 1:no_items,
             melody_length = N_list[base::order(N_list)],
             key_difficulty = c(rep("easy", pars$key_easy),
                                rep("hard", pars$key_hard)))
}


.onLoad <- function(...) {
  shiny::addResourcePath(
    prefix = "custom-assets", # custom prefix that will be used to reference your directory
    directoryPath = system.file("www", package = "PBET") # path to resource in your package
  )
  # shiny::addResourcePath(
  #   prefix = "item_banks", # custom prefix that will be used to reference your directory
  #   directoryPath = system.file("item_banks", package = "itembankr") # path to resource in your package
  # )
}

