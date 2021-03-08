Usage:
	@echo "WIP"

# Experiments
AccuracyOnSyntheticCiphers: cleanAOSC AOSCSamples AOSCRun AOSCResults

ImpactOfLanguageSampleSize: cleanIOLSS IOLSSSamples IOLSSRun IOLSSResults

IsDorabellaEnglish: cleanIsEng
	@echo "Running Is Dorabella English..."
	@cd LanguageIdentification && ./runIsDorabellaEnglish.sh
	@cd LanguageIdentification/IsDorabellaEnglish/Scripts && python3 sortTrialResults.py

IsDorabellaMusic:
	@echo "HILLCLIMBC Elgar Results"
	@cd DeciphermentAccuracy/HILLCLIMBC-Elgar && ./testAccuracy.sh | python3 ../Scripts/formatOutput.py
	@echo "\nHILLCLIMBC Bach Results"
	@cd DeciphermentAccuracy/HILLCLIMBC-Bach && ./testAccuracy.sh | python3 ../Scripts/formatOutput.py
	@echo "\nGREEDY Elgar Results"
	@cd DeciphermentAccuracy/GREEDY-Elgar && ./testAccuracy.sh | python3 ../Scripts/formatOutput.py
	@echo "\nGREEDY Bach Results"
	@cd DeciphermentAccuracy/GREEDY-Bach && ./testAccuracy.sh | python3 ../Scripts/formatOutput.py

ImpactOfPerplexity:
	@echo "Impact Of Perplexity"
	@cd ImpactOfPerplexityMusicVsText && ./calcPerplexity.sh

ClassifyingTextAndMusic: cleanCTAM CTAMRun CTAMResults

Decipherment:
	@echo "TREESEARCH Results"
	@cd DeciphermentAccuracy/TREESEARCH-LJA-DCLM && ./testAccuracy.sh | python3 ../Scripts/formatOutput.py
	@echo "\nHILLCLIMB Results"
	@cd DeciphermentAccuracy/HILLCLIMB-LJA-DCLM && ./testAccuracy.sh | python3 ../Scripts/formatOutput.py
	@echo "\nHILLCLIMBC Results"
	@cd DeciphermentAccuracy/HILLCLIMBC-LJA-DCLM && ./testAccuracy.sh | python3 ../Scripts/formatOutput.py
	@echo "\nGREEDY Results"
	@cd DeciphermentAccuracy/GREEDY-LJA-DCLM && ./testAccuracy.sh | python3 ../Scripts/formatOutput.py
	@echo "\nUNRAVEL Results"
	@cd DeciphermentAccuracy/UNRAVEL-LJA-DCLM && ./testAccuracy.sh | python3 ../Scripts/formatOutput.py

ApplicationToDorabella:
	@echo "Running HILLCLIMBC on Dorabella Cipher"
	@cd TextDeciphermentPrograms/HILLCLIMBC/Solver && python2 norvigsolver.py DorabellaTranscription.txt

MirroredSymbols:
	@echo "Running Mirrored Symbols Experiment"
	@cd CiphertextCharacteristics && ./mirroredSymbols.sh

LongestSequence:
	@echo "Running Longest Sequence Experiment"
	@cd CiphertextCharacteristics && ./longestSequence.sh

# MASC Solvers
HILLCLIMB: cleanHILLCLIMB HILLCLIMBLM HILLCLIMBRun

HILLCLIMBRun:
	@echo "Running HILLCLIMB Solver"
	@cd TextDeciphermentPrograms/HILLCLIMB && ./runNorvig.sh
	
HILLCLIMBLM:
	@echo "Creating HILLCLIMB LM..."
	@cd TextDeciphermentPrograms/HILLCLIMB/LM && ./createLM.sh

HILLCLIMBC: cleanHILLCLIMBC HILLCLIMBCLM HILLCLIMBCRun

HILLCLIMBCRun:
	@echo "Running HILLCLIMBC Solver"
	@cd TextDeciphermentPrograms/HILLCLIMBC && ./runNorvigCLM.sh
	
HILLCLIMBCLM:
	@echo "Creating HILLCLIMBC LM..."
	@cd TextDeciphermentPrograms/HILLCLIMBC/LM && ./createLM.sh

TREESEARCH: cleanTREESEARCH TREESEARCHLM TREESEARCHRun

TREESEARCHRun:
	@echo "Running TREESEARCH Solver. NOTE: This solver takes a long time to run"
	@cd TextDeciphermentPrograms/TREESEARCH && ./runMCTS.sh
	
TREESEARCHLM:
	@echo "Creating TREESEARCH LM..."
	@cd TextDeciphermentPrograms/TREESEARCH/LM && ./createLM.sh

GREEDY:
	@echo "Running GREEDY Solver"
	@cd TextDeciphermentPrograms/GREEDY && ./runEnglish.sh

# Helpers for experiments
AOSCSamples: 
	@echo "Creating AOSC Samples..."
	@cd LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples && ./createSamples.sh

AOSCRun: 
	@echo "Running Language Identification. NOTE: this experiment may take multiple days to run"
	@cd LanguageIdentification && ./runAccuracyOnSyntheticCiphers.sh

AOSCRunParallel: 
	@echo "Running Parallel Language Identification"
	@cd LanguageIdentification && ./runAccuracyOnSyntheticCiphersParallel.sh

AOSCResults: 
	@echo "Calculating Trial Results"
	@cd LanguageIdentification/AccuracyOnSyntheticCiphers/Scripts && ./TrialResults.sh
	@echo "Calculating Unigram Results"
	@cd LanguageIdentification/AccuracyOnSyntheticCiphers/Scripts && ./UniResults.sh
	@cd LanguageIdentification/AccuracyOnSyntheticCiphers/Scripts && python3 aggResults.py
	@rm LanguageIdentification/AccuracyOnSyntheticCiphers/Results/*.txt

IOLSSSamples:
	@echo "Creating AOSC Samples..."
	@cd LanguageIdentification/ImpactOfLanguageSampleSize/TestSamples && ./createSamples.sh

IOLSSRun: 
	@echo "Running Impact Of Language Sample Size. NOTE: this experiment may take a long time to run"
	@cd LanguageIdentification && ./runImpactOfLanguageSampleSize.sh

IOLSSRunParallel: 
	@echo "Running Parallel Impact Of Language Sample Size"
	@cd LanguageIdentification && ./runImpactOfLanguageSampleSizeParallel.sh

IOLSSResults: 
	@echo "Calculating IOLSS Results"
	@cd LanguageIdentification/ImpactOfLanguageSampleSize/Scripts && python3 calcResultsTrial.py

CTAMRun:
	@echo "Running Classifying Text And Music"
	@cd LanguageIdentification && ./ClassifyingTextAndMusic.sh

CTAMRunParallel:
	@echo "Running Parallel Classifying Text And Music"
	@cd LanguageIdentification && ./ClassifyingTextAndMusicParallel.sh

CTAMResults:
	@cd LanguageIdentification/ClassifyingTextAndMusic && ./printResults.sh

# Cleaning setups
clean: cleanAOSC cleanIsEng cleanIOLSS cleanCTAM cleanIsEng cleanHILLCLIMB cleanHILLCLIMBC cleanTREESEARCH cleanGREEDY

cleanIsEng:
	@echo "Cleaning Is Dorabella English Experiment"
	@rm -r LanguageIdentification/IsDorabellaEnglish/Results
	@mkdir LanguageIdentification/IsDorabellaEnglish/Results

cleanCTAM:
	@echo "Cleaning Classifying Text And Music"
	@rm -r LanguageIdentification/ClassifyingTextAndMusic/Results
	@mkdir LanguageIdentification/ClassifyingTextAndMusic/Results

cleanIOLSS:
	@echo "Cleaning IOLSS Experiment"
	@rm -r LanguageIdentification/ImpactOfLanguageSampleSize/Results
	@mkdir LanguageIdentification/ImpactOfLanguageSampleSize/Results

	@rm -r LanguageIdentification/ImpactOfLanguageSampleSize/TestSamples/Samples
	@mkdir LanguageIdentification/ImpactOfLanguageSampleSize/TestSamples/Samples
	@mkdir LanguageIdentification/ImpactOfLanguageSampleSize/TestSamples/Samples/En
	@mkdir LanguageIdentification/ImpactOfLanguageSampleSize/TestSamples/Samples/Fr
	@mkdir LanguageIdentification/ImpactOfLanguageSampleSize/TestSamples/Samples/Pl
	@mkdir LanguageIdentification/ImpactOfLanguageSampleSize/TestSamples/Samples/De
	@mkdir LanguageIdentification/ImpactOfLanguageSampleSize/TestSamples/Samples/It

cleanAOSC:
	@echo "Cleaning AOSC Experiment"
	@rm -r LanguageIdentification/AccuracyOnSyntheticCiphers/Results/2K
	@rm -r LanguageIdentification/AccuracyOnSyntheticCiphers/Results/2KNS
	@rm -r LanguageIdentification/AccuracyOnSyntheticCiphers/Results/87
	@rm -r LanguageIdentification/AccuracyOnSyntheticCiphers/Results/87NS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/Results/2K
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/Results/2KNS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/Results/87
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/Results/87NS

	@rm -r LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K
	@rm -r LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87

	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/DeSamples2K
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/EnSamples2K
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/FrSamples2K
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/ItSamples2K
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/JASamples2K
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/PlSamples2K

	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/DeSamples2KNS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/EnSamples2KNS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/FrSamples2KNS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/ItSamples2KNS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/JASamples2KNS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/2K/PlSamples2KNS

	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/DeSamples87
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/EnSamples87
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/FrSamples87
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/ItSamples87
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/JASamples87
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/PlSamples87

	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/DeSamples87NS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/EnSamples87NS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/FrSamples87NS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/ItSamples87NS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/JASamples87NS
	@mkdir LanguageIdentification/AccuracyOnSyntheticCiphers/TestSamples/87/PlSamples87NS

cleanHILLCLIMB:
	@echo "Cleaning HILLCLIMB Solver"
	@rm -r TextDeciphermentPrograms/HILLCLIMB/Decipherments
	@mkdir TextDeciphermentPrograms/HILLCLIMB/Decipherments
	@rm -r TextDeciphermentPrograms/HILLCLIMB/LM/LM
	@mkdir TextDeciphermentPrograms/HILLCLIMB/LM/LM

cleanHILLCLIMBC:
	@echo "Cleaning HILLCLIMBC Solver"
	@rm -r TextDeciphermentPrograms/HILLCLIMBC/Decipherments
	@mkdir TextDeciphermentPrograms/HILLCLIMBC/Decipherments
	@rm -r TextDeciphermentPrograms/HILLCLIMBC/LM/LM
	@mkdir TextDeciphermentPrograms/HILLCLIMBC/LM/LM

cleanTREESEARCH:
	@echo "Cleaning TREESEARCH Solver"
	@rm -r TextDeciphermentPrograms/TREESEARCH/Decipherments
	@mkdir TextDeciphermentPrograms/TREESEARCH/Decipherments
	@touch TextDeciphermentPrograms/TREESEARCH/LM/LMCorpus/cleanedText.txt
	@rm TextDeciphermentPrograms/TREESEARCH/LM/LMCorpus/cleanedText*
	@rm -r TextDeciphermentPrograms/TREESEARCH/LM/LM
	@mkdir TextDeciphermentPrograms/TREESEARCH/LM/LM
	@touch TextDeciphermentPrograms/TREESEARCH/Solver/masc_solver_mcts.pl
	@rm TextDeciphermentPrograms/TREESEARCH/Solver/masc_solver_mcts.pl

cleanGREEDY:
	@echo "Cleaning GREEDY Solver"
	@rm -r TextDeciphermentPrograms/GREEDY/Decipherments
	@mkdir TextDeciphermentPrograms/GREEDY/Decipherments