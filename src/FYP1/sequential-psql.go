package main

import (
	"database/sql"
	"fmt"
	"time"

	_ "github.com/lib/pq"
)

const (
	DB_USER     = "yinghua"
	DB_PASSWORD = "123"
	DB_NAME     = "fyp1"
)

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
// retrieve data from company table in postgres
//====================================================
func retrieveCompanyData() {

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

	fmt.Println("Data retrieval of company data SUCCESS! ")
	fmt.Printf("%.8fs elapsed\n\n", time.Since(start).Seconds())

}

//====================================================
// retrieve data from postcode table in postgres
//====================================================
func retrievePostcodeData() {

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

	fmt.Print("Data retrieval of postcode data SUCCESS! ")
	fmt.Printf("%.8fs elapsed\n\n", time.Since(start).Seconds())

}

//====================================================
// retrieve data from subject table in postgres
//====================================================
func retrieveSubjectData() {

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

	fmt.Print("Data retrieval of subject data SUCCESS! ")
	fmt.Printf(" %.8fs elapsed\n\n", time.Since(start).Seconds())

}

//====================================================
// Main function
//====================================================
func main() {

	// get the time before execution
	start := time.Now()

	initDB()
	retrieveCompanyData()
	retrievePostcodeData()
	retrieveSubjectData()

	// print the time after execution
	fmt.Printf("Total execution %.5fs elapsed\n", time.Since(start).Seconds())

}

/**

yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$ go build sequential-psql.go
yinghua@yinghua:~/Desktop/apps/eclipse-workspace/FYP1/src/postgres-process$ time go run sequential-psql.go
Start retrieve company data from database ...
Data retrieval of company data SUCCESS!
2.00721985s elapsed

Start retrieve postcode data from database ...
Data retrieval of postcode data SUCCESS!
2.00144933s elapsed

Start retrieve LEO data from database ...
Data retrieval of subject data SUCCESS!
2.00131415s elapsed

Total execution 6.01005s elapsed

real	0m6.252s
user	0m0.272s
sys		0m0.032s


**/
