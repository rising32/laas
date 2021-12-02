package model
import (
	os		"os"
	env	    "github.com/joho/godotenv"
	fmt		"fmt"
	gorm	"github.com/jinzhu/gorm"
	_		"github.com/go-sql-driver/mysql"
)

func IntiateDB() *gorm.DB {
	env.Load();
	DB_HOST     := os.Getenv("DB_HOST");
	DB_USER     := os.Getenv("DB_USER");
	DB_PASSWORD := os.Getenv("DB_PASSWORD");
	DB_DATABASE := os.Getenv("DB_DATABASE");
	DB_PORT     := os.Getenv("DB_PORT");
	URL         := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8&parseTime=True&loc=Local",DB_USER,DB_PASSWORD,DB_HOST,DB_PORT,DB_DATABASE);
	db,err      := gorm.Open("mysql",URL);
	if err != nil {panic(err.Error());}
	return db;
}
