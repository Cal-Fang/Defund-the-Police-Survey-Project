# Defund-the-Police-Survey-Project
UChicago Ph.D. Student David Knight did a survey in several prisons across US. I did some NLP analysis work on this dataset.

There are 5 folders in this document.

01 is the memo we created for better organizing all findings.
02 includes all the slides we used through all the weekly meetings. The information in it is basically the same as 01, but organized chronologically.
03 includes the original dataset and the questionnaire.

Because of privacy, dataset ownership, and other consideration. 01, 02, and 03 were set to private. [2021-01-02]

04 and 05 includes most of the scripts we used for analysis. 04 includes the BTM and LDA ones. 05 includes the supervised BTM one. There are some other models we tried, for instance, RP and sLDA, but since those models did not generate any useful results, they were not included here.

The most important folder is 04, which includes the BTM model that we finally decided on for this project. There are three folders in 04. The one named “BTM_Python” includes the python code we used to do the text extracting, cleaning, and analysis. The one named “BTM_C++” includes the C++ code we used to run the topic modeling.

Basically, in each python script, we will need to run the “Data Importing” and “Make Remove Stopword Functions” to clean the data and then run the “Data Exporting for C++” part code and save the cleaned file in the “BTM_C++/sample-data” folder.

And then we will need to open the “BTM_C++/script” folder, and get into the “runExample.sh” file. We will need to change several things in this .sh file every time we run a model：
1. K. It refers to the topic number that we assigned to this model. If we want to try to fit more topics to a text file, we could give a higher K number;
2. beta. A numeric, indicating the symmetric dirichlet prior probability of a word given the topic P(w|z). Defaults to 0.01. For our dataset, it seems like 0.005 is the best choice.

After changing this, we could run the code below through the terminal:

    cd “the address of the sh file”
    sh runExample.sh

The terminal will then give the text distribution table. And the topic distribution of each line will be stored as “K-#.pz_d” in the “BTM_C++/output/model” folder.
The next step will be to copy-paste the model information into a excel file and generate a .csv file, and combine this .csv file with the original .csv file exported from the python code.

The final step is to read in this new .csv file into the python code and continue the follow-up regression analysis code.
