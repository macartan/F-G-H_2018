# F-G-H_2018

********************************************************************************
* REPLICATION ARCHIVE
* 
* "Can the Government Deter Discrimination? 
*   Evidence from a Randomized Intervention in New York City"
* 
* Albert H Fang, Andrew M Guess, and Macartan Humphreys
* 
* Date: 25 October 2018
********************************************************************************

This replication archive contains the following files:

########## DOCUMENTATION FILES #################################################

(1) _README.md:
This file contains documentation about the files in the replication archives.

(2) _VariableList.pdf:
This document contains descriptions of the variables in the three main data files. 

########## FILES NEEDED TO REPLICATE ALL ANALYSES ##############################

(3) R Markdown files

* Replicate_Main.Rmd:
R Markdown file that produces the tables, figures, and analyses reported in the 
manuscript and in the online appendix. This output file shows the core code and 
analyses used, as well as the main output from these analyses. 

This file also calls two additional .Rmd files:
 - Replicate_Appendix.Rmd which contains code used to generate
   the analyses reported in the online appendix, and
 - Replicate_lasso.Rmd which contains code used to
   conduct the lasso procedure for covariate selection and the covariate
   adjusted analyses reported in the online appendix.

You can choose to not call these two files by setting run_appendix and run_lasso
to FALSE in the first chunk of Replicate_Main.Rmd

(4) Data files
* dat_c_as.csv -- contains case-level (c) data for the audit sample (as)
* dat_c_xs.csv -- contains case-level (c) data for the experimental sample (xs)
* dat_ct_xs.csv -- contains case-tester-level (ct) data for the experimental sample (xs)

(5) Helper R scripts
There are three helper R scripts that load and prepare the data and that define 
helper functions. These scripts are sourced and executed in _Replicate.Rmd.
* code_0_read_data.R
* code_1a_prep_data.R
* code_1b_helper_functions.R

(6) Plot helper file
* megaplot_lookup.csv - This helper file contains information used to determine 
the layouts of Figure 1 and of Figure A3.

########## OUTPUT FILES ########################################################

This replication code produces the following output files

(7) Replicate_Main.html:
This is the replication output file produced by 2018_10_25_Replicate_Main. 

This file shows  all core code chunks and all analysis output for all analyses that are presented in both the article and in the online supplemental appendix.

(8) Main output files:
The file names of all main output files begin with the prefix "out_" and include
the corresponding table/figure number. We include both output files created for 
the paper (e.g., pdf and tex files), for the .Rmd output file (e.g., png files), and
.csv files containing estimation results.
* out_figure1a_6x6_cb.pdf                                        
* out_figure1a_6x6_cb.png                                        
* out_figure1b_6x6_off.pdf                                       
* out_figure1b_6x6_off.png                                       
* out_figure2_posteriors.pdf                                     
* out_figure2_posteriors.png                                     
* out_figurea2_cases_over_time.pdf                               
* out_figurea2_cases_over_time.png                               
* out_figurea3_6x6_index.pdf                                     
* out_figurea3_6x6_index.png                                     
* out_figurea4a_anova_cb.pdf                                     
* out_figurea4a_anova_cb.png                                     
* out_figurea4b_anova_off.pdf                                    
* out_figurea4b_anova_off.png                                    
* out_figurea4c_anova_qualpraise.pdf                             
* out_figurea4c_anova_qualpraise.png                             
* out_figurea4d_anova_sales.pdf                                  
* out_figurea4d_anova_sales.png                                  
* out_figurea4e_anova_posedit.pdf                                
* out_figurea4e_anova_posedit.png                                
* out_figurea4f_anova_posbg.pdf                                  
* out_figurea4f_anova_posbg.png                                  
* out_figurea4g_anova_prof.pdf                                   
* out_figurea4g_anova_prof.png                                   
* out_figurea6_appx_hetfxSUBJRACE_mc.pdf                         
* out_figurea7_appx_hetfxSUBJRACE_pc.pdf                         
* out_table_a1_dist_by_block.tex                                 
* out_tablea10_itt_blockfe_nocovs.csv                            
* out_tablea10_itt_blockfe_nocovs.tex                            
* out_tablea11_pred_means_2g.tex                                 
* out_tablea12_early_stage_discrim_subjective.tex                
* out_tablea13_noncompliance_incidence.tex                       
* out_tablea14_cace_table_format1.tex                            
* out_tablea14_cace_table_format2.tex                            
* out_tablea15_covadjitt.tex                                     
* out_tablea15_itt_blockfe_covadj_full_UNFORMATTED.csv           
* out_tablea15_itt_blockfe_covadj_full.csv                       
* out_tablea16_pred_missing_net_index.tex                        
* out_tablea17_pwmisscorr.tex                                    
* out_tablea18_pred_missing_tester_race.tex                      
* out_tablea19_balance_table_categoricalvars.tex                 
* out_tablea2_early_stage_discrim.tex                            
* out_tablea20_balance_table_continuousvars.tex                  
* out_tablea21_SA_ExcludeLD_itt_2g_blockfe_nocovs_UNFORMATTED.csv
* out_tablea21_SA_ExcludeLD_itt_2g_blockfe_nocovs.csv            
* out_tablea21_SA_ExcludeLD_itt_2g_blockfe_nocovs.tex            
* out_tablea22_perceived_race_of_subjects.tex                    
* out_tablea4_sample_characteristics.tex                         
* out_tablea5_dist_by_borough.tex                                
* out_tablea6_baseline_discrim.tex                               
* out_tablea7_itt_2g_blockfe_nocovs_UNFORMATTED.csv              
* out_tablea7_itt_2g_blockfe_nocovs.csv                          
* out_tablea7_itt_2g_blockfe_nocovs.tex                          
* out_tablea8_unweighted_itt_callbacks.tex                       
* out_tablea9_unweighted_itt_offers.tex 

(9) Miscellaneous output files:
The replication code also produces miscellaneous output files. The file names of these
files begin with the prefix "misc_".

We output the covariates selected using the lasso procedure as .csv files. Covariates
are selected by treatment arm and by outcome variable. There is one output file for
each treatment arm.
* misc_covselect_select0.csv                                     
* misc_covselect_select1.csv                                     
* misc_covselect_select2.csv                                     

We also output the bootstrap estimates (as an .RData file) from the covariate adjusted
ITT analysis. We additionally plot each set of bootstrap estimates and save these plots
as PDF files.
* misc_bootstrap_estimates.RData                                 
* misc_bootstrap_bs_10_est.pdf                                   
* misc_bootstrap_bs_20_est.pdf                                   
* misc_bootstrap_bs_21_est.pdf     

(10) Ancillary data for Table A5
* HPD-2011-HVS-Selected-Findings-Tables.pdf - Benchmarking data on the pre-treatment distribution of rental units across boroughs (reported in Table A5 in the appendix) are from the 2011 New York City Housing and Vacancy Survey. We have included a copy of the PDF from which we obtained this information in the replication archive. It may also be accessed online via the Internet Archive Wayback Machine (link included in the .Rmd script file).
