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
	COMPANY_FILE_DIRECTORY string = "/home/yinghua/Documents/FYP-data/company-data/company-data-full.csv"
	LEO_FILE_DIRECTORY     string = "/home/yinghua/Documents/FYP-data/subject-data/institution-subject-data.csv"
	NSPL_FILE_DIRECTORY    string = "/home/yinghua/Documents/FYP-data/postcode-data/UK-NSPL.csv"
)

var (
	db          *sql.DB
	numChannels int = 3
)

// function to check error and print error messages
func checkErr(err error, message string) {
	if err != nil {
		panic(message + " err: " + err.Error())
	}
}

func read_CompanyCSV(ch_company chan string) {

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

	ch_company <- "Finish reading LEO CSV data"

}

func read_LEOCSV(ch_leo chan string) {

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

	ch_leo <- "Finish reading LEO CSV data"

}

func read_NSPLCSV(ch_nspl chan string) {

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

	ch_nspl <- "Finish reading NSPL CSV data"
}

// select function
func goSelect(ch_company, ch_leo, ch_nspl chan string) {

	for i := 0; i < numChannels; i++ {

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

func main() {

	// make three channel for three functions
	ch_company := make(chan string)
	ch_leo := make(chan string)
	ch_nspl := make(chan string)

	// get the time before execution
	start := time.Now()

	go read_CompanyCSV(ch_company)
	go read_LEOCSV(ch_leo)
	go read_NSPLCSV(ch_nspl)

	goSelect(ch_company, ch_leo, ch_nspl)

	// obtain the time after execution
	fmt.Printf("Total execution %.5fs elapsed\n", time.Since(start).Seconds())

}

/**

yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$ go build concurrent-read-csv.go
yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$ time go run concurrent-read-csv.go
Start reading 100 row NSPL CSV data
Start reading 100 row Company CSV data
Start reading 100 row LEO CSV data
Finish reading LEO CSV data
Finish reading NSPL CSV data
Finish readying LEO CSV data
Total execution 2.00376s elapsed

real	0m2.243s
user	0m0.264s
sys		0m0.044s

**/
