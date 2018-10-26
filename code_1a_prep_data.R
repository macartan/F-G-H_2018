## Replication Code for Fang, Guess, and Humphreys
## "Can Government Deter Discrimination? Evidence from a Randomized Intervention in New York City"
## 2 November 2017

##=============================================================================##
## Define Vectors of Variable Names
##=============================================================================##

# ------------------  CASE-TESTER LEVEL INDICATORS --------------------- #

# (1) Early Stage Discrimination -- count vars, percent vars, any vars

es.con.a <- c("contact_A", "sched_A")
es.num.a <- c("numattr_A", "numskep_A", "numpos_A", "numneu_A", "numneg_A")
es.pct.a <- c("pctskep_A", "pctpos_A", "pctneu_A", "pctneg_A")
es.any.a <- c("anyskep_A", "anyneg_A")

es.con.b <- c("contact_B", "sched_B")
es.num.b <- c("numattr_B", "numskep_B", "numpos_B", "numneu_B", "numneg_B")
es.pct.b <- c("pctskep_B", "pctpos_B", "pctneu_B", "pctneg_B")
es.any.b <- c("anyskep_B", "anyneg_B")

es.con.c <- c("contact_C", "sched_C")
es.num.c <- c("numattr_C", "numskep_C", "numpos_C", "numneu_C", "numneg_C")
es.pct.c <- c("pctskep_C", "pctpos_C", "pctneu_C", "pctneg_C")
es.any.c <- c("anyskep_C", "anyneg_C")

# (2) Subjective Measures of Discrimination - In Person Interactions

subj.a <- c("sales_A", "qualpraise_A", "posbg_A", "posedit_A", "prof_A")
subj.b <- c("sales_B", "qualpraise_B", "posbg_B", "posedit_B", "prof_B")
subj.c <- c("sales_C", "qualpraise_C", "posbg_C", "posedit_C", "prof_C")

# (3) Objective Measures of Discrimination - In Person Interactions

# tester A
# number of units shown and whether shown listed unit
obj.show.a <- c("meet_A","sfc_B0_numunits_A", "shownlisted_A")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.a <- c("avquoteprice_A", "numqrent_A", "pctqrent_A", "napps_A", "pctapps_A")
obj.hqnum.a <- c("ndoor_A", "nelev_A", "nwdunit_A", "nwdbldg_A")
obj.hqpct.a <- c("pctdoor_A", "pctelev_A", "pctwdunit_A", "pctwdbldg_A")
# listed unit -- quoted rent, number of amenities in rent, fee structure, fee amounts
obj.lquote.a <- c("lrent_A", "listnair_A")
obj.lfstruct.a <- c("listed_mrn_A", "listed_sec_A", "listed_brk_A", "listed_adm_A", "listed_hld_A", "listed_app_A", "listed_oth_A", "listed_crd_A")
obj.lfamts.a <- c("listed_totfees_A", "listed_appfees_A", "listed_depfees_A", "listed_othfees_A", "listed_neg_A")

# tester B
# number of units shown and whether shown listed unit
obj.show.b <- c("meet_B","sfc_B0_numunits_B", "shownlisted_B")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.b <- c("avquoteprice_B", "numqrent_B", "pctqrent_B", "napps_B", "pctapps_B")
obj.hqnum.b <- c("ndoor_B", "nelev_B", "nwdunit_B", "nwdbldg_B")
obj.hqpct.b <- c("pctdoor_B", "pctelev_B", "pctwdunit_B", "pctwdbldg_B")
# listed unit -- quoted rent, number of amenities in rent, fee structure, fee amounts
obj.lquote.b <- c("lrent_B", "listnair_B")
obj.lfstruct.b <- c("listed_mrn_B", "listed_sec_B", "listed_brk_B", "listed_adm_B", "listed_hld_B", "listed_app_B", "listed_oth_B", "listed_crd_B")
obj.lfamts.b <- c("listed_totfees_B", "listed_appfees_B", "listed_depfees_B", "listed_othfees_B", "listed_neg_B")

# tester C
# number of units shown and whether shown listed unit
obj.show.c <- c("meet_C","sfc_B0_numunits_C", "shownlisted_C")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.c <- c("avquoteprice_C", "numqrent_C", "pctqrent_C", "napps_C", "pctapps_C")
obj.hqnum.c <- c("ndoor_C", "nelev_C", "nwdunit_C", "nwdbldg_C")
obj.hqpct.c <- c("pctdoor_C", "pctelev_C", "pctwdunit_C", "pctwdbldg_C")
# listed unit
obj.lquote.c <- c("lrent_C", "listnair_C")
obj.lfstruct.c <- c("listed_mrn_C", "listed_sec_C", "listed_brk_C", "listed_adm_C", "listed_hld_C", "listed_app_C", "listed_oth_C", "listed_crd_C")
obj.lfamts.c <- c("listed_totfees_C", "listed_appfees_C", "listed_depfees_C", "listed_othfees_C", "listed_neg_C")


# (4) Post-Visit Outcomes

post.a <- c("cb_A", "off_A")
post.b <- c("cb_B", "off_B")
post.c <- c("cb_C", "off_C")

# ------------------ NET MEASURES (DIFF BTWN TESTERS) ------------------ #
# (1) Early Stage Discrimination -- count vars, percent vars, any vars

es.con.wb <- c("ncontact_wb", "nsched_wb")
es.num.wb <- c("nnumattr_wb", "nnumskep_wb", "nnumpos_wb", "nnumneu_wb", "nnumneg_wb")
es.pct.wb <- c("npctskep_wb", "npctpos_wb", "npctneu_wb", "npctneg_wb")
es.any.wb <- c("nanyskep_wb", "nanyneg_wb")

es.con.wh <- c("ncontact_wh", "nsched_wh")
es.num.wh <- c("nnumattr_wh", "nnumskep_wh", "nnumpos_wh", "nnumneu_wh", "nnumneg_wh")
es.pct.wh <- c("npctskep_wh", "npctpos_wh", "npctneu_wh", "npctneg_wh")
es.any.wh <- c("nanyskep_wh", "nanyneg_wh")

es.con.bh <- c("ncontact_bh", "nsched_bh")
es.num.bh <- c("nnumattr_bh", "nnumskep_bh", "nnumpos_bh", "nnumneu_bh", "nnumneg_bh")
es.pct.bh <- c("npctskep_bh", "npctpos_bh", "npctneu_bh", "npctneg_bh")
es.any.bh <- c("nanyskep_bh", "nanyneg_bh")

# (2) Subjective Measures of Discrimination - In Person Interactions

subj.wb <- c("nsales_wb", "nqualpraise_wb", "nposbg_wb", "nposedit_wb", "nprof_wb")
subj.wh <- c("nsales_wh", "nqualpraise_wh", "nposbg_wh", "nposedit_wh", "nprof_wh")
subj.bh <- c("nsales_bh", "nqualpraise_bh", "nposbg_bh", "nposedit_bh", "nprof_bh")

# (3) Objective Measures of Discrimination - In Person Interactions

# W-B net measures
# number of units shown and whether shown listed unit
obj.show.wb <- c("nmeet_wb","nnumunits_wb", "nshownlisted_wb")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.wb <- c("navquoteprice_wb", "nnumqrent_wb", "npctqrent_wb", "nnapps_wb", "npctapps_wb")
obj.hqnum.wb <- c("nndoor_wb", "nnelev_wb", "nnwdunit_wb", "nnwdbldg_wb")
obj.hqpct.wb <- c("npctdoor_wb", "npctelev_wb", "npctwdunit_wb", "npctwdbldg_wb")
# listed unit -- quoted rent, number of amenities in rent, fee structure, fee amounts
obj.lquote.wb <- c("nlrent_wb", "nlistnair_wb")
obj.lfstruct.wb <- c("nlisted_mrn_wb", "nlisted_sec_wb", "nlisted_brk_wb", "nlisted_adm_wb", "nlisted_hld_wb", "nlisted_app_wb", "nlisted_oth_wb", "nlisted_crd_wb")
obj.lfamts.wb <- c("nlisted_totfees_wb", "nlisted_appfees_wb", "nlisted_depfees_wb", "nlisted_othfees_wb", "nlisted_neg_wb")

# W-H net measures
# number of units shown and whether shown listed unit
obj.show.wh <- c("nmeet_wh","nnumunits_wh", "nshownlisted_wh")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.wh <- c("navquoteprice_wh", "nnumqrent_wh", "npctqrent_wh", "nnapps_wh", "npctapps_wh")
obj.hqnum.wh <- c("nndoor_wh", "nnelev_wh", "nnwdunit_wh", "nnwdbldg_wh")
obj.hqpct.wh <- c("npctdoor_wh", "npctelev_wh", "npctwdunit_wh", "npctwdbldg_wh")
# listed unit -- quoted rent, number of amenities in rent, fee structure, fee amounts
obj.lquote.wh <- c("nlrent_wh", "nlistnair_wh")
obj.lfstruct.wh <- c("nlisted_mrn_wh", "nlisted_sec_wh", "nlisted_brk_wh", "nlisted_adm_wh", "nlisted_hld_wh", "nlisted_app_wh", "nlisted_oth_wh", "nlisted_crd_wh")
obj.lfamts.wh <- c("nlisted_totfees_wh", "nlisted_appfees_wh", "nlisted_depfees_wh", "nlisted_othfees_wh", "nlisted_neg_wh")

# B-H net measures
# number of units shown and whether shown listed unit
obj.show.bh <- c("nmeet_bh","nnumunits_bh", "nshownlisted_bh")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.bh <- c("navquoteprice_bh", "nnumqrent_bh", "npctqrent_bh", "nnapps_bh", "npctapps_bh")
obj.hqnum.bh <- c("nndoor_bh", "nnelev_bh", "nnwdunit_bh", "nnwdbldg_bh")
obj.hqpct.bh <- c("npctdoor_bh", "npctelev_bh", "npctwdunit_bh", "npctwdbldg_bh")
# listed unit
obj.lquote.bh <- c("nlrent_bh", "nlistnair_bh")
obj.lfstruct.bh <- c("nlisted_mrn_bh", "nlisted_sec_bh", "nlisted_brk_bh", "nlisted_adm_bh", "nlisted_hld_bh", "nlisted_app_bh", "nlisted_oth_bh", "nlisted_crd_bh")
obj.lfamts.bh <- c("nlisted_totfees_bh", "nlisted_appfees_bh", "nlisted_depfees_bh", "nlisted_othfees_bh", "nlisted_neg_bh")

# (4) Post-Visit Outcomes

post.wb <- c("ncb_wb", "noff_wb")
post.wh <- c("ncb_wh", "noff_wh")
post.bh <- c("ncb_bh", "noff_bh")


##=============================================================================##
## Define Vectors of Variable Names
##=============================================================================##

# ------------------  CASE-TESTER LEVEL INDICATORS --------------------- #

# (1) Early Stage Discrimination -- count vars, percent vars, any vars

es.con.a.labs <- c("Any contact (Black Tester)", "Scheduling appointment (Black Tester)")
es.num.a.labs <- c("No. of attributes brought up (Black Tester)", "No. attributes - skeptical response (Black Tester)", "No. attributes - positive response (Black Tester)", "No. attributes - neutral response (Black Tester)", "No. attributes - negative response (Black Tester)")
es.pct.a.labs <- c("Pct. of attributes - skeptical response (Black Tester)", "Pct. of attributes - positive response (Black Tester)", "Pct. of attributes - neutral response (Black Tester)", "Pct. of attributes - negative response (Black Tester)")
es.any.a.labs <- c("Responded skeptically for any attribute (Black Tester)", "Responded negatively for any attribute (Black Tester)")

es.con.b.labs <- c("Any contact (Hispanic Tester)", "Scheduling appointment (Hispanic Tester)")
es.num.b.labs <- c("No. of attributes brought up (Hispanic Tester)", "No. attributes - skeptical response (Hispanic Tester)", "No. attributes - positive response (Hispanic Tester)", "No. attributes - neutral response (Hispanic Tester)", "No. attributes - negative response (Hispanic Tester)")
es.pct.b.labs <- c("Pct. of attributes - skeptical response (Hispanic Tester)", "Pct. of attributes - positive response (Hispanic Tester)", "Pct. of attributes - neutral response (Hispanic Tester)", "Pct. of attributes - negative response (Hispanic Tester)")
es.any.b.labs <- c("Responded skeptically for any attribute (Hispanic Tester)", "Responded negatively for any attribute (Hispanic Tester)")

es.con.c.labs <- c("Any contact (White Tester)", "Scheduling appointment (White Tester)")
es.num.c.labs <- c("No. of attributes brought up (White Tester)", "No. attributes - skeptical response (White Tester)", "No. attributes - positive response (White Tester)", "No. attributes - neutral response (White Tester)", "No. attributes - negative response (White Tester)")
es.pct.c.labs <- c("Pct. of attributes - skeptical response (White Tester)", "Pct. of attributes - positive response (White Tester)", "Pct. of attributes - neutral response (White Tester)", "Pct. of attributes - negative response (White Tester)")
es.any.c.labs <- c("Responded skeptically for any attribute (White Tester)", "Responded negatively for any attribute (White Tester)")

# (2) Subjective Measures of Discrimination - In Person Interactions

subj.a.labs <- c("Perceived sales efforts (Black Tester)", "Received praise about rental qualifications (Black Tester)", "Positive reactions to testers' background (Black Tester)", "Positive editorializing (Black Tester)", "Professionalism (Black Tester)")
subj.b.labs <- c("Perceived sales efforts (Hispanic Tester)", "Received praise about rental qualifications (Hispanic Tester)", "Positive reactions to testers' background (Hispanic Tester)", "Positive editorializing (Hispanic Tester)", "Professionalism (Hispanic Tester)")
subj.c.labs <- c("Perceived sales efforts (White Tester)", "Received praise about rental qualifications (White Tester)", "Positive reactions to testers' background (White Tester)", "Positive editorializing (White Tester)", "Professionalism (White Tester)")

# (3) Objective Measures of Discrimination - In Person Interactions

# tester A
# number of units shown and whether shown listed unit
obj.show.a.labs <- c("Showed up to appointment (Black Tester)","Number of units shown (Black Tester)", "Shown unit listed in ad (Black Tester)")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.a.labs <- c("Average quoted monthly rental price across units shown (Black Tester)", "Number of units across units shown with rental price quote provided (Black Tester)", "Percent of units across units shown with rental price quote provided (Black Tester)", "Number of units across units shown where application is required (Black Tester)", "Percent of units across units shown where application is required (Black Tester)")
obj.hqnum.a.labs <- c("Number of units shown with doorman (Black Tester)", "Number of units shown with elevator (Black Tester)", "Number of units shown with washer and dryer in unit (Black Tester)", "Number of units shown with washer and dryer in building (Black Tester)")
obj.hqpct.a.labs <- c("Percent of units shown with doorman (Black Tester)", "Percent of units shown with elevator (Black Tester)", "Percent of units shown with washer and dryer in unit (Black Tester)", "Percent of units shown with washer and dryer in building (Black Tester)")
# listed unit -- quoted rent, number of amenities in rent, fee structure, fee amounts
obj.lquote.a.labs <- c("Quoted monthly rental price for listed unit (Black Tester)", "Stated number of amenities included in rent for listed unit (Black Tester)")
obj.lfstruct.a.labs <- c("Quoted requirement to secure unit: At least one month's rent (Black Tester)", "Quoted requirement to secure unit: Security deposit (Black Tester)", "Quoted requirement to secure unit: Broker's fees (Black Tester)", "Quoted requirement to secure unit: Administrative and processing fees (Black Tester)", "Quoted requirement to secure unit: Additional holding fees or good faith deposits (Black Tester)", "Quoted requirement to secure unit: Application fees (Black Tester)", "Quoted requirement to secure unit: Other fees (Black Tester)", "Quoted requirement to secure unit: Credit or background check fees (Black Tester)")
obj.lfamts.a.labs <- c("Total fees (Black Tester)", "Quoted amount: Application and credit check fees (Black Tester)", "Quoted amount: Upfront rent, deposit, and holding fees (Black Tester)", "Quoted amount: Administrative and other fees (Black Tester)", "Willing to negotiate on fees (Black Tester)")

# tester B
# number of units shown and whether shown listed unit
obj.show.b.labs <- c("Showed up to appointment (Hispanic Tester)","Number of units shown (Hispanic Tester)", "Shown unit listed in ad (Hispanic Tester)")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.b.labs <- c("Average quoted monthly rental price across units shown (Hispanic Tester)", "Number of units across units shown with rental price quote provided (Hispanic Tester)", "Percent of units across units shown with rental price quote provided (Hispanic Tester)", "Number of units across units shown where application is required (Hispanic Tester)", "Percent of units across units shown where application is required (Hispanic Tester)")
obj.hqnum.b.labs <- c("Number of units shown with doorman (Hispanic Tester)", "Number of units shown with elevator (Hispanic Tester)", "Number of units shown with washer and dryer in unit (Hispanic Tester)", "Number of units shown with washer and dryer in building (Hispanic Tester)")
obj.hqpct.b.labs <- c("Percent of units shown with doorman (Hispanic Tester)", "Percent of units shown with elevator (Hispanic Tester)", "Percent of units shown with washer and dryer in unit (Hispanic Tester)", "Percent of units shown with washer and dryer in building (Hispanic Tester)")
# listed unit -- quoted rent, number of amenities in rent, fee structure, fee amounts
obj.lquote.b.labs <- c("Quoted monthly rental price for listed unit (Hispanic Tester)", "Stated number of amenities included in rent for listed unit (Hispanic Tester)")
obj.lfstruct.b.labs <- c("Quoted requirement to secure unit: At least one month's rent (Hispanic Tester)", "Quoted requirement to secure unit: Security deposit (Hispanic Tester)", "Quoted requirement to secure unit: Broker's fees (Hispanic Tester)", "Quoted requirement to secure unit: Administrative and processing fees (Hispanic Tester)", "Quoted requirement to secure unit: Additional holding fees or good faith deposits (Hispanic Tester)", "Quoted requirement to secure unit: Application fees (Hispanic Tester)", "Quoted requirement to secure unit: Other fees (Hispanic Tester)", "Quoted requirement to secure unit: Credit or background check fees (Hispanic Tester)")
obj.lfamts.b.labs <- c("Total fees (Hispanic Tester)", "Quoted amount: Application and credit check fees (Hispanic Tester)", "Quoted amount: Upfront rent, deposit, and holding fees (Hispanic Tester)", "Quoted amount: Administrative and other fees (Hispanic Tester)", "Willing to negotiate on fees (Hispanic Tester)")

# tester C
# number of units shown and whether shown listed unit
obj.show.c.labs <- c("Showed up to appointment (Hispanic Tester)","Number of units shown (White Tester)", "Shown unit listed in ad (White Tester)")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.c.labs <- c("Average quoted monthly rental price across units shown (White Tester)", "Number of units across units shown with rental price quote provided (White Tester)", "Percent of units across units shown with rental price quote provided (White Tester)", "Number of units across units shown where application is required (White Tester)", "Percent of units across units shown where application is required (White Tester)")
obj.hqnum.c.labs <- c("Number of units shown with doorman (White Tester)", "Number of units shown with elevator (White Tester)", "Number of units shown with washer and dryer in unit (White Tester)", "Number of units shown with washer and dryer in building (White Tester)")
obj.hqpct.c.labs <- c("Percent of units shown with doorman (White Tester)", "Percent of units shown with elevator (White Tester)", "Percent of units shown with washer and dryer in unit (White Tester)", "Percent of units shown with washer and dryer in building (White Tester)")
# listed unit
obj.lquote.c.labs <- c("Quoted monthly rental price for listed unit (White Tester)", "Stated number of amenities included in rent for listed unit (White Tester)")
obj.lfstruct.c.labs <- c("Quoted requirement to secure unit: At least one month's rent (White Tester)", "Quoted requirement to secure unit: Security deposit (White Tester)", "Quoted requirement to secure unit: Broker's fees (White Tester)", "Quoted requirement to secure unit: Administrative and processing fees (White Tester)", "Quoted requirement to secure unit: Additional holding fees or good faith deposits (White Tester)", "Quoted requirement to secure unit: Application fees (White Tester)", "Quoted requirement to secure unit: Other fees (White Tester)", "Quoted requirement to secure unit: Credit or background check fees (White Tester)")
obj.lfamts.c.labs <- c("Total fees (White Tester)", "Quoted amount: Application and credit check fees (White Tester)", "Quoted amount: Upfront rent, deposit, and holding fees (White Tester)", "Quoted amount: Administrative and other fees (White Tester)", "Willing to negotiate on fees (White Tester)")


# (4) Post-Visit Outcomes

post.a.labs <- c("Received post-visit callback (Black Tester)", "Received post-visit offer for unit (Black Tester)")
post.b.labs <- c("Received post-visit callback (Hispanic Tester)", "Received post-visit offer for unit (Hispanic Tester)")
post.c.labs <- c("Received post-visit callback (White Tester)", "Received post-visit offer for unit (White Tester)")

# ------------------ NET MEASURES (DIFF BTWN TESTERS) ------------------ #

# (1) Early Stage Discrimination -- count vars, percent vars, any vars

es.con.wb.labs <- c("Any contact (White vs. Black)", "Scheduling appointment (White vs. Black)")
es.num.wb.labs <- c("No. of attributes brought up (White vs. Black)", "No. attributes - skeptical response (White vs. Black)", "No. attributes - positive response (White vs. Black)", "No. attributes - neutral response (White vs. Black)", "No. attributes - negative response (White vs. Black)")
es.pct.wb.labs <- c("Pct. of attributes - skeptical response (White vs. Black)", "Pct. of attributes - positive response (White vs. Black)", "Pct. of attributes - neutral response (White vs. Black)", "Pct. of attributes - negative response (White vs. Black)")
es.any.wb.labs <- c("Responded skeptically for any attribute (White vs. Black)", "Responded negatively for any attribute (White vs. Black)")

es.con.wh.labs <- c("Any contact (White vs. Hispanic)", "Scheduling appointment (White vs. Hispanic)")
es.num.wh.labs <- c("No. of attributes brought up (White vs. Hispanic)", "No. attributes - skeptical response (White vs. Hispanic)", "No. attributes - positive response (White vs. Hispanic)", "No. attributes - neutral response (White vs. Hispanic)", "No. attributes - negative response (White vs. Hispanic)")
es.pct.wh.labs <- c("Pct. of attributes - skeptical response (White vs. Hispanic)", "Pct. of attributes - positive response (White vs. Hispanic)", "Pct. of attributes - neutral response (White vs. Hispanic)", "Pct. of attributes - negative response (White vs. Hispanic)")
es.any.wh.labs <- c("Responded skeptically for any attribute (White vs. Hispanic)", "Responded negatively for any attribute (White vs. Hispanic)")

es.con.bh.labs <- c("Any contact (Black vs. Hispanic)", "Scheduling appointment (Black vs. Hispanic)")
es.num.bh.labs <- c("No. of attributes brought up (Black vs. Hispanic)", "No. attributes - skeptical response (Black vs. Hispanic)", "No. attributes - positive response (Black vs. Hispanic)", "No. attributes - neutral response (Black vs. Hispanic)", "No. attributes - negative response (Black vs. Hispanic)")
es.pct.bh.labs <- c("Pct. of attributes - skeptical response (Black vs. Hispanic)", "Pct. of attributes - positive response (Black vs. Hispanic)", "Pct. of attributes - neutral response (Black vs. Hispanic)", "Pct. of attributes - negative response (Black vs. Hispanic)")
es.any.bh.labs <- c("Responded skeptically for any attribute (Black vs. Hispanic)", "Responded negatively for any attribute (Black vs. Hispanic)")

# (2) Subjective Measures of Discrimination - In Person Interactions

subj.wb.labs <- c("Perceived sales efforts (White vs. Black)", "Received praise about rental qualifications (White vs. Black)", "Positive reactions to testers' background (White vs. Black)", "Positive editorializing (White vs. Black)", "Professionalism (White vs. Black)")
subj.wh.labs <- c("Perceived sales efforts (White vs. Hispanic)", "Received praise about rental qualifications (White vs. Hispanic)", "Positive reactions to testers' background (White vs. Hispanic)", "Positive editorializing (White vs. Hispanic)", "Professionalism (White vs. Hispanic)")
subj.bh.labs <- c("Perceived sales efforts (Black vs. Hispanic)", "Received praise about rental qualifications (Black vs. Hispanic)", "Positive reactions to testers' background (Black vs. Hispanic)", "Positive editorializing (Black vs. Hispanic)", "Professionalism (Black vs. Hispanic)")

# (3) Objective Measures of Discrimination - In Person Interactions

# W-B net measures
# number of units shown and whether shown listed unit
obj.show.wb.labs <- c("Showed up to appointment (White vs. Black)","Number of units shown (White vs. Black)", "Shown unit listed in ad (White vs. Black)")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.wb.labs <- c("Average quoted monthly rental price across units shown (White vs. Black)", "Number of units across units shown with rental price quote provided (White vs. Black)", "Percent of units across units shown with rental price quote provided (White vs. Black)", "Number of units across units shown where application is required (White vs. Black)", "Percent of units across units shown where application is required (White vs. Black)")
obj.hqnum.wb.labs <- c("Number of units shown with doorman (White vs. Black)", "Number of units shown with elevator (White vs. Black)", "Number of units shown with washer and dryer in unit (White vs. Black)", "Number of units shown with washer and dryer in building (White vs. Black)")
obj.hqpct.wb.labs <- c("Percent of units shown with doorman (White vs. Black)", "Percent of units shown with elevator (White vs. Black)", "Percent of units shown with washer and dryer in unit (White vs. Black)", "Percent of units shown with washer and dryer in building (White vs. Black)")
# listed unit -- quoted rent, number of amenities in rent, fee structure, fee amounts
obj.lquote.wb.labs <- c("Quoted monthly rental price for listed unit (White vs. Black)", "Stated number of amenities included in rent for listed unit (White vs. Black)")
obj.lfstruct.wb.labs <- c("Quoted requirement to secure unit: At least one month's rent (White vs. Black)", "Quoted requirement to secure unit: Security deposit (White vs. Black)", "Quoted requirement to secure unit: Broker's fees (White vs. Black)", "Quoted requirement to secure unit: Administrative and processing fees (White vs. Black)", "Quoted requirement to secure unit: Additional holding fees or good faith deposits (White vs. Black)", "Quoted requirement to secure unit: Application fees (White vs. Black)", "Quoted requirement to secure unit: Other fees (White vs. Black)", "Quoted requirement to secure unit: Credit or background check fees (White vs. Black)")
obj.lfamts.wb.labs <- c("Total fees (White vs. Black)", "Quoted amount: Application and credit check fees (White vs. Black)", "Quoted amount: Upfront rent, deposit, and holding fees (White vs. Black)", "Quoted amount: Administrative and other fees (White vs. Black)", "Willing to negotiate on fees (White vs. Black)")

# W-H net measures
# number of units shown and whether shown listed unit
obj.show.wh.labs <- c("Showed up to appointment (White vs. Hispanic)","Number of units shown (White vs. Hispanic)", "Shown unit listed in ad (White vs. Hispanic)")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.wh.labs <- c("Average quoted monthly rental price across units shown (White vs. Hispanic)", "Number of units across units shown with rental price quote provided (White vs. Hispanic)", "Percent of units across units shown with rental price quote provided (White vs. Hispanic)", "Number of units across units shown where application is required (White vs. Hispanic)", "Percent of units across units shown where application is required (White vs. Hispanic)")
obj.hqnum.wh.labs <- c("Number of units shown with doorman (White vs. Hispanic)", "Number of units shown with elevator (White vs. Hispanic)", "Number of units shown with washer and dryer in unit (White vs. Hispanic)", "Number of units shown with washer and dryer in building (White vs. Hispanic)")
obj.hqpct.wh.labs <- c("Percent of units shown with doorman (White vs. Hispanic)", "Percent of units shown with elevator (White vs. Hispanic)", "Percent of units shown with washer and dryer in unit (White vs. Hispanic)", "Percent of units shown with washer and dryer in building (White vs. Hispanic)")
# listed unit -- quoted rent, number of amenities in rent, fee structure, fee amounts
obj.lquote.wh.labs <- c("Quoted monthly rental price for listed unit (White vs. Hispanic)", "Stated number of amenities included in rent for listed unit (White vs. Hispanic)")
obj.lfstruct.wh.labs <- c("Quoted requirement to secure unit: At least one month's rent (White vs. Hispanic)", "Quoted requirement to secure unit: Security deposit (White vs. Hispanic)", "Quoted requirement to secure unit: Broker's fees (White vs. Hispanic)", "Quoted requirement to secure unit: Administrative and processing fees (White vs. Hispanic)", "Quoted requirement to secure unit: Additional holding fees or good faith deposits (White vs. Hispanic)", "Quoted requirement to secure unit: Application fees (White vs. Hispanic)", "Quoted requirement to secure unit: Other fees (White vs. Hispanic)", "Quoted requirement to secure unit: Credit or background check fees (White vs. Hispanic)")
obj.lfamts.wh.labs <- c("Total fees (White vs. Hispanic)", "Quoted amount: Application and credit check fees (White vs. Hispanic)", "Quoted amount: Upfront rent, deposit, and holding fees (White vs. Hispanic)", "Quoted amount: Administrative and other fees (White vs. Hispanic)", "Willing to negotiate on fees (White vs. Hispanic)")

# B-H net measures
# number of units shown and whether shown listed unit
obj.show.bh.labs <- c("Showed up to appointment (Black vs. Hispanic)","Number of units shown (Black vs. Hispanic)", "Shown unit listed in ad (Black vs. Hispanic)")
# across units shown - rental price, quoted rent, quality of housing stock
obj.quote.bh.labs <- c("Average quoted monthly rental price across units shown (Black vs. Hispanic)", "Number of units across units shown with rental price quote provided (Black vs. Hispanic)", "Percent of units across units shown with rental price quote provided (Black vs. Hispanic)", "Number of units across units shown where application is required (Black vs. Hispanic)", "Percent of units across units shown where application is required (Black vs. Hispanic)")
obj.hqnum.bh.labs <- c("Number of units shown with doorman (Black vs. Hispanic)", "Number of units shown with elevator (Black vs. Hispanic)", "Number of units shown with washer and dryer in unit (Black vs. Hispanic)", "Number of units shown with washer and dryer in building (Black vs. Hispanic)")
obj.hqpct.bh.labs <- c("Percent of units shown with doorman (Black vs. Hispanic)", "Percent of units shown with elevator (Black vs. Hispanic)", "Percent of units shown with washer and dryer in unit (Black vs. Hispanic)", "Percent of units shown with washer and dryer in building (Black vs. Hispanic)")
# listed unit
obj.lquote.bh.labs <- c("Quoted monthly rental price for listed unit (Black vs. Hispanic)", "Stated number of amenities included in rent for listed unit (Black vs. Hispanic)")
obj.lfstruct.bh.labs <- c("Quoted requirement to secure unit: At least one month's rent (Black vs. Hispanic)", "Quoted requirement to secure unit: Security deposit (Black vs. Hispanic)", "Quoted requirement to secure unit: Broker's fees (Black vs. Hispanic)", "Quoted requirement to secure unit: Administrative and processing fees (Black vs. Hispanic)", "Quoted requirement to secure unit: Additional holding fees or good faith deposits (Black vs. Hispanic)", "Quoted requirement to secure unit: Application fees (Black vs. Hispanic)", "Quoted requirement to secure unit: Other fees (Black vs. Hispanic)", "Quoted requirement to secure unit: Credit or background check fees (Black vs. Hispanic)")
obj.lfamts.bh.labs <- c("Total fees (Black vs. Hispanic)", "Quoted amount: Application and credit check fees (Black vs. Hispanic)", "Quoted amount: Upfront rent, deposit, and holding fees (Black vs. Hispanic)", "Quoted amount: Administrative and other fees (Black vs. Hispanic)", "Willing to negotiate on fees (Black vs. Hispanic)")

# (4) Post-Visit Outcomes

post.wb.labs <- c("Received post-visit callback (White vs. Black)", "Received post-visit offer for unit (White vs. Black)")
post.wh.labs <- c("Received post-visit callback (White vs. Hispanic)", "Received post-visit offer for unit (White vs. Hispanic)")
post.bh.labs <- c("Received post-visit callback (Black vs. Hispanic)", "Received post-visit offer for unit (Black vs. Hispanic)")



#==============#
# Prep variable vectors for early stage discrim tables
#==============#

# early stage discrimination - tester level variables
es.mat <- cbind(c(es.con.a, es.num.a, es.pct.a, es.any.a),
                c(es.con.b, es.num.b, es.pct.b, es.any.b),
                c(es.con.c, es.num.c, es.pct.c, es.any.c))
es.mat.labs <-  cbind(c(es.con.a.labs, es.num.a.labs, es.pct.a.labs, es.any.a.labs),
                      c(es.con.b.labs, es.num.b.labs, es.pct.b.labs, es.any.b.labs),
                      c(es.con.c.labs, es.num.c.labs, es.pct.c.labs, es.any.c.labs))
es.mat; es.mat.labs

# early stage discrimination - net measures
net.es.mat <- cbind(c(es.con.wb, es.num.wb, es.pct.wb, es.any.wb),
                    c(es.con.wh, es.num.wh, es.pct.wh, es.any.wh),
                    c(es.con.bh, es.num.bh, es.pct.bh, es.any.bh))
net.es.mat.labs <-  cbind(c(es.con.wb.labs, es.num.wb.labs, es.pct.wb.labs, es.any.wb.labs),
                          c(es.con.wh.labs, es.num.wh.labs, es.pct.wh.labs, es.any.wh.labs),
                          c(es.con.bh.labs, es.num.bh.labs, es.pct.bh.labs, es.any.bh.labs))
net.es.mat; net.es.mat.labs


# set up variable vectors and label vectors

es.a <- es.mat[,1]
es.b <- es.mat[,2]
es.c <- es.mat[,3]
es.wb <- net.es.mat[,1]
es.wh <- net.es.mat[,2]
es.bh <- net.es.mat[,3]

es.a.labs <- es.mat.labs[,1]
es.b.labs <- es.mat.labs[,2]
es.c.labs <- es.mat.labs[,3]
es.wb.labs <- net.es.mat.labs[,1]
es.wh.labs <- net.es.mat.labs[,2]
es.bh.labs <- net.es.mat.labs[,3]

length(es.a)
length(es.b)
length(es.c)
length(es.wb)
length(es.wh)
length(es.bh)

#==============#
# Prep variable vectors for baseline tables
#==============#

### Define vectors of variables to loop over

# objective in-person outcomes
obj.mat <- cbind(c(obj.show.a, obj.quote.a, obj.hqnum.a, obj.hqpct.a, obj.lquote.a, obj.lfstruct.a, obj.lfamts.a),
                 c(obj.show.b, obj.quote.b, obj.hqnum.b, obj.hqpct.b, obj.lquote.b, obj.lfstruct.b, obj.lfamts.b),
                 c(obj.show.c, obj.quote.c, obj.hqnum.c, obj.hqpct.c, obj.lquote.c, obj.lfstruct.c, obj.lfamts.c))
obj.mat.labs <- cbind(c(obj.show.a.labs, obj.quote.a.labs, obj.hqnum.a.labs, obj.hqpct.a.labs, obj.lquote.a.labs, obj.lfstruct.a.labs, obj.lfamts.a.labs),
                      c(obj.show.b.labs, obj.quote.b.labs, obj.hqnum.b.labs, obj.hqpct.b.labs, obj.lquote.b.labs, obj.lfstruct.b.labs, obj.lfamts.b.labs),
                      c(obj.show.c.labs, obj.quote.c.labs, obj.hqnum.c.labs, obj.hqpct.c.labs, obj.lquote.c.labs, obj.lfstruct.c.labs, obj.lfamts.c.labs))
obj.mat; obj.mat.labs

# subjective in-person outcomes
subj.mat <- cbind(c(subj.a),
                  c(subj.b),
                  c(subj.c))
subj.mat.labs <- cbind(c(subj.a.labs),
                       c(subj.b.labs),
                       c(subj.c.labs))
subj.mat; subj.mat.labs

# post visit outcomes
post.mat <- cbind(c(post.a),
                  c(post.b),
                  c(post.c))
post.mat.labs <- cbind(c(post.a.labs),
                       c(post.b.labs),
                       c(post.c.labs))
post.mat; post.mat.labs


# objective in-person outcomes
net.obj.mat <- cbind(c(obj.show.wb, obj.quote.wb, obj.hqnum.wb, obj.hqpct.wb, obj.lquote.wb, obj.lfstruct.wb, obj.lfamts.wb),
                     c(obj.show.wh, obj.quote.wh, obj.hqnum.wh, obj.hqpct.wh, obj.lquote.wh, obj.lfstruct.wh, obj.lfamts.wh),
                     c(obj.show.bh, obj.quote.bh, obj.hqnum.bh, obj.hqpct.bh, obj.lquote.bh, obj.lfstruct.bh, obj.lfamts.bh))
net.obj.mat.labs <- cbind(c(obj.show.wb.labs, obj.quote.wb.labs, obj.hqnum.wb.labs, obj.hqpct.wb.labs, obj.lquote.wb.labs, obj.lfstruct.wb.labs, obj.lfamts.wb.labs),
                          c(obj.show.wh.labs, obj.quote.wh.labs, obj.hqnum.wh.labs, obj.hqpct.wh.labs, obj.lquote.wh.labs, obj.lfstruct.wh.labs, obj.lfamts.wh.labs),
                          c(obj.show.bh.labs, obj.quote.bh.labs, obj.hqnum.bh.labs, obj.hqpct.bh.labs, obj.lquote.bh.labs, obj.lfstruct.bh.labs, obj.lfamts.bh.labs))
net.obj.mat; net.obj.mat.labs

# subjective in-person outcomes
net.subj.mat <- cbind(c(subj.wb),
                      c(subj.wh),
                      c(subj.bh))
net.subj.mat.labs <- cbind(c(subj.wb.labs),
                           c(subj.wh.labs),
                           c(subj.bh.labs))
net.subj.mat; net.subj.mat.labs

net.ind.mat <- c("index.wb","index.wh","index.bh")
net.ind.mat.labs <- c("Index measure of favorable in-person interactions (White vs. Black)",
                      "Index measure of favorable in-person interactions (White vs. Hispanic)",
                      "Index measure of favorable in-person interactions (Black vs. Hispanic)")

# post visit outcomes
net.post.mat <- cbind(c(post.wb),
                      c(post.wh),
                      c(post.bh))
net.post.mat.labs <- cbind(c(post.wb.labs),
                           c(post.wh.labs),
                           c(post.bh.labs))
net.post.mat; net.post.mat.labs


# create vectors of outcome variables to loop over
outvars.a <- c(obj.mat[1,1], subj.mat[,1], post.mat[,1])
outvars.b <- c(obj.mat[1,2], subj.mat[,2], post.mat[,2])
outvars.c <- c(obj.mat[1,3], subj.mat[,3], post.mat[,3])
outvars.wb <- c(net.obj.mat[1,1], net.subj.mat[,1], net.post.mat[,1])
outvars.wh <- c(net.obj.mat[1,2], net.subj.mat[,2], net.post.mat[,2])
outvars.bh <- c(net.obj.mat[1,3], net.subj.mat[,3], net.post.mat[,3])

# create vectors of outcome variable labels to loop over
outvars.a.labs <- c(obj.mat.labs[1,1], subj.mat.labs[,1], post.mat.labs[,1])
outvars.b.labs <- c(obj.mat.labs[1,2], subj.mat.labs[,2], post.mat.labs[,2])
outvars.c.labs <- c(obj.mat.labs[1,3], subj.mat.labs[,3], post.mat.labs[,3])
outvars.wb.labs <- c(net.obj.mat.labs[1,1], net.subj.mat.labs[,1], net.post.mat.labs[,1])
outvars.wh.labs <- c(net.obj.mat.labs[1,2], net.subj.mat.labs[,2], net.post.mat.labs[,2])
outvars.bh.labs <- c(net.obj.mat.labs[1,3], net.subj.mat.labs[,3], net.post.mat.labs[,3])



#===============#
# Prep variables for ITT and CACE
#===============#


# Convert analysis variables to numeric
cols <- c("cid","TA", "ipw", grep("^cb", names(dat), value=T), grep("^off", names(dat), value=T))
dat[,cols] = apply(dat[,cols], 2, as.numeric)

dat$TA0 <- ifelse(dat$TA==0, 1, 0)
dat$TA1 <- ifelse(dat$TA==1, 1, 0)
dat$TA2 <- ifelse(dat$TA==2, 1, 0)

# Define vectors of variables to loop over

### TESTER LEVEL INDICATORS

outvars.a <- c(obj.mat[1,1], subj.mat[,1], post.mat[,1])
outvars.b <- c(obj.mat[1,2], subj.mat[,2], post.mat[,2])
outvars.c <- c(obj.mat[1,3], subj.mat[,3], post.mat[,3])

outvars.a.labs <- c(obj.mat.labs[1,1], subj.mat.labs[,1], post.mat.labs[,1])
outvars.b.labs <- c(obj.mat.labs[1,2], subj.mat.labs[,2], post.mat.labs[,2])
outvars.c.labs <- c(obj.mat.labs[1,3], subj.mat.labs[,3], post.mat.labs[,3])

### NET MEASURES

# create vectors of outcome variables to loop over
outvars.wb <- c(net.obj.mat[1,1], net.ind.mat[1], net.post.mat[,1])
outvars.wh <- c(net.obj.mat[1,2], net.ind.mat[2], net.post.mat[,2])
outvars.bh <- c(net.obj.mat[1,3], net.ind.mat[3], net.post.mat[,3])

# create vectors of outcome variable labels to loop over
outvars.wb.labs <- c(net.obj.mat.labs[1,1], net.ind.mat.labs[1], net.post.mat.labs[,1])
outvars.wh.labs <- c(net.obj.mat.labs[1,2], net.ind.mat.labs[2], net.post.mat.labs[,2])
outvars.bh.labs <- c(net.obj.mat.labs[1,3], net.ind.mat.labs[3], net.post.mat.labs[,3])

cols <- c(outvars.a, outvars.b, outvars.c, outvars.wb, outvars.wh, outvars.bh)
dat[,cols] <- apply(dat[,cols], 2, as.numeric)

#===============#
# Create two-group estimator IPWs
#===============#

# create probability of treatment (for 2 group estimator)
# if in regime 1, equal probability of treatment

dat$pt10 <- ifelse(dat$regime==1, .5, ifelse(dat$regime==2, 1/3, .5))
dat$pt20 <- ifelse(dat$regime==1, .5, ifelse(dat$regime==2, 1/3, .5))
dat$pt21 <- ifelse(dat$regime==1, .5, ifelse(dat$regime==2, .5, .5))

# create ipw from probability of treatment (for 2 group estimator)

dat$ipw10 <- ifelse(dat$TA == 1, 1/dat$pt10, ifelse(dat$TA==0, 1/(1-dat$pt10), NA))
dat$ipw20 <- ifelse(dat$TA == 2, 1/dat$pt20, ifelse(dat$TA==0, 1/(1-dat$pt20), NA))
dat$ipw21 <- ifelse(dat$TA == 2, 1/dat$pt21, ifelse(dat$TA==1, 1/(1-dat$pt21), NA))

#===============#
# Prepare index variables
#===============#

# Mean Effects
# Note, missing data imputed with 0; this is conversative in that it will be true across treatment conditions

long = function(root) c(dat[paste(root, "_A", sep="")][,1], dat[paste(root, "_B", sep="")][,1], dat[paste(root, "_C", sep="")][,1])
longData <- data.frame(
  TA <- rep(dat$TA, 3),
  sales = long("sales"),          # (sales efforts)
  qualpraise=long("qualpraise"),  # (qualifications to rent praised)
  posbg=long("posbg"),            # (positive feedback on bio/background)
  posedit=long("posedit"),        # (positive editorializing)
  prof=long("prof"))              # (professionalism of landlord/broker)

## Mean effects function	
m.eff = function(data=longData,vars) {
  a = data
  Ccenter = apply(a[a$TA==0,vars],2,mean,na.rm=TRUE)
  Csd = apply(a[a$TA==0,vars],2,sd,na.rm=TRUE)
  a[,vars] = scale(a[,vars],center=Ccenter,scale=Csd)
  meaneff = apply(a[,vars],1,sum,na.rm=TRUE)/apply(a[,vars],1,function(x) sum(!is.na(x))) 
  return(meaneff/sd(meaneff[a$TA==0], na.rm=TRUE))
} 

indexvars <- c('sales', 'qualpraise', 'posbg', 'posedit', 'prof')  
longData$meindex <-  m.eff(longData, indexvars)

longData$meindex.impute <-  longData$meindex
longData$meindex.impute[is.nan(longData$meindex)] <-  0

dat$meindex_A <- longData$meindex[1:nrow(dat)]
dat$meindex_B <- longData$meindex[(nrow(dat)+1):(2*nrow(dat))]
dat$meindex_C <- longData$meindex[(2*nrow(dat)+1):(3*nrow(dat))]

dat$meindex.impute_A <- longData$meindex.impute[1:nrow(dat)]
dat$meindex.impute_B <- longData$meindex.impute[(nrow(dat)+1):(2*nrow(dat))]
dat$meindex.impute_C <- longData$meindex.impute[(2*nrow(dat)+1):(3*nrow(dat))]

table(is.nan(dat$meindex_C))


#===============#
# Recode -9 and invalid values as NAs for scraped covariates from ads
#===============#

aud$rent <- ifelse(aud$rent %in% c(-9, 1), NA, aud$rent)
dat$rent <- ifelse(dat$rent %in% c(-9, 1), NA, dat$rent)

aud$sqft <- ifelse(aud$sqft %in% c(2, -9), NA, aud$sqft)
dat$sqft <- ifelse(dat$sqft %in% c(2, -9), NA, dat$sqft)


#-----------------------------------------------------------------------------#
# Define covariates -- 
#  Used for covariate selection procedure, balance tables, randomization check

llrace <- c("primary_api", "primary_blk", "primary_hsp", "primary_wht")
llage <- c("primary_age_18to34", "primary_age_35to44", "primary_age_45to64", "primary_age_65over", "primary_age_unknown")
testerfe <- c("tid.A01", "tid.A10", "tid.A11", "tid.A13", "tid.A02", "tid.A21", "tid.A22", "tid.A03", "tid.A04", "tid.A05",
              "tid.A06", "tid.A07", "tid.A08", "tid.A09", "tid.B01", "tid.B11", "tid.B12", "tid.B14", "tid.B16", "tid.B02", 
              "tid.B20", "tid.B23", "tid.B24", "tid.B25", "tid.B27", "tid.B03", "tid.B04", "tid.B06", "tid.B07", "tid.B08", 
              "tid.B09", "tid.C01", "tid.C10", "tid.C12", "tid.C13", "tid.C14", "tid.C15", "tid.C02", "tid.C27", "tid.C29", 
              "tid.C03", "tid.C31", "tid.C33", "tid.C04", "tid.C05", "tid.C06", "tid.C07", "tid.C08", "tid.C09")
tafe <- testerfe[grepl(".A",testerfe,fixed=TRUE)]
tbfe <- testerfe[grepl(".B",testerfe,fixed=TRUE)]
tcfe <- testerfe[grepl(".C",testerfe,fixed=TRUE)]
Xs <- c("frame", "partnered", "rent + m.rent", "numbr", "sqft + m.sqft","regime1","regime2","regime3",
        "nnumattr_bh", "nnumattr_wh", "nnumattr_wb", "nnumskep_bh", "nnumskep_wh", "nnumskep_wb", 
        "npctskep_bh", "npctskep_wh", "npctskep_wb", "nnumpos_bh" , "nnumpos_wh" , "nnumpos_wb" , 
        "nnumneu_bh" , "nnumneu_wh" , "nnumneu_wb" , "nnumneg_bh" , "nnumneg_wh" , "nnumneg_wb" , 
        "npctpos_bh" , "npctpos_wh" , "npctpos_wb" , "npctneu_bh" , "npctneu_wh" , "npctneu_wb" , 
        "npctneg_bh" , "npctneg_wh" , "npctneg_wb" , "nanyskep_bh", "nanyskep_wh", "nanyskep_wb", 
        "nanyneg_bh" , "nanyneg_wh" , "nanyneg_wb" , "team_gender", "broker",
        "callorder.wb", "callorder.wh", "callorder.bh",
        "incrank.wb.gt", "incrank.wh.gt", "incrank.bh.gt",
        "incrank.wb.eq", "incrank.wh.eq", "incrank.bh.eq",
        "incrank.wb.lt", "incrank.wh.lt", "incrank.bh.lt",
        "boro.brx", "boro.brk", "boro.mnh", "boro.que", "boro.stn",
        "inc.w.hi","inc.b.hi","inc.h.hi","ll.female + m.ll.female",
        llrace, llage, testerfe)