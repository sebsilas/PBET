


#' Deploy the PBET as a standalone test
#'
#' @param num_items
#' @param melody_length
#' @param arrhythmic_item_bank
#' @param rhythmic_item_bank
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
#' @param use_musicassessr_db
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
#' @param input_type
#' @param sampler_function_arrhythmic
#' @param sampler_function_rhythmic
#' @param test_name
#' @param validate_user_entry_into_test
#' @param learn_test_paradigm
#' @param rel_to_abs_mel_function
#' @param add_consent_form
#' @param proportion_visual
#' @param default_range
#' @param default_singing_range
#' @param melody_block_paradigm
#' @param show_introduction
#' @param num_items_review
#' @param instrument_id Set what instrument is being used a priori.
#' @param user_id
#' @param experiment_id
#' @param present_continue_to_new_test_page
#' @param asynchronous_api_mode
#' @param left_margin
#' @param right_margin
#' @param css
#' @param content_border
#' @param full_screen
#' @param show_instructions
#'
#' @return
#' @export
#'
#' @examples
PBET_standalone <- function(num_items = list(interval_perception = 24L,
                                             find_this_note = 6L,
                                             arrhythmic = list("key_easy" = 5L,
                                                                 "key_hard" = 5L),
                                             rhythmic = list("key_easy" = 5L,
                                                               "key_hard" = 5L),
                                             wjd_audio = list("key_easy" = 5L,
                                                                "key_hard" = 5L)),
                            melody_length = 5:18,
                            arrhythmic_item_bank = PBET::WJD_ngram_minified, # this is correct, this is a version dispatched with PBET to avoid the WJD dependency
                            rhythmic_item_bank = PBET::WJD_phrase_item_bank, # this is correct, this is a version dispatched with PBET to avoid the WJD dependency
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
                              "arrhythmic" = list("key_easy" = 1L, "key_hard" = 1L),
                              "rhythmic" = list("key_easy" = 1L, "key_hard" = 1L),
                              "wjd_audio" = 0L
                            ),
                            final_results = FALSE,
                            musicassessr_aws = FALSE,
                            item_characteristics_sampler_function = item_characteristics_sampler_pbet,
                            get_trial_characteristics_function = get_trial_characteristics_pbet,
                            max_goes_forced = FALSE,
                            max_goes = 4L,
                            test_username = character(),
                            use_musicassessr_db = FALSE,
                            get_answer_function_midi = musicassessr::get_answer_midi_melodic_production,
                            get_answer_function_audio = musicassessr::get_answer_pyin_melodic_production,
                            give_first_melody_note = TRUE,
                            with_final_page = TRUE, # In standalone mode this should be TRUE
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
                            input_type = c("midi_keyboard_or_microphone",
                                           "microphone",
                                           "midi_keyboard"),
                            sampler_function_arrhythmic = musicassessr::sample_arrhythmic,
                            sampler_function_rhythmic = musicassessr::sample_rhythmic,
                            test_name = "Play By Ear Test",
                            validate_user_entry_into_test = FALSE,
                            learn_test_paradigm = FALSE,
                            rel_to_abs_mel_function = NULL,
                            add_consent_form = FALSE,
                            proportion_visual = list(learn = 0, test = 0),
                            default_range = NULL,
                            default_singing_range = NULL,
                            melody_block_paradigm = c('standard', 'sing_melody_first', 'learn_phase_visual_display_modality'),
                            show_introduction = TRUE,
                            num_items_review = list("arrhythmic" = 0L, "rhythmic" = 0L),
                            instrument_id = NULL,
                            user_id = NULL,
                            experiment_id = NULL,
                            present_continue_to_new_test_page = TRUE,
                            asynchronous_api_mode = FALSE,
                            left_margin = 1L,
                            right_margin = 1L,
                            css = system.file('www/css/musicassessr.css', package = "musicassessr"),
                            content_border = "solid 3px #bfd5d9",
                            full_screen = FALSE,
                            show_instructions = TRUE,
                            ...) {


  timeline <- PBET(num_items,
                   melody_length,
                    arrhythmic_item_bank,
                    rhythmic_item_bank,
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
                    use_musicassessr_db,
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
                   input_type,
                   sampler_function_arrhythmic,
                   sampler_function_rhythmic,
                   learn_test_paradigm,
                   rel_to_abs_mel_function,
                   add_consent_form,
                   proportion_visual,
                   default_range,
                   default_singing_range,
                   melody_block_paradigm,
                   show_introduction,
                   num_items_review,
                   instrument_id,
                   user_id,
                   experiment_id,
                   present_continue_to_new_test_page,
                   asynchronous_api_mode,
                   show_instructions,
                   ...)


  # Run the test

  timeline %>%
    musicassessrdb::validate_user_entry_into_test(validate_user_entry_into_test, .) %>%
    psychTestR::make_test(
      elts = .,
      opt = psychTestR::test_options(title = test_name,
                                     admin_password = admin_password,
                                     display = psychTestR::display_options(
                                       full_screen = full_screen,
                                       left_margin = 1L,
                                       right_margin = 1L,
                                       css = css,
                                       content_border = content_border
                                     ),
                                       additional_scripts = musicassessr::musicassessr_js(musicassessr_aws = musicassessr_aws,
                                                                                          visual_notation = TRUE,
                                                                                          midi_input = TRUE,
                                                                                          app_name = app_name),
                                     languages = c("en"),
                                     on_start_fun = if(use_musicassessr_db) musicassessrdb::musicassessr_shiny_init else NULL,
                                     on_stop_fun =  if(use_musicassessr_db) musicassessrdb::musicassessr_shiny_on_stop else NULL,
                                     ...))
}




#' Deploy the PBET
#'
#' @param num_items
#' @param melody_length
#' @param arrhythmic_item_bank
#' @param rhythmic_item_bank
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
#' @param use_musicassessr_db
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
#' @param input_type
#' @param sampler_function_arrhythmic
#' @param sampler_function_rhythmic
#' @param learn_test_paradigm
#' @param rel_to_abs_mel_function
#' @param add_consent_form
#' @param proportion_visual
#' @param default_range
#' @param default_singing_range
#' @param melody_block_paradigm
#' @param show_introduction
#' @param num_items_review
#' @param instrument_id Set what instrument is being used a priori.
#' @param user_id The user's ID, if using musicassessr_db and applicable.
#' @param experiment_id The experiment ID, if using musicassessr_db and applicable.
#' @param present_continue_to_new_test_page Should a "continue to test test" page be presented at the end of the PBET in a broader timeline?
#' @param asynchronous_api_mode
#' @param show_instructions
#' @return
#' @export
#'
#' @examples
PBET <- function(num_items = list(interval_perception = 0L,
                                  find_this_note = 0L,
                                  arrhythmic = list(key_easy = 5L, key_hard = 5L),
                                  rhythmic = list(key_easy = 5L, key_hard = 5L),
                                  wjd_audio = list(key_easy = 0L, key_hard = 0L)),
                 melody_length = 5:18,
                 arrhythmic_item_bank = PBET::WJD_ngram_minified,
                 rhythmic_item_bank = PBET::WJD_phrase_item_bank,
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
                   "arrhythmic" = list("key_easy" = 1L, "key_hard" = 1L),
                   "rhythmic" = list("key_easy" = 0L, "key_hard" = 0L), # because it's effectively the same task as arrhythmic
                   "wjd_audio" = list("key_easy" = 0L, "key_hard" = 0L)
                  ),
                 final_results = FALSE,
                 musicassessr_aws = FALSE,
                 item_characteristics_sampler_function = item_characteristics_sampler_pbet,
                 get_trial_characteristics_function = get_trial_characteristics_pbet,
                 max_goes_forced = FALSE,
                 max_goes = 4L,
                 test_username = character(),
                 use_musicassessr_db = FALSE,
                 get_answer_function_midi = musicassessr::get_answer_midi_melodic_production,
                 get_answer_function_audio = musicassessr::get_answer_pyin_melodic_production,
                 give_first_melody_note = TRUE,
                 with_final_page = FALSE, # In non-standalone mode this should be FALSE
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
                 input_type = c("midi_keyboard_or_microphone",
                                "microphone",
                                "midi_keyboard"),
                 sampler_function_arrhythmic = musicassessr::sample_arrhythmic,
                 sampler_function_rhythmic = musicassessr::sample_rhythmic,
                 learn_test_paradigm = FALSE,
                 rel_to_abs_mel_function = NULL,
                 add_consent_form = FALSE,
                 proportion_visual = list(learn = 0, test = 0),
                 default_range = NULL,
                 default_singing_range = NULL,
                 melody_block_paradigm = c('standard', 'sing_melody_first', 'learn_phase_visual_display_modality'),
                 show_introduction = TRUE,
                 num_items_review = list("arrhythmic" = 0L, "rhythmic" = 0L),
                 instrument_id = NULL,
                 user_id = NULL,
                 experiment_id = NULL,
                 present_continue_to_new_test_page = TRUE,
                 asynchronous_api_mode = FALSE,
                 show_instructions = TRUE, ...) {

  melody_block_paradigm <- match.arg(melody_block_paradigm)
  input_type <- match.arg(input_type)


  stopifnot(
    is.list(num_items) & length(num_items) == 5,
    is.numeric(melody_length),
    is(arrhythmic_item_bank, "item_bank"),
    is(rhythmic_item_bank, "item_bank"),
    is.scalar.logical(demographics),
    is.scalar.logical(demo),
    is.scalar.logical(feedback),
    is.character(admin_password) & length(admin_password) == 1,
    is.scalar.logical(SNR_test),
    is.scalar.logical(get_range),
    is.character(absolute_url),
    is.list(examples) & length(examples) == 5,
    is.scalar.logical(final_results),
    is.scalar.logical(musicassessr_aws),
    is.function(item_characteristics_sampler_function) | is.null(item_characteristics_sampler_function),
    is.function(get_trial_characteristics_function) | is.null(get_trial_characteristics_function),
    is.scalar.logical(max_goes_forced),
    is.integer(max_goes) | is.infinite(max_goes),
    is.character(test_username),
    is.scalar.logical(use_musicassessr_db),
    is.function(get_answer_function_midi),
    is.function(get_answer_function_audio),
    is.numeric(num_items$interval_perception),
    is.numeric(num_items$find_this_note),
    is.list(num_items$arrhythmic) | is.numeric(num_items$arrhythmic), # Numeric for reviews
    is.list(num_items$rhythmic)  | is.numeric(num_items$rhythmic), # Numeric for reviews
    is.list(num_items$wjd_audio),
    is.scalar.logical(give_first_melody_note),
    is.scalar.logical(with_final_page),
    is.scalar.logical(show_socials),
    is.scalar.logical(gold_msi),
    is.scalar.logical(headphones_test),
    is.scalar.logical(get_user_info),
    is.scalar.logical(microphone_test),
    is.scalar.logical(allow_repeat_SNR_tests),
    is.list(append_trial_block_before),
    is.list(append_trial_block_after),
    is.numeric(stop_recording_after) & length(stop_recording_after) == 1,
    is.scalar.logical(skip_setup) | skip_setup == "except_microphone",
    is.scalar.logical(concise_wording),
    assertthat::is.string(app_name),
    is.scalar.logical(get_self_chosen_anonymous_id),
    is.scalar.logical(adjust_range),
    assertthat::is.string(main_module_name),
    input_type %in% c("midi_keyboard_or_microphone", "microphone", "midi_keyboard"),
    is.function(sampler_function_arrhythmic) | is.null(sampler_function_arrhythmic),
    is.function(sampler_function_rhythmic) | is.null(sampler_function_rhythmic),
    is.scalar.logical(learn_test_paradigm),
    is.null.or(rel_to_abs_mel_function, is.function),
    is.scalar.logical(add_consent_form),
    is.list(proportion_visual) & length(proportion_visual) == 2 & setequal(names(proportion_visual), c('test', 'learn')),
    is.null.or(default_range, function(x)   {
      is.list(x) & length(x) == 2 & setequal(names(x), c('bottom_range', 'top_range'))
      }),
    is.null.or(default_singing_range, function(x)   {
      is.list(x) & length(x) == 2 & setequal(names(x), c('bottom_range', 'top_range'))
    }),
    melody_block_paradigm %in% c('standard', 'sing_melody_first', 'learn_phase_visual_display_modality'),
    is.scalar.logical(show_introduction),
    setequal(names(num_items_review), c("arrhythmic", "rhythmic")) & is.integer(num_items_review$arrhythmic) & is.integer(num_items_review$rhythmic),
    is.null.or(instrument_id, is.integer),
    is.null.or(user_id, is.integer),
    is.null.or(experiment_id, is.integer),
    is.scalar.logical(present_continue_to_new_test_page),
    is.scalar.logical(asynchronous_api_mode),
    is.scalar.logical(show_instructions)
    )

  if(melody_block_paradigm == 'learn_phase_visual_display_modality' && give_first_melody_note) stop("give_first_melody_note must be FALSE if the melody_block_paradigm is learn_phase_visual_display_modality")


  pars_arrhythmic_learn <- c(num_items$arrhythmic, list("melody_length" = melody_length, "proportion_visual" = proportion_visual$learn))
  pars_rhythmic_learn <- c(num_items$rhythmic, list("melody_length" = melody_length, "proportion_visual" = proportion_visual$learn))
  pars_arrhythmic_test <- c(num_items$arrhythmic, list("melody_length" = melody_length, "proportion_visual" = proportion_visual$test))
  pars_rhythmic_test <- c(num_items$rhythmic, list("melody_length" = melody_length, "proportion_visual" = proportion_visual$test))

  # if(learn_test_paradigm) {
  #   deploy_demographics <- FALSE
  #   gold_msi <- FALSE
  #   # We deploy them as a filler task, instead
  # }

  if(demo) warning('Running PBET in demo mode!')


  timeline <- psychTestR::join(

        psychTestR::module(main_module_name,

           psychTestR::new_timeline(
             psychTestR::join(

               # Init musicassessr
               musicassessr::musicassessr_init(use_musicassessr_db = use_musicassessr_db,
                                               app_name = app_name,
                                               experiment_id = experiment_id,
                                               user_id = user_id,
                                               asynchronous_api_mode = asynchronous_api_mode),

                            # Set input type, if not user-controlled
                            if(input_type %in% c("microphone", "midi_keyboard")) musicassessr::set_response_type(input_type),

                           # Set test
                           if(use_musicassessr_db) musicassessr::set_test(test_name = "PBET", test_id = 2L),

                           # Set instrument
                           musicassessr::set_instrument(instrument_id),

                           # Set default range
                           if(!is.null(default_range)) musicassessr::set_instrument_range(bottom_range = default_range$bottom_range, top_range = default_range$top_range),


                           # Introduction, same for all (i.e., midi and audio)
                           if (show_introduction)  { PBET_intro(demo,
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
                                                                input_type,
                                                                instrument_id,
                                                                asynchronous_api_mode,
                                                                (num_items$arrhythmic + num_items$rhythmic),
                                                                melody_length,
                                                                show_instructions,
                                                                use_musicassessr_db)
                             },

                           # Arbitrary and optional trial block to before main content
                           append_trial_block_before

                           ), dict = PBET::PBET_dict), # End first timeline


                           # Main test paradigms

           # Optional learning phase
                       if (learn_test_paradigm)  { psychTestR::new_timeline(
                                                      main_test_paradigms(module_label = "learn",
                                                                         num_items,
                                                                         examples,
                                                                         feedback,
                                                                         page_type,
                                                                         arrhythmic_item_bank,
                                                                         rhythmic_item_bank,
                                                                         item_characteristics_sampler_function,
                                                                         get_trial_characteristics_function,
                                                                         max_goes,
                                                                         max_goes_forced,
                                                                         pars_arrhythmic_learn,
                                                                         pars_rhythmic_learn,
                                                                         give_first_melody_note,
                                                                         get_answer_function_midi,
                                                                         get_answer_function_audio,
                                                                         sampler_function_arrhythmic,
                                                                         sampler_function_rhythmic,
                                                                         rel_to_abs_mel_function,
                                                                         melody_block_paradigm,
                                                                         review = FALSE,
                                                                         phase = "learn",
                                                                         learn_test_paradigm,
                                                                         arrhythmic_page_text = psychTestR::i18n("arrhythmic_melody_trial_page_text"),
                                                                         arrhythmic_page_title = psychTestR::i18n("arrhythmic_melody_trial_page_title"),
                                                                         arrhythmic_instruction_text = psychTestR::i18n("arrhythmic_melody_trial_instruction_text"),
                                                                         rhythmic_page_text = psychTestR::i18n("rhythmic_melody_trial_page_text"),
                                                                         rhythmic_page_title = psychTestR::i18n("rhythmic_melody_trial_page_title"),
                                                                         rhythmic_instruction_text = psychTestR::i18n("rhythmic_melody_trial_instruction_text")), dict = PBET_dict)},


                           if (learn_test_paradigm) musicassessr::filler_task(),

                             psychTestR::new_timeline(
                               main_test_paradigms(module_label = "test",
                                                   num_items,
                                                   examples,
                                                   feedback,
                                                   page_type,
                                                   arrhythmic_item_bank,
                                                   rhythmic_item_bank,
                                                   item_characteristics_sampler_function,
                                                   get_trial_characteristics_function,
                                                   max_goes,
                                                   max_goes_forced,
                                                   pars_arrhythmic_test,
                                                   pars_rhythmic_test,
                                                   give_first_melody_note,
                                                   get_answer_function_midi,
                                                   get_answer_function_audio,
                                                   sampler_function_arrhythmic,
                                                   sampler_function_rhythmic,
                                                   rel_to_abs_mel_function,
                                                   melody_block_paradigm,
                                                   review = FALSE,
                                                   phase = "test",
                                                   learn_test_paradigm,
                                                   arrhythmic_page_text = psychTestR::i18n("arrhythmic_melody_trial_page_text"),
                                                   arrhythmic_page_title = psychTestR::i18n("arrhythmic_melody_trial_page_title"),
                                                   arrhythmic_instruction_text = psychTestR::i18n("arrhythmic_melody_trial_instruction_text"),
                                                   rhythmic_page_text = psychTestR::i18n("rhythmic_melody_trial_page_text"),
                                                   rhythmic_page_title = psychTestR::i18n("rhythmic_melody_trial_page_title"),
                                                   rhythmic_instruction_text = psychTestR::i18n("rhythmic_melody_trial_instruction_text")), dict = PBET_dict),

                             if (num_items_review$arrhythmic > 0L | num_items_review$rhythmic > 0L) {
                               psychTestR::new_timeline(
                                 main_test_paradigms(module_label = "review",
                                                     num_items_review,
                                                     examples,
                                                     feedback,
                                                     page_type,
                                                     arrhythmic_item_bank,
                                                     rhythmic_item_bank,
                                                     item_characteristics_sampler_function,
                                                     get_trial_characteristics_function,
                                                     max_goes,
                                                     max_goes_forced,
                                                     pars_arrhythmic = NULL,
                                                     pars_rhythmic = NULL,
                                                     give_first_melody_note,
                                                     get_answer_function_midi,
                                                     get_answer_function_audio,
                                                     sampler_function_arrhythmic = NULL,
                                                     sampler_function_rhythmic = NULL,
                                                     rel_to_abs_mel_function,
                                                     melody_block_paradigm,
                                                     review = TRUE,
                                                     phase = "review",
                                                     learn_test_paradigm,
                                                     arrhythmic_page_text = psychTestR::i18n("arrhythmic_melody_trial_page_text"),
                                                     arrhythmic_page_title = psychTestR::i18n("arrhythmic_melody_trial_page_title"),
                                                     arrhythmic_instruction_text = psychTestR::i18n("arrhythmic_melody_trial_instruction_text"),
                                                     rhythmic_page_text = psychTestR::i18n("rhythmic_melody_trial_page_text"),
                                                     rhythmic_page_title = psychTestR::i18n("rhythmic_melody_trial_page_title"),
                                                     rhythmic_instruction_text = psychTestR::i18n("rhythmic_melody_trial_instruction_text")), dict = PBET_dict) },

          psychTestR::new_timeline(
                    psychTestR::join(
                           # Arbitrary and optional trial block to go after
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

        ), dict = PBET::PBET_dict)
      ),
      psychTestR::elt_save_results_to_disk(complete = TRUE),
      if(gold_msi) psyquest::GMS(subscales = c("Musical Training")),
      musicassessr::deploy_demographics(demographics),
      psychTestR::elt_save_results_to_disk(complete = TRUE),
      psychTestR::new_timeline(
        musicassessr::final_page_or_continue_to_new_test(final = with_final_page,
                                                         task_name = psychTestR::i18n("title"),
                                                         present_continue_to_new_test_page = present_continue_to_new_test_page), dict = PBET::PBET_dict)
  ) # end main join

  if(add_consent_form) {
    timeline <- consentr::consent(timeline)
  }

  timeline

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
                      input_type = "midi_keyboard_or_microphone",
                      instrument_id = NULL,
                      asynchronous_api_mode = FALSE,
                      num_items = NULL, # Only needed for async API mode
                      melody_length = NULL, # Only needed for async API mode
                      show_instructions = TRUE,
                      use_musicassessr_db = FALSE) {

  psychTestR::join(

    # Introduction page
    psychTestR::one_button_page(body = shiny::tags$div(shiny::tags$h2(psychTestR::i18n("PBET_welcome")),
                                                       shiny::tags$img(src = 'https://adaptiveeartraining.com/assets/img/music.png', height = 100, width = 100),
                                                       shiny::tags$img(src = 'https://adaptiveeartraining.com/assets/img/saxophone.png', height = 100, width = 100),
                                                       shiny::tags$p(psychTestR::i18n("PBET_welcome_1")),
                                                       shiny::tags$p(psychTestR::i18n("PBET_welcome_2")),
                                button_text = psychTestR::i18n("Next"))),

    musicassessr::setup_pages(input_type = input_type,
                              demo = demo,
                              get_instrument_range = get_range,
                              SNR_test = SNR_test,
                              absolute_url = absolute_url,
                              select_instrument = is.null(instrument_id),
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
                              adjust_range = adjust_range,
                              use_musicassessr_db = use_musicassessr_db),

    # Sample from item bank now we have range
    if(asynchronous_api_mode) sample_melody_in_key_elts(item_bank_name = "WJD_ngram", num_items, key_difficulty, melody_length),

    # Instructions
    if(show_instructions) PBET_instructions(max_goes, max_goes_forced)
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
  # Given the trial number, return what info is needed for the sampler
  trial_df %>% dplyr::filter(trial_no == !! trial_no)
}

# tibble::tibble(trial_no = 1:2,
#                melody_length = c(5:6),
#                key_difficulty = c("easy", "hard"),
#                display_modality = c("visual", "auditory")) %>%
# get_trial_characteristics_pbet(trial_no = 2)



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
                                                          "melody_length" = 5:18,
                                                          "proportion_visual" = 0)
                                                          ) {

  # Given a range of stimuli lengths and a number of difficulties, produce the test parameters
  no_items <- pars$key_easy + pars$key_hard
  no_items_key_easy <- pars$key_easy
  no_items_key_hard <- pars$key_hard

  # Deal with possibility of infinity (i.e., user-determined end time)
  no_items <- if(is.infinite(no_items)) 999 else no_items
  no_items_key_easy <- if(is.infinite(no_items_key_easy)) 999 else no_items_key_easy
  no_items_key_hard <- if(is.infinite(no_items_key_hard)) 999 else no_items_key_hard

  # If the proportion of visual items is > 0, how many visual items should there be?
  num_visual <- round(pars$proportion_visual * no_items)
  num_auditory <- no_items - num_visual

  # Create labels and randomise
  display_modality_labels <- c(rep("visual", num_visual), rep("auditory", num_auditory)) %>%
    sample()

  logging::loginfo("Creating PBET block with %s items: %s auditory and %s visual", no_items, num_auditory, num_visual)


  # What possible values are there?
  no_of_Ns <- length(pars$melody_length)
  # Given the no. of items, how many of each N will we need? Let's count..
  idxes <- rep(1:no_of_Ns, ceiling(no_items/no_of_Ns))
  count <- 1
  N_list <- c()

  while(count < no_items + 1) {
    idx <- idxes[count]
    N_list <- c(N_list, pars$melody_length[idx])
    count <- count + 1
  }

  if(no_items_key_easy == 999 || no_items_key_hard == 999) {
    key_difficulty_labels <- c(rep("easy", 500), rep("hard", 499))
  } else {
    key_difficulty_labels <- c(rep("easy", no_items_key_easy), rep("hard", no_items_key_hard))
  }

  # Randomise the order
  N_list <- sample(N_list)
  key_difficulty_labels <- sample(key_difficulty_labels)


  tibble::tibble(trial_no = 1:no_items,
                 melody_length = N_list,
                 key_difficulty = key_difficulty_labels,
                 display_modality = display_modality_labels)
}

# t <- item_characteristics_sampler_pbet(list("key_easy" = Inf, "key_hard" = Inf, melody_length = 5:18, proportion_visual = 0))

# item_characteristics_sampler_pbet(list("key_easy" = 1, "key_hard" = 1, melody_length = 5:18, proportion_visual = 0))




conditional_trial_block <- function(page_type = c("record_midi_page", "record_audio_page"),
                                    selection = c("MIDI", "Microphone"),
                                    trial_block_function,
                                    num_items,
                                    num_examples,
                                    item_bank = NULL,
                                    feedback = NULL,
                                    item_characteristics_pars = NULL,
                                    item_characteristics_sampler_function = NULL,
                                    get_trial_characteristics_function = NULL,
                                    max_goes = NULL,
                                    max_goes_forced = NULL,
                                    get_answer,
                                    give_first_melody_note = NULL,
                                    sampler_function = NULL,
                                    rel_to_abs_mel_function = NULL,
                                    melody_block_paradigm = c('standard', 'sing_melody_first'),
                                    review = FALSE,
                                    phase = c('test', 'learn', 'review'),
                                    singing_trials = FALSE,
                                    learn_test_paradigm = FALSE,
                                    page_text = "",
                                    page_title = "",
                                    instruction_text = "") {

  fun_name <- as.character(substitute(trial_block_function))[3]

  stopifnot(is.function(get_answer))

  args <- list(
    page_type = page_type,
    num_items = num_items,
    num_examples = num_examples,
    item_bank = item_bank,
    feedback = feedback,
    item_characteristics_pars = item_characteristics_pars,
    item_characteristics_sampler_function = item_characteristics_sampler_function,
    get_trial_characteristics_function = get_trial_characteristics_function,
    max_goes = max_goes,
    max_goes_forced = max_goes_forced,
    get_answer = get_answer,
    give_first_melody_note = give_first_melody_note,
    sampler_function = sampler_function,
    rel_to_abs_mel_function = rel_to_abs_mel_function,
    melody_block_paradigm = if(fun_name == "find_this_note_trials") NULL else melody_block_paradigm,
    review = if(fun_name == "find_this_note_trials") NULL else review,
    phase = if(fun_name == "find_this_note_trials") NULL else phase,
    singing_trials = singing_trials,
    learn_test_paradigm = if(fun_name == "find_this_note_trials") NULL else learn_test_paradigm,
    page_text = if(fun_name == "find_this_note_trials") NULL else page_text,
    page_title = if(fun_name == "find_this_note_trials") NULL else page_title,
    instruction_text = if(fun_name == "find_this_note_trials") NULL else instruction_text)

  # Remove empty arguments
  args <- args[!purrr::map_lgl(args, is.null)]

  psychTestR::conditional(test = function(state, ...) {
    psychTestR::get_global("response_type", state) == selection
  }, logic = do.call(trial_block_function, args))
}


pbet_rhythmic_trials <- function(item_bank,
                                 num_items,
                                 num_examples,
                                 feedback,
                                 item_characteristics_sampler_function,
                                 get_trial_characteristics_function,
                                 max_goes,
                                 max_goes_forced,
                                 pars_rhythmic,
                                 get_answer_function_midi = musicassessr::get_answer_midi_melodic_production,
                                 get_answer_function_audio = musicassessr::get_answer_pyin_melodic_production,
                                 give_first_melody_note,
                                 sampler_function,
                                 rel_to_abs_mel_function,
                                 melody_block_paradigm = c('standard', 'sing_melody_first'),
                                 review = FALSE,
                                 phase = c('test', 'learn', 'review'),
                                 learn_test_paradigm = FALSE,
                                 page_text = psychTestR::i18n("rhythmic_melody_trial_page_text"),
                                 page_title = psychTestR::i18n("rhythmic_melody_trial_page_title"),
                                 instruction_text = psychTestR::i18n("rhythmic_melody_trial_instruction_text")) {


  psychTestR::join(
    conditional_trial_block(page_type = "record_midi_page",
                            selection = "MIDI",
                            trial_block_function = musicassessr::rhythmic_melody_trials,
                            item_bank = item_bank,
                            num_items = num_items,
                            num_examples = num_examples,
                            feedback = feedback,
                            item_characteristics_pars = pars_rhythmic,
                            item_characteristics_sampler_function,
                            get_trial_characteristics_function,
                            max_goes,
                            max_goes_forced,
                            get_answer = get_answer_function_midi,
                            give_first_melody_note = give_first_melody_note,
                            sampler_function = sampler_function,
                            rel_to_abs_mel_function = rel_to_abs_mel_function,
                            melody_block_paradigm = melody_block_paradigm,
                            review = review,
                            phase = phase,
                            singing_trials = FALSE,
                            learn_test_paradigm = learn_test_paradigm,
                            page_text = page_text,
                            page_title = page_title,
                            instruction_text = instruction_text),

    conditional_trial_block(page_type = "record_audio_page",
                            selection = "Microphone",
                            trial_block_function = musicassessr::rhythmic_melody_trials,
                            item_bank = item_bank,
                            num_items = num_items,
                            num_examples = num_examples,
                            feedback = feedback,
                            item_characteristics_pars = pars_rhythmic,
                            item_characteristics_sampler_function,
                            get_trial_characteristics_function,
                            max_goes,
                            max_goes_forced,
                            get_answer = get_answer_function_audio,
                            give_first_melody_note = give_first_melody_note,
                            sampler_function = sampler_function,
                            rel_to_abs_mel_function = rel_to_abs_mel_function,
                            melody_block_paradigm = melody_block_paradigm,
                            review = review,
                            phase = phase,
                            singing_trials = FALSE,
                            learn_test_paradigm = learn_test_paradigm,
                            page_text = page_text,
                            page_title = page_title,
                            instruction_text = instruction_text)
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
                                   get_answer_function_midi = musicassessr::get_answer_midi_melodic_production,
                                   get_answer_function_audio = musicassessr::get_answer_pyin_melodic_production,
                                   give_first_melody_note,
                                   sampler_function,
                                   rel_to_abs_mel_function,
                                   melody_block_paradigm = c('standard', 'sing_melody_first'),
                                   review = FALSE,
                                   phase = c('test', 'learn', 'review'),
                                   learn_test_paradigm = FALSE,
                                   page_text = psychTestR::i18n("rhythmic_melody_trial_page_text"),
                                   page_title = psychTestR::i18n("rhythmic_melody_trial_page_title"),
                                   instruction_text = psychTestR::i18n("rhythmic_melody_trial_instruction_text")) {

  stopifnot(is.function(get_answer_function_midi))


  psychTestR::join(
    conditional_trial_block(page_type = "record_midi_page",
                            selection = "MIDI",
                            trial_block_function = musicassessr::arrhythmic_melody_trials,
                            item_bank = item_bank,
                            num_items = num_items,
                            num_examples = num_examples,
                            feedback = feedback,
                            item_characteristics_pars = pars_arrhythmic,
                            item_characteristics_sampler_function,
                            get_trial_characteristics_function,
                            max_goes,
                            max_goes_forced,
                            get_answer = get_answer_function_midi,
                            give_first_melody_note = give_first_melody_note,
                            sampler_function = sampler_function,
                            rel_to_abs_mel_function = rel_to_abs_mel_function,
                            melody_block_paradigm = melody_block_paradigm,
                            review = review,
                            phase = phase,
                            singing_trials = FALSE,
                            learn_test_paradigm = learn_test_paradigm,
                            page_text = page_text,
                            page_title = page_title,
                            instruction_text = instruction_text),

    conditional_trial_block(page_type = "record_audio_page",
                            selection = "Microphone",
                            trial_block_function = musicassessr::arrhythmic_melody_trials,
                            item_bank = item_bank,
                            num_items = num_items,
                            num_examples = num_examples,
                            feedback = feedback,
                            item_characteristics_pars = pars_arrhythmic,
                            item_characteristics_sampler_function,
                            get_trial_characteristics_function,
                            max_goes,
                            max_goes_forced,
                            get_answer = get_answer_function_audio,
                            give_first_melody_note = give_first_melody_note,
                            sampler_function = sampler_function,
                            rel_to_abs_mel_function = rel_to_abs_mel_function,
                            melody_block_paradigm = melody_block_paradigm,
                            review = review,
                            phase = phase,
                            singing_trials = FALSE,
                            learn_test_paradigm = learn_test_paradigm,
                            page_text = page_text,
                            page_title = page_title,
                            instruction_text = instruction_text)
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




main_test_paradigms <- function(module_label = "test",
                                num_items,
                                examples,
                                feedback,
                                page_type,
                                arrhythmic_item_bank,
                                rhythmic_item_bank,
                                item_characteristics_sampler_function,
                                get_trial_characteristics_function,
                                max_goes,
                                max_goes_forced,
                                pars_arrhythmic,
                                pars_rhythmic,
                                give_first_melody_note,
                                get_answer_function_midi = musicassessr::get_answer_midi_melodic_production,
                                get_answer_function_audio = musicassessr::get_answer_pyin_melodic_production,
                                sampler_function_arrhythmic,
                                sampler_function_rhythmic,
                                rel_to_abs_mel_function,
                                melody_block_paradigm,
                                review = FALSE,
                                phase = c('test', 'learn', 'review'),
                                learn_test_paradigm = FALSE,
                                arrhythmic_page_text = psychTestR::i18n("arrhythmic_melody_trial_page_text"),
                                arrhythmic_page_title = psychTestR::i18n("arrhythmic_melody_trial_page_title"),
                                arrhythmic_instruction_text = psychTestR::i18n("arrhythmic_melody_trial_instruction_text"),
                                rhythmic_page_text = psychTestR::i18n("rhythmic_melody_trial_page_text"),
                                rhythmic_page_title = psychTestR::i18n("rhythmic_melody_trial_page_title"),
                                rhythmic_instruction_text = psychTestR::i18n("rhythmic_melody_trial_instruction_text")) {

  phase <- match.arg(phase)

  stopifnot(
            is.function(get_answer_function_midi),
            phase %in% c('test', 'learn', 'review')
            )

  logging::loginfo("Instantiating PBET block with type %s", phase)

  if(!review) {

    non_melody_based_trials <- psychTestR::join(
      # Interval perception trials

      musicassessr::interval_perception_trials(num_items = num_items$interval_perception),


      # Find that note trials
      conditional_trial_block_find_this_note_trials(num_items = num_items$find_this_note,
                                                    num_examples = examples$find_this_note,
                                                    get_answer_function_midi = get_answer_function_midi,
                                                    get_answer_function_audio = get_answer_function_audio)
    )
  }


  # Review only supported for standard melody trials
  melody_based_trials <- psychTestR::join(
      # Arrhythmic melody trials
      pbet_arrhythmic_trials(arrhythmic_item_bank,
                             num_items = num_items$arrhythmic,
                             examples$arrhythmic,
                             feedback,
                             item_characteristics_sampler_function,
                             get_trial_characteristics_function,
                             max_goes,
                             max_goes_forced,
                             pars_arrhythmic,
                             get_answer_function_midi = get_answer_function_midi,
                             get_answer_function_audio = get_answer_function_audio,
                             give_first_melody_note = give_first_melody_note,
                             sampler_function = sampler_function_arrhythmic,
                             rel_to_abs_mel_function = rel_to_abs_mel_function,
                             melody_block_paradigm = melody_block_paradigm,
                             review = review,
                             phase = phase,
                             learn_test_paradigm = learn_test_paradigm,
                             page_text = arrhythmic_page_text,
                             page_title = arrhythmic_page_title,
                             instruction_text = arrhythmic_instruction_text),
    # Rhythmic melody trials
    pbet_rhythmic_trials(rhythmic_item_bank,
                         num_items = num_items$rhythmic,
                         examples$rhythmic,
                         feedback,
                         item_characteristics_sampler_function,
                         get_trial_characteristics_function,
                         max_goes,
                         max_goes_forced,
                         pars_rhythmic,
                         get_answer_function_midi = get_answer_function_midi,
                         get_answer_function_audio = get_answer_function_audio,
                         give_first_melody_note = give_first_melody_note,
                         sampler_function = sampler_function_rhythmic,
                         rel_to_abs_mel_function = rel_to_abs_mel_function,
                         melody_block_paradigm = melody_block_paradigm,
                         review = review,
                         phase = phase,
                         learn_test_paradigm = learn_test_paradigm,
                         page_text = rhythmic_page_text,
                         page_title = rhythmic_page_title,
                         instruction_text = rhythmic_instruction_text)

  )


  psychTestR::module(label = module_label,
      psychTestR::join(

        # Non-melody-based trials
        if (!review) non_melody_based_trials, # Review only supported for standard melody trials

        # Melody-based trials
        melody_based_trials,

        # WJD real audio trials
        if (!review) musicassessr::wjd_audio_melody_trials(item_bank = PBET::WJD_phrase_item_bank, num_items = num_items$wjd_audio, num_examples = examples$wjd_audio, feedback = feedback)
  ))

}






conditional_trial_block_find_this_note_trials <- function(num_items,
                                                          num_examples,
                                                          get_answer_function_midi = musicassessr::get_answer_midi_melodic_production,
                                                          get_answer_function_audio = musicassessr::get_answer_pyin_melodic_production) {

  stopifnot(
    is.function(get_answer_function_midi),
    is.function(get_answer_function_audio)
  )

  psychTestR::join(
    conditional_trial_block(page_type = "record_midi_page",
                            selection = "MIDI",
                            trial_block_function = musicassessr::find_this_note_trials,
                            num_items = num_items,
                            num_examples = num_examples,
                            get_answer = get_answer_function_midi),

    conditional_trial_block(page_type = "record_audio_page",
                            selection = "Microphone",
                            trial_block_function = musicassessr::find_this_note_trials,
                            num_items = num_items,
                            num_examples = num_examples,
                            get_answer = get_answer_function_audio)
  )
}




