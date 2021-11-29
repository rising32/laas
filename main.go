package main
import (
	fmt 	"fmt"
	os 		"os"
	env 	"github.com/joho/godotenv"	
)

func main() {
	env.Load();
	fmt.Println(":"+os.Getenv("PORT")); }