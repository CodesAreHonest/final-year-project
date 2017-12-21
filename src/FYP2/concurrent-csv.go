package main 

import (
	"bufio"
	"encoding/csv"
	"fmt"
	"io"
	"os"
	"time"

	_ "github.com/lib/pq"
)

const (
	COMPANY_INDICATOR string = "company"
	LEO_INDICATOR	  string = "subject"
	NSPL_INDICATOR    string = "postcode"
	COMPANY_DIRECTORY string = "/home/yinghua/Documents/FYP1/FYP-data/company-data/company-data-full.csv"
	LEO_DIRECTORY     string = "/home/yinghua/Documents/FYP1/FYP-data/subject-data/institution-subject-data.csv"
	NSPL_DIRECTORY    string = "/home/yinghua/Documents/FYP1/FYP-data/postcode-data/UK-NSPL.csv"
)

func retrieve_data_with_channel(directory string, indicator string, msg chan string) {
	
	fmt.Printf("BEGIN retrieve data from %s files. \n", indicator);

	csvFile, err := os.Open(directory)
	checkErr(err, "Open CSV")

	defer csvFile.Close()
	
		// get the time before execution
	start := time.Now()

	// Create a new reader.
	reader := csv.NewReader(bufio.NewReader(csvFile))
	

	for {
		
		_ , err := reader.Read()
		
		// Stop at EOF.
		if err == io.EOF {
			break
		}
	}

	// obtain the time after execution
	fmt.Printf("FINISH retrieve all rows of data from %s files with T%.5fs seconds.", indicator, time.Since(start).Seconds())
	msg <- " " 

}

// select function
func goSelect(ch_company, ch_leo, ch_nspl chan string) {
	

	for i := 0; i < 3; i++ {

		select {
		case msg1 := <-ch_leo:
			fmt.Println(msg1)
		case msg2 := <-ch_company:
			fmt.Println(msg2)
		case msg3 := <-ch_nspl:
			fmt.Println(msg3)

		}
	}
}

// function to check error and print error messages
func checkErr(err error, message string) {
	if err != nil {
		panic(message + " err: " + err.Error())
	}
}


// This function read all CSV data concurrently 
func main() {
	
			// get the time before execution
	start := time.Now()
	
	// make three channel for three functions
	ch_company := make(chan string)
	ch_leo := make(chan string)
	ch_nspl := make(chan string)
	
	
	go retrieve_data_with_channel(LEO_DIRECTORY, LEO_INDICATOR, ch_leo);
	go retrieve_data_with_channel(COMPANY_DIRECTORY, COMPANY_INDICATOR, ch_company);
	go retrieve_data_with_channel(NSPL_DIRECTORY, NSPL_INDICATOR, ch_nspl);
	
	goSelect(ch_company, ch_leo, ch_nspl) 
	
		// obtain the time after execution
	fmt.Printf("T%.5fs seconds on retrieve all the data CONCURRENTLY. \n", time.Since(start).Seconds())
}

/** 

yinghua@yinghua:~/gitRepo/final-year-project/src/FYP2$ go build concurrent-csv.go
yinghua@yinghua:~/gitRepo/final-year-project/src/FYP2$ time go run concurrent-csv.go
BEGIN retrieve data from postcode files. 
BEGIN retrieve data from subject files. 
BEGIN retrieve data from company files. 
FINISH retrieve all rows of data from subject files with T0.12762s seconds. 
FINISH retrieve all rows of data from postcode files with T16.62914s seconds. 
FINISH retrieve all rows of data from company files with T39.71265s seconds. 
T39.71286s seconds on retrieve all the data CONCURRENTLY. 

real	0m39.972s
user	0m56.801s
sys	    0m0.773s

**/



