from pyspark import SparkContext
sc = SparkContext()
text_file = sc.textFile("/home/pi/abc1.txt")
counts = text_file.flatMap(lambda line: line.split(" ")).map(lambda word: (word, 1)).reduceByKey(lambda a, b: a + b)
print("******************Done with Counts*********************")
#print(counts)

sortedwordsCount=counts.map(lambda (x,y):(y,x)).sortByKey()

results=sortedwordsCount.collect()

for result in results:
    count=str(result[0])
    word=result[1].encode('ascii','ignore')

    #if(word):
        #print word +"\t\t"+ count

        
#results.saveAsTextFile("/var/www/myoutput")

#counts.saveAsTextFile("/home/pi/output")
