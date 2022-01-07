package route
import (
	controller	"laas-go-2/pkg/controller"
	gin			"github.com/gin-gonic/gin"
	gorm		"github.com/jinzhu/gorm"
)

func StaffRoute(db *gorm.DB, r *gin.Engine) *gin.Engine {
	r.Use(func(c *gin.Context) {
		c.Set("db",db);
	})
	r.POST("/api/user/staff/add",controller.AddStaff);
	r.GET("/api/user/staff/show",controller.GetStaff);
	r.GET("/api/user/staff/:username",controller.GetStaffByUsername);
	r.PATCH("/api/user/staff/:username/update/profile",controller.UpdateStaffProfile);
	r.PATCH("/api/user/staff/:username/update/password",controller.UpdateStaffPassword);
	// r.PATCH("/api/user/guest/:username/close",controller.CloseGuestAccount);
	// r.PATCH("/api/user/guest/:username/open",controller.OpenGuestAccount);
	// r.DELETE("/api/user/guest/:username/delete",controller.DeleteGuestAccount);

	return r;
}
