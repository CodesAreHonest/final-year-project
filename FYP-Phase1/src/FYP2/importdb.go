package main

//import (
//	"database/sql"
//	"encoding/csv"
//	"io"
//	"log"
//	"os"
//
//	// We don't really need gorm, but it's a fast coding shorthand to throw random structs to a DB
//	"github.com/jinzhu/gorm"
//	_ "github.com/jinzhu/gorm/dialects/postgres"
////	_ "github.com/jinzhu/gorm/dialects/sqlite"
//	_ "github.com/lib/pq"
//)
//
//// Capitalized to export the fields
//type testdata struct {
//	Column1 string
//	Column2 string
//	Column3 string
//	Column4 sql.NullInt64 // You wnnt this if you want real NULLs, since an int can't differentiate 0 and NULL
//}
//
//func main() {
//	// Note the prevalence of "log".foo over "fmt".foo here.
//	// Easier to set log to /dev/null when we're in prod, etc.
//	var err error
//	var wantFancyDB = true
//	var db *gorm.DB
//
//	// Either `go run main.go < test.csv` or `go run main.go test.csv`
//	// No hardcoding of filenames.
//	fileIn := os.Stdin
//	if len(os.Args) > 1 {
//		fileIn, err = os.Open(os.Args[1])
//		if err != nil {
//			log.Fatal(err)
//		}
//		defer fileIn.Close()
//	}
//
//	// Fsck it, store to db, I'm lazy, use GORM for the stuff
//	if wantFancyDB {
//		// This can be a "postgres", "mysql", blah as well.
//		db, err = gorm.Open("sqlite3", "test.db")
//		if err != nil {
//			log.Fatal(db)
//		}
//		defer db.Close()
//
//		// Create the tables, ensure the columns are there, etc.
//		// Note that Gorm adds a "id" integer field.
//		db.AutoMigrate(&testdata{})
//	}
//
//	// Create a new reader.
//	reader := csv.NewReader(fileIn)
//
//	// Let's not ignore the first line, it's good for debugging.
//	headers, err := reader.Read()
//	if err != nil {
//		log.Fatal(err)
//	}
//
//	for {
//		record, err := reader.Read()
//		if err == io.EOF {
//			break
//		}
//		if err != nil {
//			log.Fatal(err)
//		}
//
//		if len(record) < 4 {
//			log.Fatal("Not enough data with: ", record)
//		}
//
//		data := testdata{
//			Column1: record[0],
//			Column2: record[1],
//			Column3: record[2],
//		}
//		// Meh, lazy. It's a NULL, or it's an int, or it's an error, and...
//		err = data.Column4.Scan(record[3])
//		if err != nil {
//			// Can't parse an int, give it a NULL in db.
//			data.Column4.Scan(nil)
//		}
//
//		// For your debugging pleasure:
//		for k, v := range headers {
//			log.Printf(" %s = %s\n", v, record[k])
//		}
//
//		// Don't bother listing the record one by one.
//		log.Printf("%#v\n", data)
//
//		// Ah, fuggit, store to db anyway
//		if db != nil {
//			db.NewRecord(data)
//			db.Create(&data)
//		}
//	}
//}
