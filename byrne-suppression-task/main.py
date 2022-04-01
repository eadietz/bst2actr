import actr
import re
import os
import pandas as pd
from sys import platform as _platform
from Arguments_Collector import *
from datetime import datetime

class Main:

    headers_list = values_list = None
    response = False
    response_time = False
    schedule_time = 3
    msec = 0
    fact_set = ["essay"] #, "not_essay", "library", "not_library"]

    def __init__(self, cognitive_model_file, show_env_windows=True):
        self.show_env_windows = show_env_windows

        self.abs_path = f'{os.path.dirname(os.path.abspath(__file__))}/'
        self.abs_path = self.abs_path[2:] if self.abs_path.startswith("C:") else self.abs_path

        self.mac_vs_ws = "\\" if _platform.startswith('win') else "/"
        temp_path = self.abs_path.replace("/", self.mac_vs_ws)
        path = temp_path if temp_path.endswith(self.mac_vs_ws) else f'{temp_path}{self.mac_vs_ws}'

        cognitive_model_file = self.set_os_path_sep(path + cognitive_model_file)
        start_idx = re.search("[^\W\d]", cognitive_model_file).start()
        self.cognitive_model_file = cognitive_model_file[start_idx:].replace("/", ";").replace("\\", ";")

        self.results_df = pd.DataFrame(columns=["Context", "Fact", "Response"])


    def set_os_path_sep(self, path_to_file):
        return path_to_file.replace("/", "\\") if _platform.startswith("win") else path_to_file.replace("\\", "/")

    def connect_to_actr(self):

        actr.connection() if not actr.current_connection else actr.reset()
        actr.load_act_r_code(self.cognitive_model_file)
        actr.add_command("library-button", self.library_button,
                              "suppression task key press response monitor")
        actr.add_command("print_output", self.print_output, "print output")

        ac = Arguments_Collector()
        actr.add_command("add_content", ac.add_content, "add models response to df")
        ac.reset()

        actr.monitor_command("output-key", "library-button")
        actr.start_hand_at_mouse()

    def construct_environment(self):

        self.task_environment_window = actr.open_exp_window("task_environment", visible=self.show_env_windows,
                                                            width=720, height=500, x=510, y=20)
        self.task_response_options_window = actr.open_exp_window("task_response_options", visible=self.show_env_windows,
                                                                 width=720, height=260, x=510, y=600)

        actr.add_text_to_exp_window(self.task_environment_window, text="f-sentence", color="f-sentence",
                                    x=50, y=50, font_size=15)
        actr.add_text_to_exp_window(self.task_environment_window, text="s-sentence", color="s-sentence",
                                    x=50, y=100, font_size=15)
        actr.add_text_to_exp_window(self.task_response_options_window, text="fact", color="fact",
                                    x=18, y=20, font_size=15)


        actr.add_button_to_exp_window(self.task_response_options_window, text="yes", x=400,  y=50,
                                                   action=["library-button","yes"], height=30, width=230, color="yes")
        actr.add_button_to_exp_window(self.task_response_options_window, text="no", x=400,  y=100,
                                                  action=["library-button","no"], height=30, width=230, color="no")
        actr.add_button_to_exp_window(self.task_response_options_window, text="unknown",
                                                       x=400,  y=150, action=["library-button","unknown"],
                                                       height=30, width=230, color="unknown")

        actr.install_device(self.task_environment_window)
        actr.install_device(self.task_response_options_window)


    def specify_and_pass(self, log_file_name=""):
        for i in range(100):
            #print(i)
            self.exp("simple", 'If_essay_then_library', '----------')
            #self.exp("alternative", 'If_essay_then_library', 'If_textbook_then_library')
            #self.exp("additional", 'If_essay_then_library', 'If_open_then_library')
        self.results_df.to_csv("results.csv", mode="w", index=False, sep=";")
        print("average time", self.msec/100)
        self.plot_table()

    def exp(self, context, f_sentence, s_sentence):

        global response

        list_of_facts = self.fact_set

        for index, fact in enumerate(list_of_facts):
            actr.start_hand_at_mouse()
            start_time = actr.mp_time()
            actr.goal_focus("starting-goal")

            response = ''

            actr.clear_exp_window(self.task_environment_window)
            actr.clear_exp_window(self.task_response_options_window)

            actr.add_text_to_exp_window(self.task_environment_window, text=f_sentence,
                                        color='f-sentence', x=50, y=50, font_size=15, width=75)
            actr.add_text_to_exp_window(self.task_environment_window, text=s_sentence,
                                        color='s-sentence', x=50, y=100, font_size= 15,width=75)
            actr.add_text_to_exp_window(self.task_response_options_window, text=fact, color='fact',
                                        x=18, y=20, font_size=15, width=75)

            actr.add_button_to_exp_window(self.task_response_options_window, text="yes", x=400, y=50,
                                          action=["library-button", "yes"], height=30, width=230, color="gray")

            actr.add_button_to_exp_window(self.task_response_options_window, text="no", x=400, y=100,
                                          action=["library-button", "no"], height=30, width=230, color="gray")

            actr.add_button_to_exp_window(self.task_response_options_window, text="unknown", x=400, y=150,
                                          action=["library-button", "unknown"], height=30, width=230, color="gray")

            actr.run(100000)
            while response == '':
                actr.process_events()

            end_time = actr.mp_time()
            new_row = {'Context': context, 'Fact': fact, "Response": response}
            self.results_df = self.results_df.append(new_row, ignore_index=True)
            total_time = end_time - start_time
            self.msec += total_time

        actr.set_base_levels("OPEN-NEC 2.1")
        actr.set_base_levels("OPEN-SUF 0")
        actr.set_base_levels("TEXTBOOK-SUF 1.9")
        actr.set_base_levels("TEXTBOOK-NEC 0")
        actr.set_base_levels("SUFFICIENT 0")
        actr.set_base_levels("NECESSARY 0")

    def plot_table(self):

        df_set = []

        for item in self.fact_set:
            df = self.results_df[self.results_df['Fact'] == item]
            df_set.append(df)

        idx = 0
        for df in df_set: #, not_essay_df, library_df, not_library_df]:
            g = df.groupby('Context')['Response']
            df = pd.concat([g.value_counts(), g.value_counts(normalize=True).mul(100)],
                                    axis=1, keys=('counts','percentage'))
            print(self.fact_set[idx])
            idx += 1
            print(df)
        #self.plot_results(self.results_df)


    @staticmethod
    def respond_to_key_press(self, model, key):

        global response, response_time
        response_time = self.actr.get_time(model)
        response = key
        print

    @staticmethod
    def library_button(value):
        global response
        response = value

    def print_output(self, value):
        print(value)

m = Main("cognitive-model-specification/model.lisp")
m.connect_to_actr()
m.construct_environment()
m.specify_and_pass()
