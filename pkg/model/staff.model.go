package model
import (
	time	"time"
)

type Staff struct {
	Username	string		`json:"username"`
	Fullname	string		`json:"fullname"`
	Email		string		`json:"email"`
	Phone		string		`json:"phone"`
	Address		string		`json:"address"`
	PostalCode	string		`json:"postal_code"`
	Level		int64		`json:"level"`
	Activation	int64		`json:"activation"`
	Salt		string		`json:"salt"`
	Hash		string		`json:"hash"`
	CreatedAt	time.Time	`json:"created_at" gorm:"default:CURRENT_TIMESTAMP"`
	UpdatedAt	time.Time	`json:"updated_at" gorm:"default:CURRENT_TIMESTAMP"`
}
