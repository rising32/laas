package controller
import (
//	time	"time"
//	strconv	"strconv"
//	fmt		"fmt"
	http	"net/http"
	model	"laas-go-2/pkg/model"
	util	"laas-go-2/pkg/util"	
	gin	    "github.com/gin-gonic/gin"
    gorm	"github.com/jinzhu/gorm"	
)

type ModelGuestBody struct {
	Username	string	`json:"username"`
	Fullname	string	`json:"fullname"`	
	Phone		string	`json:"phone"`
	Address		string	`json:"address"`
	PostalCode	string	`json:"postal_code"`
	Activation	int64	`json:"activation"`
	Password 	string	`json:"password"`
}

func GetGuest(c *gin.Context) {
	var guests []model.Guest;	
	db := c.MustGet("db").(*gorm.DB);
	db.Find(&guests);
	c.JSON(http.StatusOK,gin.H{"data":guests});
}

func GetGuestByUsername(c *gin.Context) {
	var guest []model.Guest;
	db := c.MustGet("db").(*gorm.DB);
	if err := db.Where("username = ?",c.Param("username")).First(&guest).Error; err != nil {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Guest is not available"});
		return;
	}
	if len(guest) < 1 {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Guest is not available"});
		return;
	}
	c.JSON(http.StatusOK,gin.H{"data":guest});	
}

func AddGuest(c *gin.Context) {
	var body ModelGuestBody;
    if err := c.ShouldBindJSON(&body); err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
        return
    }
    get_salt := util.GenerateSalt(16);
    get_hash := util.GenerateSaltedSHA256(string(body.Password),get_salt);
    new_guest := model.Guest{Username: body.Username,Fullname: body.Fullname,Phone: body.Phone,Address: body.Address,PostalCode: body.PostalCode,Activation: body.Activation,Salt: get_salt,Hash: get_hash};
	db := c.MustGet("db").(*gorm.DB);
	db.Create(&new_guest);
	c.JSON(http.StatusOK,gin.H{"data":new_guest});	
}

func UpdateGuestProfile(c *gin.Context) {
	var guest model.Guest;
	db := c.MustGet("db").(*gorm.DB);
	if err := db.Where("username = ?",c.Param("username")).First(&guest).Error; err != nil {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Guest is not available"});
		return;
	}
	var body ModelGuestBody;
	if err := c.ShouldBindJSON(&body); err != nil {
	    c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	    return
	}	
	update_guest := model.Guest{Fullname: body.Fullname,Phone: body.Phone,Address: body.Address,PostalCode: body.PostalCode}; //UpdatedAt: time.Now().UTC()
	db.Model(&guest).Where("username = ?",c.Param("username")).Updates(update_guest);
	c.JSON(http.StatusOK,gin.H{"data":guest});
}

func UpdateGuestPassword(c *gin.Context) {
	var guest model.Guest;
	db := c.MustGet("db").(*gorm.DB);
	if err := db.Where("username = ?",c.Param("username")).First(&guest).Error; err != nil {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Guest is not available"});
		return;
	}
	var body ModelGuestBody;
	if err := c.ShouldBindJSON(&body); err != nil {
	    c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	    return
	}
    get_salt := util.GenerateSalt(16);
    get_hash := util.GenerateSaltedSHA256(string(body.Password),get_salt);	
	update_guest := model.Guest{Salt: get_salt,Hash: get_hash};	
	db.Model(&guest).Where("username = ?",c.Param("username")).Updates(update_guest);
	c.JSON(http.StatusOK,gin.H{"data":guest});	
}

func CloseGuestAccount(c *gin.Context) {
	var guest model.Guest;
	db := c.MustGet("db").(*gorm.DB);
	if err := db.Where("username = ?",c.Param("username")).First(&guest).Error; err != nil {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Guest is not available"});
		return;
	}
	db.Model(&guest).Where("username = ? AND activation = 1",c.Param("username")).Updates(map[string]interface{}{
		"activation":0});
	c.JSON(http.StatusOK,gin.H{"data":guest});		
}

func OpenGuestAccount(c *gin.Context) {
	var guest model.Guest;
	db := c.MustGet("db").(*gorm.DB);
	if err := db.Where("username = ?",c.Param("username")).First(&guest).Error; err != nil {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Guest is not available"});
		return;
	}
	db.Model(&guest).Where("username = ? AND activation = 0",c.Param("username")).Updates(map[string]interface{}{
		"activation":1});
	c.JSON(http.StatusOK,gin.H{"data":guest});		
}

func DeleteGuestAccount(c *gin.Context) {
	var guest model.Guest;	
	db := c.MustGet("db").(*gorm.DB);
	if err := db.Where("username = ?",c.Param("username")).First(&guest).Error; err != nil {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Guest is not available"});
		return;
	}
	db.Model(&guest).Where("username = ?",c.Param("username")).Delete(guest);
	c.JSON(http.StatusOK,gin.H{"data":guest});	
}

// masuk ke staff model + endpoint