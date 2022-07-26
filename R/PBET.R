


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
#' @param musicassessr_aws
#' @param item_characteristics_sampler_function
#' @param get_trial_characteristics_function
#' @param max_goes_forced
#' @param max_goes
#' @param test_username
#' @param store_results_in_db
#' @param get_answer_function_midi
#' @param get_answer_function_audio
#' @param give_first_melody_note
#' @param with_final_page
#' @param show_socials
#' @param gold_msi
#' @param headphones_test
#' @param get_user_info
#' @param microphone_test
#' @param allow_repeat_SNR_tests
#' @param append_trial_block_before
#' @param append_trial_block_after
#' @param stop_recording_after
#' @param skip_setup
#' @param concise_wording
#' @param app_name
#' @param get_self_chosen_anonymous_id
#' @param adjust_range
#' @param main_module_name
#' @param input
#'
#' @return
#' @export
#'
#' @examples
PBET_standalone <- function(num_items = list("interval_perception" = 24L,
                                             "find_this_note" = 6L,
                                             "arrhythmic" = list("key_easy" = 5L,
                                                                 "key_hard" = 5L),
                                             "rhythmic" = list("key_easy" = 5L,
                                                               "key_hard" = 5L),
                                             "wjd_audio" = list("key_easy" = 5L,
                                                                "key_hard" = 5L)),
                            melody_length = 3:15,
                            item_bank = WJD::WJD,
                            demographics = TRUE,
                            demo = FALSE,
                            feedback = FALSE,
                            admin_password = "demo",
                            SNR_test = TRUE,
                            get_range = TRUE,
                            absolute_url = character(),
                            examples = list(
                              "find_this_note" = 2L,
                              "interval_perception" = 2L,
                              "arrhythmic" = list("easy" = 1L, "hard" = 1L),
                              "rhythmic" = list("easy" = 1L, "hard" = 1L),
                              "wjd_audio" = 0L
                            ),
                            final_results = TRUE,
                            musicassessr_aws = FALSE,
                            item_characteristics_sampler_function = item_characteristics_sampler_pbet,
                            get_trial_characteristics_function = get_trial_characteristics_pbet,
                            max_goes_forced = FALSE,
                            max_goes = 4L,
                            test_username = character(),
                            store_results_in_db = FALSE,
                            get_answer_function_midi = musicassessr::get_answer_midi_melodic_production,
                            get_answer_function_audio = musicassessr::get_answer_pyin_melodic_production,
                            give_first_melody_note = TRUE,
                            with_final_page = TRUE,
                            show_socials = TRUE,
                            gold_msi = TRUE,
                            headphones_test = TRUE,
                            get_user_info = TRUE,
                            microphone_test = TRUE,
                            allow_repeat_SNR_tests = TRUE,
                            append_trial_block_before = psychTestR::module("before"),
                            append_trial_block_after = psychTestR::module("after"),
                            stop_recording_after = 30,
                            skip_setup = FALSE,
                            concise_wording = FALSE,
                            app_name = "",
                            get_self_chosen_anonymous_id = FALSE,
                            adjust_range = TRUE,
                            main_module_name = "PBET",
                            input = c("midi_keyboard_or_microphone",
                                      "microphone",
                                      "midi_keyboard"), ...) {


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
                    musicassessr_aws,
                    item_characteristics_sampler_function,
                    get_trial_characteristics_function,
                    max_goes_forced,
                    max_goes,
                    test_username,
                    store_results_in_db,
                   get_answer_function_midi,
                   get_answer_function_audio,
                   give_first_melody_note,
                   with_final_page,
                   show_socials,
                   gold_msi,
                   headphones_test,
                   get_user_info,
                   microphone_test,
                   allow_repeat_SNR_tests,
                   append_trial_block_before,
                   append_trial_block_after,
                   stop_recording_after,
                   skip_setup,
                   concise_wording,
                   app_name,
                   get_self_chosen_anonymous_id,
                   adjust_range,
                   main_module_name,
                   input,
                   ...)


  # run the test
  psychTestR::make_test(
    elts = timeline,
    opt = psychTestR::test_options(title = "Play By Ear Test",
                                   admin_password = admin_password,
                                   display = psychTestR::display_options(
                                    left_margin = 1L,
                                     right_margin = 1L,
                                     css = system.file('www/css/musicassessr.css', package = "musicassessr")
                                    ),
                                     additional_scripts = musicassessr::musicassessr_js(musicassessr_aws = musicassessr_aws,
                                                                                        visual_notation = TRUE,
                                                                                        midi_input = TRUE,
                                                                                        app_name = app_name),
                                   languages = c("en"),
                                   ...))
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
#' @param musicassessr_aws
#' @param item_characteristics_sampler_function
#' @param get_trial_characteristics_function
#' @param max_goes_forced
#' @param max_goes
#' @param test_username
#' @param store_results_in_db
#' @param get_answer_function_midi
#' @param get_answer_function_audio
#' @param give_first_melody_note
#' @param with_final_page
#' @param show_socials
#' @param gold_msi
#' @param headphones_test
#' @param get_user_info
#' @param microphone_test
#' @param allow_repeat_SNR_tests
#' @param append_trial_block_before
#' @param append_trial_block_after
#' @param stop_recording_after
#' @param skip_setup
#' @param concise_wording
#' @param app_name
#' @param get_self_chosen_anonymous_id
#' @param adjust_range
#' @param main_module_name
#' @param input
#'
#' @return
#' @export
#'
#' @examples
PBET <- function(num_items = list("interval_perception" = 0L,
                                  "find_this_note" = 0L,
                                  "arrhythmic" = list("key_easy" = 5L, "key_hard" = 5L),
                                  "rhythmic" = list("key_easy" = 5L, "key_hard" = 5L),
                                  "wjd_audio" = list("easy" = 0L, "hard" = 0L)),
                 melody_length = 3:15,
                 item_bank = WJD::WJD,
                 demographics = TRUE,
                 demo = FALSE,
                 feedback = FALSE,
                 admin_password = "demo",
                 SNR_test = TRUE,
                 get_range = TRUE,
                 absolute_url = character(),
                 examples = list(
                   "find_this_note" = 2L,
                   "interval_perception" = 2L,
                   "arrhythmic" = list("easy" = 1L, "hard" = 1L),
                   "rhythmic" = list("easy" = 0L, "hard" = 0L), # because it's effectively the same task as arrhythmic
                   "wjd_audio" = list("easy" = 0L, "hard" = 0L)
                  ),
                 final_results = TRUE,
                 musicassessr_aws = FALSE,
                 item_characteristics_sampler_function = item_characteristics_sampler_pbet,
                 get_trial_characteristics_function = get_trial_characteristics_pbet,
                 max_goes_forced = FALSE,
                 max_goes = 4L,
                 test_username = character(),
                 store_results_in_db = FALSE,
                 get_answer_function_midi = musicassessr::get_answer_midi_melodic_production,
                 get_answer_function_audio = musicassessr::get_answer_pyin_melodic_production,
                 give_first_melody_note = TRUE,
                 with_final_page = TRUE,
                 show_socials = TRUE,
                 gold_msi = TRUE,
                 headphones_test = TRUE,
                 get_user_info = TRUE,
                 microphone_test = TRUE,
                 allow_repeat_SNR_tests = TRUE,
                 append_trial_block_before = psychTestR::module("before"),
                 append_trial_block_after = psychTestR::module("after"),
                 stop_recording_after = 30,
                 skip_setup = FALSE,
                 concise_wording = FALSE,
                 app_name = "",
                 get_self_chosen_anonymous_id = FALSE,
                 adjust_range = TRUE,
                 main_module_name = "PBET",
                 input = c("midi_keyboard_or_microphone",
                           "microphone",
                           "midi_keyboard"), ...) {

  stopifnot(
    is.list(num_items) & length(num_items) == 5,
    is.numeric(melody_length),
    is.function(item_bank) | is.data.frame(item_bank),
    is.logical(demographics),
    is.logical(demo),
    is.logical(feedback),
    is.character(admin_password) & length(admin_password) == 1,
    is.logical(SNR_test),
    is.logical(get_range),
    is.character(absolute_url),
    is.list(examples) & length(examples) == 5,
    is.logical(final_results),
    is.logical(musicassessr_aws),
    is.function(item_characteristics_sampler_function),
    is.function(get_trial_characteristics_function),
    is.logical(max_goes_forced),
    is.integer(max_goes),
    is.character(test_username),
    is.logical(store_results_in_db),
    is.function(get_answer_function_midi),
    is.function(get_answer_function_audio),
    is.numeric(num_items$interval_perception),
    is.numeric(num_items$find_this_note),
    is.list(num_items$arrhythmic),
    is.list(num_items$rhythmic),
    is.list(num_items$wjd_audio),
    is.logical(give_first_melody_note),
    is.logical(with_final_page),
    is.logical(show_socials),
    is.logical(gold_msi),
    is.logical(headphones_test),
    is.logical(get_user_info),
    is.logical(microphone_test),
    is.logical(allow_repeat_SNR_tests),
    is.list(append_trial_block_before),
    is.list(append_trial_block_after),
    is.numeric(stop_recording_after) & length(stop_recording_after) == 1,
    is.logical(skip_setup),
    is.logical(concise_wording),
    assertthat::is.string(app_name),
    is.logical(get_self_chosen_anonymous_id),
    is.logical(adjust_range),
    assertthat::is.string(main_module_name),
    is.character(input))

  pars_arrhythmic <- c(num_items$arrhythmic, list("melody_length" = melody_length))
  pars_rhythmic <- c(num_items$rhythmic, list("melody_length" = melody_length))

  if(demo) warning('Running PBET in demo mode!')


  timeline <- psychTestR::join(
    psychTestR::new_timeline(
      psychTestR::join(

        psychTestR::module(main_module_name,

                           # init musicassessr
                           musicassessr::musicassessr_init(test = "PBET",
                                                           test_username = test_username,
                                                           store_results_in_db,
                                                           app_name),

                           # introduction, same for all (i.e., midi and audio)
                           PBET_intro(demo,
                                      SNR_test,
                                      get_range,
                                      absolute_url,
                                      musicassessr_aws,
                                      headphones_test,
                                      get_user_info,
                                      microphone_test,
                                      max_goes,
                                      max_goes_forced,
                                      allow_repeat_SNR_tests,
                                      skip_setup,
                                      concise_wording,
                                      get_self_chosen_anonymous_id,
                                      adjust_range,
                                      input),

                           # arbitrary and optional trial block to go first
                           append_trial_block_before,

                           # interval perception
                           musicassessr::interval_perception_trials(n_items = num_items$interval_perception),


                           # find that note trials
                           musicassessr::find_this_note_trials(num_items$find_this_note,
                                                               num_examples = examples$find_this_note,
                                                               feedback = ifelse(feedback, musicassessr::feedback_melodic_production_simple, FALSE),
                                                               page_type = "reactive"),


                           # arrhythmic
                           pbet_arrhythmic_trials(item_bank("main"), num_items$arrhythmic,
                                                  examples$arrhythmic, feedback,
                                                  item_characteristics_sampler_function,
                                                  get_trial_characteristics_function,
                                                  max_goes,
                                                  max_goes_forced, pars_arrhythmic,
                                                  get_answer_function_midi = get_answer_function_midi,
                                                  get_answer_function_audio = get_answer_function_audio,
                                                  give_first_melody_note = give_first_melody_note),


                           # rhythmic
                           pbet_rhythmic_trials(item_bank("phrases"), num_items$rhythmic,
                                                examples$rhythmic, feedback,
                                                item_characteristics_sampler_function,
                                                get_trial_characteristics_function,
                                                max_goes,
                                                max_goes_forced, pars_rhythmic,
                                                get_answer_function_midi = get_answer_function_midi,
                                                get_answer_function_audio = get_answer_function_audio,
                                                give_first_melody_note = give_first_melody_note),

                           # wjd trials
                           musicassessr::wjd_audio_melody_trials(item_bank = item_bank("phrases"),
                                                                 num_items = num_items$wjd_audio,
                                                                 num_examples = examples$wjd_audio,
                                                                 feedback = feedback),

                           # arbitrary and optional trial block to go after
                           append_trial_block_after,


                           psychTestR::elt_save_results_to_disk(complete = FALSE), # the test really finishes later (see below)

                           if(final_results) final_results_pbet(
                             test_name = "PBET",
                             url = absolute_url,
                             num_items$find_this_note,
                             sum(unlist(num_items$arrhythmic)),
                             sum(unlist(num_items$rhythmic)),
                             show_socials
                           )

        )
      ),
      dict = PBET_dict
    ),
      psychTestR::elt_save_results_to_disk(complete = TRUE),
      if(gold_msi) psyquest::GMS(subscales = c("Musical Training")),
      musicassessr::deploy_demographics(demographics),
      psychTestR::elt_save_results_to_disk(complete = TRUE),
      psychTestR::new_timeline(
        musicassessr::final_page_or_continue_to_new_test(final = with_final_page,
                                                         task_name = psychTestR::i18n("title")), dict = PBET_dict)
  ) # end main join

}


PBET_intro <- function(demo = FALSE,
                      SNR_test = TRUE,
                      get_range = TRUE,
                      absolute_url,
                      musicassessr_aws = FALSE,
                      headphones_test = TRUE,
                      get_user_info = TRUE,
                      microphone_test = TRUE,
                      max_goes = 4L,
                      max_goes_forced = FALSE,
                      allow_repeat_SNR_tests = TRUE,
                      skip_setup = FALSE,
                      concise_wording = FALSE,
                      get_self_chosen_anonymous_id = FALSE,
                      adjust_range = TRUE,
                      input = "midi_keyboard_or_microphone") {


  c(

    # introduction page
    psychTestR::one_button_page(body = shiny::tags$div(shiny::tags$h2(psychTestR::i18n("PBET_welcome")),
                                                       shiny::tags$img(src = 'https://adaptiveeartraining.com/assets/img/music.png', height = 100, width = 100),
                                                       shiny::tags$img(src = 'https://adaptiveeartraining.com/assets/img/saxophone.png', height = 100, width = 100),
                                                       shiny::tags$p(psychTestR::i18n("PBET_welcome_1")),
                                                       shiny::tags$p(psychTestR::i18n("PBET_welcome_2")),
                                button_text = psychTestR::i18n("Next"))),

    musicassessr::setup_pages(input = input,
                              demo = demo,
                              get_instrument_range = get_range,
                              SNR_test = SNR_test,
                              absolute_url = absolute_url,
                              select_instrument = TRUE,
                              get_instrument_range_musical_notation = TRUE,
                              headphones = headphones_test,
                              get_user_info = get_user_info,
                              test_type = "instrument",
                              microphone_test = microphone_test,
                              allow_repeat_SNR_tests = allow_repeat_SNR_tests,
                              skip_setup = skip_setup,
                              concise_wording = concise_wording,
                              get_self_chosen_anonymous_id = get_self_chosen_anonymous_id,
                              musical_instrument = TRUE,
                              adjust_range = adjust_range),
    # instructions
    if(!skip_setup) PBET_instructions(max_goes, max_goes_forced)
  )

}

PBET_instructions <- function(max_goes, max_goes_forced) {

  if(max_goes_forced) {
    test_instructions2.1 <- "test_instructions_2.1.1.forced"
  } else {
    test_instructions2.1 <- "test_instructions_2.1.1"
  }

  c(
    psychTestR::one_button_page(body = shiny::tags$div(shiny::tags$h2("Instructions"),
                                                       shiny::tags$p(psychTestR::i18n("test_instructions_1.1")),
                                                       shiny::tags$p(psychTestR::i18n("test_instructions_1.2"))),
                                button_text = psychTestR::i18n("Next")),

    psychTestR::one_button_page(body = shiny::tags$div(shiny::tags$h2("Instructions"),
                                                       shiny::tags$p(paste0(psychTestR::i18n(test_instructions2.1), " ", max_goes, " ", psychTestR::i18n("test_instructions_2.1.2"))),
                                                       shiny::tags$p(psychTestR::i18n("test_instructions_2.2"))),
                                button_text = psychTestR::i18n("Next")),

    psychTestR::one_button_page(body = shiny::tags$div(shiny::tags$h2("Instructions"),
                                                       shiny::tags$p(psychTestR::i18n("test_instructions_4"))),
                                button_text = psychTestR::i18n("Next")),

    psychTestR::one_button_page(body = shiny::tags$div(shiny::tags$h2("Instructions"),
                                                       shiny::tags$p("Make your notes clear when you play. Particularly, if playing a stringed instrument (e.g., cello, guitar), be careful that you do not leave a string ringing when you change note: the note detection algorithm will not work well otherwise.")),
                                button_text = psychTestR::i18n("Next"))
  )

}



get_trial_characteristics_pbet <- function(trial_df, trial_no) {
  # given the trial number, return what info is needed for the sampler
  list("melody_length" = trial_df[trial_df$trial_no == trial_no, "melody_length"],
       "key_difficulty" = trial_df[trial_df$trial_no == trial_no, "key_difficulty"]
  )
}




#' Sampler for PBET
#'
#' @param pars
#'
#' @return
#' @export
#'
#' @examples
item_characteristics_sampler_pbet <- function(pars = list("key_easy" = 5L,
                                                          "key_hard" = 5L,
                                                          "melody_length" = 3:15)) {

  # given a range of stimuli lengths and a number of difficulties, produce the test parameters
  no_items <- pars$key_easy + pars$key_hard

  # what values are there?
  no_of_Ns <- length(pars$melody_length)
  # given the no. of items, how many of each N will we need? let's count

  idxes <- rep(1:no_of_Ns, ceiling(no_items/no_of_Ns))
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
}


conditional_trial_block <- function(page_type = c("record_midi_page", "record_audio_page"),
                                    selection = c("MIDI", "Microphone"),
                                    trial_block_function,
                                    item_bank,
                                    num_items,
                                    num_examples,
                                    feedback,
                                    pars,
                                    item_characteristics_sampler_function,
                                    get_trial_characteristics_function,
                                    max_goes,
                                    max_goes_forced,
                                    get_answer,
                                    give_first_melody_note, ...) {


  psychTestR::conditional(test = function(state, ...) {
    psychTestR::get_global("response_type", state) == selection
  }, logic = trial_block_function(item_bank = item_bank,
                                  num_items = num_items,
                                  num_examples = num_examples,
                                  feedback = ifelse(feedback, musicassessr::feedback_melodic_production_simple, FALSE),
                                  page_type = page_type,
                                  get_answer = get_answer,
                                  item_characteristics_pars = pars,
                                  item_characteristics_sampler_function = item_characteristics_sampler_function,
                                  get_trial_characteristics_function = get_trial_characteristics_function,
                                  max_goes = max_goes,
                                  max_goes_forced = max_goes_forced,
                                  give_first_melody_note = give_first_melody_note))
}


pbet_rhythmic_trials <- function(item_bank, num_items, num_examples, feedback,
                                 item_characteristics_sampler_function,
                                 get_trial_characteristics_function,
                                 max_goes,
                                 max_goes_forced,
                                 pars_rhythmic,
                                 get_answer_function_midi,
                                 get_answer_function_audio,
                                 give_first_melody_note) {


  c(
  conditional_trial_block(page_type = "record_midi_page",
                          selection = "MIDI",
                          trial_block_function = musicassessr::rhythmic_melody_trials,
                          item_bank = item_bank,
                          num_items = num_items,
                          num_examples = num_examples,
                          feedback = feedback,
                          pars = pars_rhythmic,
                          item_characteristics_sampler_function,
                          get_trial_characteristics_function,
                          max_goes,
                          max_goes_forced,
                          get_answer = get_answer_function_midi,
                          give_first_melody_note = give_first_melody_note),

  conditional_trial_block(page_type = "record_audio_page",
                          selection = "Microphone",
                          trial_block_function = musicassessr::rhythmic_melody_trials,
                          item_bank = item_bank,
                          num_items = num_items,
                          num_examples = num_examples,
                          feedback = feedback,
                          pars = pars_rhythmic,
                          item_characteristics_sampler_function,
                          get_trial_characteristics_function,
                          max_goes,
                          max_goes_forced,
                          get_answer = get_answer_function_audio,
                          give_first_melody_note = give_first_melody_note)
  )
}

pbet_arrhythmic_trials <- function(item_bank,
                                   num_items,
                                   num_examples,
                                   feedback,
                                   item_characteristics_sampler_function,
                                   get_trial_characteristics_function,
                                   max_goes,
                                   max_goes_forced,
                                   pars_arrhythmic,
                                   get_answer_function_midi,
                                   get_answer_function_audio,
                                   give_first_melody_note) {
  c(
    conditional_trial_block(page_type = "record_midi_page",
                            selection = "MIDI",
                            trial_block_function = musicassessr::arrhythmic_melody_trials,
                            item_bank = item_bank,
                            num_items = num_items,
                            num_examples = num_examples,
                            feedback = feedback,
                            pars = pars_arrhythmic,
                            item_characteristics_sampler_function,
                            get_trial_characteristics_function,
                            max_goes,
                            max_goes_forced,
                            get_answer = get_answer_function_midi,
                            give_first_melody_note = give_first_melody_note),

    conditional_trial_block(page_type = "record_audio_page",
                            selection = "Microphone",
                            trial_block_function = musicassessr::arrhythmic_melody_trials,
                            item_bank = item_bank,
                            num_items = num_items,
                            num_examples = num_examples,
                            feedback = feedback,
                            pars = pars_arrhythmic,
                            item_characteristics_sampler_function,
                            get_trial_characteristics_function,
                            max_goes,
                            max_goes_forced,
                            get_answer = get_answer_function_audio,
                            give_first_melody_note = give_first_melody_note)
  )
}



present_scores_pbet <- function(res, num_items_arrhythmic, num_items_rhythmic) {

  if(num_items_arrhythmic > 0) {

    # arrhythmic
    arrhythmic_melodies <- musicassessr::tidy_melodies(res$PBET.arrhythmic_melodies)

    if(is.null(arrhythmic_melodies$error)) {

    arrhythmic_melody_summary <- arrhythmic_melodies %>%
      dplyr::select(opti3) %>%
      dplyr::mutate_if(is.character,as.numeric) %>%
      dplyr::filter(!is.na(opti3)) %>%
      dplyr::pull(opti3) %>%
      mean(na.rm = TRUE)

    } else {
      arrhythmic_melody_summary <- list("opti3" = 0)
    }
  }

  if(num_items_rhythmic > 0) {

    rhythmic_melodies <- musicassessr::tidy_melodies(res$PBET.rhythmic_melodies)

    # rhythmic
    if(is.null(rhythmic_melodies$error)) {

      rhythmic_melody_summary <- rhythmic_melodies %>%
        dplyr::select(opti3) %>%
        dplyr::mutate_if(is.character,as.numeric) %>%
        dplyr::filter(!is.na(opti3)) %>%
        dplyr::pull(opti3) %>%
        mean(na.rm = TRUE)

    } else {
      rhythmic_melody_summary <- list("opti3" = 0)
    }
  }

  list("arrhythmic" = ifelse(is.null(arrhythmic_melody_summary), data.frame(opti3 = 0.01), arrhythmic_melody_summary),
       "rhythmic" = ifelse(is.null(rhythmic_melody_summary), data.frame(opti3 = 0.01), rhythmic_melody_summary))

}





final_results_pbet <- function(test_name = "PBET",
                               url = "https://adaptiveeartraining.com/PBET2022",
                               num_items_find_this_note = 0L,
                               num_items_arrhythmic = 0L,
                               num_items_rhythmic = 0L,
                               socials = TRUE) {

  c(
    psychTestR::reactive_page(function(state, ...) {

      res <- as.list(psychTestR::get_results(state, complete = FALSE))

      processed_results <- present_scores_pbet(res, num_items_arrhythmic, num_items_rhythmic)

      final_score <- produce_naive_final_pbet_score(res, num_items_arrhythmic, num_items_rhythmic)

      psychTestR::set_local("final_score", final_score, state) # leave this in; it gets used by musicassessr



      psychTestR::text_input_page(
        label = "final_score",
        prompt = shiny::tags$div(style = "width: 500px;",
                                 shiny::tags$h2('Final Results'),

                                 shiny::tags$h3('Arrhythmic Melody Scores'),

                                 musicassessr::render_scores_table(processed_results$arrhythmic),

                                 shiny::tags$h3('Rhythmic Melody Scores'),

                                 musicassessr::render_scores_table(processed_results$rhythmic),

                                 shiny::tags$h3('Total Score'),
                                 shiny::tags$p(final_score),
                                 shiny::tags$p("Enter a username to see the scoreboard: ")

        )
      )

    }),

    musicassessr::share_score_page(test_name, url, hashtag = "PlayByEar", socials)
  )
}

produce_naive_final_pbet_score <- function(score_result_object,
                                           num_items_arrhythmic,
                                           num_items_rhythmic) {

  scor <- present_scores_pbet(score_result_object, num_items_arrhythmic, num_items_rhythmic)

  arr_scors <- scor$arrhythmic
  final_arr <- round(arr_scors[[1]] * 1000)

  rhy_scors <- scor$rhythmic

  final_rhy <- round(rhy_scors[[1]] * 1000)

  final_score <- final_arr + final_rhy

  final_score

}




