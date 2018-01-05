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
	DB_USER                       = "yinghua"
	DB_PASSWORD                   = "123"
	DB_NAME                       = "fyp1"
	COMPANY_FILE_DIRECTORY string = "/home/yinghua/Documents/FYP1/FYP-data/company-data/company-data-full.csv"
	LEO_FILE_DIRECTORY     string = "/home/yinghua/Documents/FYP1/FYP-data/subject-data/institution-subject-data.csv"
	NSPL_FILE_DIRECTORY    string = "/home/yinghua/Documents/FYP1/FYP-data/postcode-data/UK-NSPL.csv"
)

var db *sql.DB

// function to check error and print error messages
func checkErr(err error, message string) {
	if err != nil {
		panic(message + " err: " + err.Error())
	}
}

func read_CompanyCSV() {

	fmt.Println("Start reading 100 row Company CSV data")

	time.Sleep(time.Second * 2)

	csvFile, err := os.Open(COMPANY_FILE_DIRECTORY)
	checkErr(err, "Open CSV")

	defer csvFile.Close()

	// Create a new reader.
	reader := csv.NewReader(bufio.NewReader(csvFile))

	for i := 0; i <= 100; i++ {
		_, err := reader.Read()

		// skipped the first line
		if i == 0 {
			continue
		}

		// Stop at EOF.
		if err == io.EOF {
			break
		}

	}

	fmt.Println("Finish reading Company CSV data")

}

func read_LEOCSV() {

	fmt.Println("Start reading 100 row LEO CSV data")

	time.Sleep(time.Second * 2)

	csvFile, err := os.Open(LEO_FILE_DIRECTORY)
	checkErr(err, "Open LEO CSV")

	defer csvFile.Close()

	// Create a new reader.
	reader := csv.NewReader(bufio.NewReader(csvFile))

	for i := 0; i <= 100; i++ {
		_, err := reader.Read()

		// skipped the first line
		if i == 0 {
			continue
		}

		// Stop at EOF.
		if err == io.EOF {
			break
		}
	}

	fmt.Println("Finish reading LEO CSV data")

}

func read_NSPLCSV() {

	fmt.Println("Start reading 100 row NSPL CSV data")

	time.Sleep(time.Second * 2)

	csvFile, err := os.Open(NSPL_FILE_DIRECTORY)
	checkErr(err, "Open Postcode CSV")

	defer csvFile.Close()

	// Create a new reader.
	reader := csv.NewReader(bufio.NewReader(csvFile))

	for i := 0; i <= 100; i++ {
		_, err := reader.Read()

		// skipped the first line
		if i == 0 {
			continue
		}

		// Stop at EOF.
		if err == io.EOF {
			break
		}
	}

	fmt.Println("Finish reading LEO CSV data")

}

func main() {

	// get the time before execution
	start := time.Now()

	read_CompanyCSV()
	read_LEOCSV()
	read_NSPLCSV()

	// obtain the time after execution
	fmt.Printf("Total execution %.5fs elapsed\n", time.Since(start).Seconds())

}

/**

yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$ go build sequential-read-csv.go
yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$ time go run sequential-read-csv.go
Start reading 100 row Company CSV data
Finish reading Company CSV data
Start reading 100 row LEO CSV data
Finish readying LEO CSV data
Start reading 100 row NSPL CSV data
Finish readying LEO CSV data
Total execution 6.00823s elapsed

real	0m6.285s
user	0m0.316s
sys		0m0.056s
**/
