package main

import (
	"bufio"
	"database/sql"
	"encoding/csv"
	"fmt"
	"io"
	"os"
	"strconv"

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

type CompanyData struct {
	name     string
	number   string
	category string
	status   string
	country  string
}

type LEOData struct {
	ukprn   int
	name    string
	region  string
	subject string
	sex     string
}

type NSPLData struct {
	postcode1      string
	postcode2      string
	date_introduce string
	usertype       int
	pos_quality    int
}

var db *sql.DB

//====================================================
//function to check error and print error messages
//====================================================
func checkErr(err error, message string) {
	if err != nil {
		panic(message + " err: " + err.Error())
	}
}

//====================================================
// initialize connection to database
//====================================================
func initDB() {

	dbInfo := fmt.Sprintf("user=%s password=%s dbname=%s sslmode=disable",
		DB_USER, DB_PASSWORD, DB_NAME)
	psqldb, err := sql.Open("postgres", dbInfo)
	checkErr(err, "psql open")
	db = psqldb

}

//====================================================
// Import company data
//====================================================
func importCompanyData() {

	var sStmt string = "insert into go_company values ($1, $2, $3, $4, $5)"

	stmt, err := db.Prepare(sStmt)
	checkErr(err, "Prepare Stmt")

	// Open CSV files
	csvFile, err := os.Open(COMPANY_FILE_DIRECTORY)
	checkErr(err, "Open CSV")

	defer csvFile.Close()

	// Create a new reader.
	reader := csv.NewReader(bufio.NewReader(csvFile))

	for i := 0; i <= 100; i++ {
		record, err := reader.Read()

		// skipped the first line
		if i == 0 {
			continue
		}

		// Stop at EOF.
		if err == io.EOF {
			break
		}

		company := CompanyData{
			name:     record[0],
			number:   record[1],
			category: record[10],
			status:   record[11],
			country:  record[12],
		}

		stmt.Exec(company.name, company.number, company.category, company.status, company.country)
		checkErr(err, "Company Data importation")
	}
}

//====================================================
// Import LEO data
//====================================================
func importSubjectData() {

	var sStmt string = "insert into go_subject values ($1, $2, $3, $4, $5)"

	stmt, err := db.Prepare(sStmt)
	checkErr(err, "Prepare Subject Stmt")

	csvFile, err := os.Open(LEO_FILE_DIRECTORY)
	checkErr(err, "Open LEO CSV")

	defer csvFile.Close()

	// Create a new reader.
	reader := csv.NewReader(bufio.NewReader(csvFile))

	for i := 0; i <= 100; i++ {
		record, err := reader.Read()

		// skipped the first line
		if i == 0 {
			continue
		}

		// Stop at EOF.
		if err == io.EOF {
			break
		}

		integer, err := strconv.Atoi(record[0])
		checkErr(err, "Convert UKRPN to Integer")

		subject := LEOData{
			ukprn:   integer,
			name:    record[1],
			region:  record[2],
			subject: record[3],
			sex:     record[4],
		}

		stmt.Exec(subject.ukprn, subject.name, subject.region, subject.subject, subject.sex)
		checkErr(err, "Subject Data importation")
	}
}

//====================================================
// Import NSPL data
//====================================================
func importNSPLData() {

	var sStmt string = "insert into go_nspl values ($1, $2, $3, $4, $5)"

	stmt, err := db.Prepare(sStmt)
	checkErr(err, "Prepare Postcode Stmt")

	csvFile, err := os.Open(NSPL_FILE_DIRECTORY)
	checkErr(err, "Open Postcode CSV")

	defer csvFile.Close()

	// Create a new reader.
	reader := csv.NewReader(bufio.NewReader(csvFile))

	for i := 0; i <= 100; i++ {
		record, err := reader.Read()

		// skipped the first line
		if i == 0 {
			continue
		}

		// Stop at EOF.
		if err == io.EOF {
			break
		}

		userInt, err := strconv.Atoi(record[4])
		checkErr(err, "Convert Usertype to Integer")

		posInt, err := strconv.Atoi(record[7])
		checkErr(err, "Convert Usertype to Integer")

		postcode := NSPLData{
			postcode1:      record[0],
			postcode2:      record[1],
			date_introduce: record[3],
			usertype:       userInt,
			pos_quality:    posInt,
		}

		stmt.Exec(postcode.postcode1, postcode.postcode2, postcode.date_introduce, postcode.usertype, postcode.pos_quality)
		checkErr(err, "Postcode Data importation")
	}
}

func main() {

	initDB()
	importCompanyData()
	importSubjectData()
	importNSPLData()

}

/**

yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$ go build import-csv-psql.go
yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$ time go run import-csv-psql.go

real	0m3.647s
user	0m0.328s
sys	0m0.096s
yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$

**/
