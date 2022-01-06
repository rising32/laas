package route
import (
    http	"net/http"		
	gin		"github.com/gin-gonic/gin"
)

func DefaultDocRoute(r *gin.Engine) *gin.Engine {
	r.GET("/", func(c *gin.Context) {c.HTML(http.StatusOK,"laas.md.html",nil)});
	return r;
}
