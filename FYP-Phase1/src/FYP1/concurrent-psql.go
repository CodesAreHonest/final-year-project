package main

import (
	"database/sql"
	"fmt"
	"time"

	_ "github.com/lib/pq"
)

//====================================================
// database information
//====================================================
const (
	DB_USER     = "yinghua"
	DB_PASSWORD = "123"
	DB_NAME     = "fyp1"
)

var (
	db          *sql.DB
	numChannels int = 3
)

//====================================================
// function to check error and print error messages
//====================================================
func checkErr(err error, message string) {
	if err != nil {
		panic(message + " err: " + err.Error())
	}
}

//====================================================
// initialize connection with database
//====================================================
func initDB() {

	dbInfo := fmt.Sprintf("user=%s password=%s dbname=%s sslmode=disable",
		DB_USER, DB_PASSWORD, DB_NAME)
	psqldb, err := sql.Open("postgres", dbInfo)
	checkErr(err, "Initialize database")
	db = psqldb

}

//====================================================
// retrieve company data store in postgres database
//====================================================
func retrieveCompanyData(ch_company chan string) {

	fmt.Println("Start retrieve company data from database ... ")
	start := time.Now()

	time.Sleep(time.Second * 2)

	rows, err := db.Query("SELECT c.companyname, c.companynumber, c.companycategory, c.companystatus, c.countryoforigin FROM companydata AS c ORDER BY c.companynumber limit 100;")
	checkErr(err, "Query Company DB rows")

	var (
		companyname     string
		companynumber   string
		companycategory string
		companystatus   string
		countryoforigin string
	)

	for rows.Next() {
		err = rows.Scan(&companyname, &companynumber, &companycategory, &companystatus, &countryoforigin)
		checkErr(err, "Read company data rows")
		//fmt.Printf("%8v %3v %6v %6v %6v\n", companyname, companynumber, companycategory, companystatus, countryoforigin)
	}

	fmt.Printf("%.8fs elapsed\n", time.Since(start).Seconds())
	ch_company <- "Retrieval of company data success. \n"
}

//====================================================
// retrieve postcode data store in postgres database
//====================================================
func retrievePostcodeData(ch_postcode chan string) {

	fmt.Println("Start retrieve postcode data from database ... ")
	start := time.Now()

	time.Sleep(time.Second * 2)

	rows, err := db.Query("SELECT postcode1, postcode2, date_introduce, usertype, position_quality FROM go_nspl LIMIT 50")
	checkErr(err, "Query Postcode DB rows")

	var (
		postcode1        string
		postcode2        string
		date_introduce   string
		usertype         int
		position_quality int
	)

	for rows.Next() {
		err = rows.Scan(&postcode1, &postcode2, &date_introduce, &usertype, &position_quality)
		checkErr(err, "Read postcode data rows")
		//fmt.Printf("%6v %8v %6v %6v %6v\n", postcode1, postcode2, date_introduce, usertype, position_quality)
	}

	fmt.Printf("%.8fs elapsed\n", time.Since(start).Seconds())
	ch_postcode <- "Retrieval of postcode success. \n"
}

//====================================================
// retrieve subject data store in postgres database
//====================================================
func retrieveSubjectData(ch_subject chan string) {

	fmt.Println("Start retrieve LEO data from database ... ")
	start := time.Now()

	time.Sleep(time.Second * 2)

	rows, err := db.Query("SELECT ukprn, providername, region, subject, sex FROM go_subject LIMIT 50")
	checkErr(err, "Query subject DB rows")

	var (
		ukprn   int
		name    string
		region  string
		subject string
		sex     string
	)

	for rows.Next() {
		err = rows.Scan(&ukprn, &name, &region, &subject, &sex)
		checkErr(err, "Read subject data rows")
		//fmt.Printf("%6v %8v %6v %6v %6v\n", ukprn, name, region, subject, sex)
	}

	fmt.Printf("%.8fs elapsed\n", time.Since(start).Seconds())
	ch_subject <- "Retrieval of subject data success. \n"
}

// select function
func goSelect(ch_company, ch_subject, ch_postcode chan string) {

	for i := 0; i < numChannels; i++ {

		select {
		case msg1 := <-ch_postcode:
			fmt.Println(msg1)
		case msg2 := <-ch_company:
			fmt.Println(msg2)
		case msg3 := <-ch_subject:
			fmt.Println(msg3)

		}

	}
}

//====================================================
// Main function
//====================================================
func main() {

	// make three channel for three functions
	ch_company := make(chan string)
	ch_subject := make(chan string)
	ch_postcode := make(chan string)

	// get the time before execution
	start := time.Now()

	initDB()

	//go routines
	go retrieveCompanyData(ch_company)
	go retrieveSubjectData(ch_subject)
	go retrievePostcodeData(ch_postcode)

	goSelect(ch_company, ch_subject, ch_postcode)

	// obtain the time after execution
	fmt.Printf("Total execution %.5fs elapsed\n", time.Since(start).Seconds())

}

/**

yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$ go build concurrent-psql.go
yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$ time go run concurrent-psql.go
Start retrieve postcode data from database ...
Start retrieve company data from database ...
Start retrieve LEO data from database ...
2.00615007s elapsed
Retrieval of subject data success.

2.00661550s elapsed
Retrieval of postcode success.

2.00745319s elapsed
Retrieval of company data success.

Total execution 2.00754s elapsed

real	0m2.268s
user	0m0.244s
sys		0m0.076s



**/
