package com.iub;

import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import scala.Tuple2;

import java.util.Arrays;

/**
 * Program to perform word count using spark
 */
public class SparkWordCount {

    public static void main(String[] args){
        try (JavaSparkContext sc = new JavaSparkContext()) {

            System.out.println("Started running word count");
            //reading text files using spark context
            JavaRDD<String> textFile = sc.textFile("/home/pi/*.txt");
            //count the words in the document
            JavaPairRDD<String, Integer> counts = textFile
                    .flatMap(s -> Arrays.asList(s.split(" ")).iterator())
                    .mapToPair(word -> new Tuple2<>(word, 1))
                    .reduceByKey((a, b) -> a + b);

            //sorting the values
            System.out.println("Sorting words");
            JavaPairRDD<String, Integer> sorted = counts.sortByKey();
            //System.out.println(sorted.collect());
            System.out.println("completed sorting words");
            System.out.println("Completed running word count");
            }
        }
    }

