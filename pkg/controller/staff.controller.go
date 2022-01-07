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

type ModelStaffBody struct {
	Username	string	`json:"username"`
	Fullname	string	`json:"fullname"`
	Email		string	`json:"email"`
	Phone		string	`json:"phone"`
	Address		string	`json:"address"`
	PostalCode	string	`json:"postal_code"`
	Level		int64	`json:"level"`
	Activation	int64	`json:"activation"`
	Password 	string	`json:"password"`
}

func GetStaff(c *gin.Context) {
	var staffs []model.Staff;	
	db := c.MustGet("db").(*gorm.DB);
	db.Find(&staffs);
	c.JSON(http.StatusOK,gin.H{"data":staffs});
}

func GetStaffByUsername(c *gin.Context) {
	var staff []model.Staff;	
	db := c.MustGet("db").(*gorm.DB);
	if err := db.Where("username = ?",c.Param("username")).First(&staff).Error; err != nil {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Staff is not available"});
		return;
	}
	if len(staff) < 1 {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Staff is not available"});
		return;
	}
	c.JSON(http.StatusOK,gin.H{"data":staff});	
}

func AddStaff(c *gin.Context) {
	var body ModelStaffBody;
    if err := c.ShouldBindJSON(&body); err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
        return
    }
    get_salt := util.GenerateSalt(16);
    get_hash := util.GenerateSaltedSHA256(string(body.Password),get_salt);
    new_staff := model.Staff{Username: body.Username,Fullname: body.Fullname,Email: body.Email,Phone: body.Phone,Address: body.Address,PostalCode: body.PostalCode,Level: body.Level,Activation: body.Activation,Salt: get_salt,Hash: get_hash};
	db := c.MustGet("db").(*gorm.DB);
	db.Create(&new_staff);
	c.JSON(http.StatusOK,gin.H{"data":new_staff});	
}

func UpdateStaffProfile(c *gin.Context) {
	var staff model.Staff;
	db := c.MustGet("db").(*gorm.DB);
	if err := db.Where("username = ?",c.Param("username")).First(&staff).Error; err != nil {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Staff is not available"});
		return;
	}
	var body ModelStaffBody;
	if err := c.ShouldBindJSON(&body); err != nil {
	    c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	    return
	}	
	update_staff := model.Staff{Fullname: body.Fullname,Email: body.Email,Phone: body.Phone,Address: body.Address,PostalCode: body.PostalCode,Level: body.Level}; //UpdatedAt: time.Now().UTC()
	db.Model(&staff).Where("username = ?",c.Param("username")).Updates(update_staff);
	c.JSON(http.StatusOK,gin.H{"data":staff});
}

func UpdateStaffPassword(c *gin.Context) {
	var staff model.Staff;
	db := c.MustGet("db").(*gorm.DB);
	if err := db.Where("username = ?",c.Param("username")).First(&staff).Error; err != nil {
		c.JSON(http.StatusBadRequest,gin.H{"error":"Staff is not available"});
		return;
	}
	var body ModelStaffBody;
	if err := c.ShouldBindJSON(&body); err != nil {
	    c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	    return
	}
    get_salt := util.GenerateSalt(16);
    get_hash := util.GenerateSaltedSHA256(string(body.Password),get_salt);	
	update_staff := model.Staff{Salt: get_salt,Hash: get_hash};	
	db.Model(&staff).Where("username = ?",c.Param("username")).Updates(update_staff);
	c.JSON(http.StatusOK,gin.H{"data":staff});	
}
