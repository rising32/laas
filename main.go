package main
import (
	os		"os"
	log		"log"
	http	"net/http"
	env 	"github.com/joho/godotenv"
	mux		"github.com/gorilla/mux"	
	_       "github.com/jinzhu/gorm/dialects/mysql"
	route	"laas/pkg/route"
)

func main() {
	env.Load();
	r := mux.NewRouter();
	route.GuestRoutes(r);
	http.Handle("/",r);
	log.Fatal(http.ListenAndServe(":"+os.Getenv("PORT"),r));
}


// routes -.- controller
// model -.- config