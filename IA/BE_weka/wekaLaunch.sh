java -jar /home/jackdanny/Bureau/M2_Annexe/weka/weka-3-6-12/weka.jar

#faire un bash
export CLASSPATH=/home/jackdanny/Bureau/M2_Annexe/weka/weka-3-6-12/weka.jar

java weka.classifiers.bayes.NaiveBayes -t /home/jackdanny/Bureau/M2_Annexe/weka/weka-3-6-12/data/vote.arff

java weka.classifiers.bayes.NaiveBayes -t ./train.txt.arff -T ./test.txt.arff -d NB.model

java weka.classifiers.bayes.NaiveBayes -l NB.model -p 1,5,7 -distribution -T ./test.txt.arff > out.txt

{B-NP,B-PP,I-NP,B-VP,I-VP,B-SBAR,O,B-ADJP,B-ADVP,I-ADVP,I-ADJP,I-SBAR,I-PP,B-PRT,B-LST,B-INTJ,I-INTJ,B-CONJP,I-CONJP,I-PRT,B-UCP,I-UCP,I-LST}