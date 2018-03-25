package main 

import (
	"bufio"
	"database/sql"
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

var db *sql.DB

func retrieve_data(directory string, indicator string) {

	fmt.Printf("BEGIN retrieve data from %s files. \n", indicator);

	csvFile, err := os.Open(directory)
	checkErr(err, "Open CSV")

	defer csvFile.Close()
	
		// get the time before execution
	start := time.Now()

	// Create a new reader.
	reader := csv.NewReader(bufio.NewReader(csvFile))

	for {
		_, err := reader.Read()

		// Stop at EOF.
		if err == io.EOF {
			break
		}

	}

	// obtain the time after execution
	fmt.Printf("FINISH retrieve all rows of data from %s files with T%.5fs seconds. \n", indicator, time.Since(start).Seconds())
}

// function to check error and print error messages
func checkErr(err error, message string) {
	if err != nil {
		panic(message + " err: " + err.Error())
	}
}

func main() {
	
	retrieve_data(LEO_DIRECTORY, LEO_INDICATOR);
	retrieve_data(COMPANY_DIRECTORY, COMPANY_INDICATOR);
	retrieve_data(NSPL_DIRECTORY, NSPL_INDICATOR);

}

/**

yinghua@yinghua:~/gitRepo/final-year-project/src/FYP2$ go build sequential-csv.go
yinghua@yinghua:~/gitRepo/final-year-project/src/FYP2$ time go run sequential-csv.go 
BEGIN retrieve data from subject files. 
FINISH retrieve all rows of data from subject files with T0.09550s seconds. 
BEGIN retrieve data from company files. 
FINISH retrieve all rows of data from company files with T39.00520s seconds. 
BEGIN retrieve data from postcode files. 
FINISH retrieve all rows of data from postcode files with T15.19991s seconds. 

real	0m54.591s
user	0m54.912s
sys		0m0.872s


**/
