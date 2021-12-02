package model
import (
	fmt		"fmt"
	gorm 	"github.com/jinzhu/gorm"
	config	"laas/pkg/config"
)

var db *gorm.DB;
type Guest struct {
	gorm.Model;
	Username	string		`gorm:""json:"username"`
	Full_name	string		`json:"full_name"`
	Phone		string		`json:"phone"`
	Address		string		`json:"address"`
	Postal_code	string		`json:"postal_code"`
	Activation	int64 		`json:"activation"`
}

// ubah model jadi huruf gede

func init() {
	config.InitiateDB();
	db = config.ImportDB();
	db.AutoMigrate(&Guest{});
	fmt.Println("[laas] migrating Guest table");
}

func (g *Guest) AddGuest() *Guest {
	db.NewRecord(g);
	db.Create(&g);
	return g;
}

func GetGuest() []Guest {
	var Guests []Guest;
	db.Find(&Guests);
	return Guests;
}

func GetGuestByUsername(username string) (*Guest,*gorm.DB) {
	var getGuest Guest;
	db := db.Where("username=?",username).Find(&getGuest);
	return &getGuest,db;
}

func DeleteGuest(username string) Guest {
	var getGuest Guest;
	db.Where("username=?",username).Delete(&getGuest);
	return getGuest;
}