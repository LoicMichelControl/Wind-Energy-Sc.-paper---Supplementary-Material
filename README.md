# Wind Energy Sc. paper -- Supplementary-Material

Supplementary Material — Some comments on experimental results of three lift controllers for a wind turbine blade section using an active flow control

Loic Michel, Caroline Braud, Jean-Pierre Barbot, Franck Plestan, Dimitri Peaucelle and Xavier Boucher  

==== Matlab scripts and dataset ====

1/ The script ‘RUN_Plot_histogram_and_steady_state.m' evaluates the performance of each control law with respect to all scenarios and deduces the histogram that compares the statistics (the dataset is directly unzipped in the path).
=> Create of the file 'Statistic_all_control_all_sc.txt' that contains all statistical data (w.r.t. each scenario & each control law).
=> Plot of each controlled lift signal including its associated segmentation to evaluate the statistics (for debug purpose).
=> Plot of the Fig. 7 (histogram), the Fig. 13 (Sc. #2) and the Fig. 14 (Sc. #5) of the paper.

2/ The script ‘RUN_Plot_Sc2_all_control.m’ plots the time evolution of each controller with respect to the Sc #2 that has been chosen to illustrate the control properties.
=> Plot of the Figs. 8 - 12 and the Figs. 15 - 18.
