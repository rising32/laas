package config
import (
	fmt		"fmt"
	os		"os"	
	gorm 	"github.com/jinzhu/gorm"
	_       "github.com/jinzhu/gorm/dialects/mysql"
	env 	"github.com/joho/godotenv"	
)

var (db *gorm.DB);
func InitiateDB() {
	env.Load();	
	DB_HOST := os.Getenv("DB_HOST");
	DB_USER := os.Getenv("DB_USER");
	DB_PASSWORD := os.Getenv("DB_PASSWORD");
	DB_DATABASE := os.Getenv("DB_DATABASE");
	DB_PORT := os.Getenv("DB_PORT");

  	dsn,err := gorm.Open("mysql",fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local",DB_USER,DB_PASSWORD,DB_HOST,DB_PORT,DB_DATABASE));
  	if err != nil {panic(err);}
  	db = dsn;
  	fmt.Println("[laas] initiating mysql connection");
}

func ImportDB() *gorm.DB {
  	fmt.Println("[laas] importing mysql database object");
	return db;
}