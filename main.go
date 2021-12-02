package main
import (
	fmt		"fmt"
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
	fmt.Println("[laas] running API in localhost:"+os.Getenv("PORT"));
}


// routes -.- controller
// model -.- config