import (
	"context"
	"fmt"

	"github.com/gogf/gf/v2/errors/gcode"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
)

type s{{$.Name}}Client struct{}

func New() *s{{$.Name}}Client {
	return &s{{$.Name}}Client{}
}

func init() {
	service.Register{{$.Name}}Client(New())
}
{{range .Methods}}
{{if eq .Method "GET"}}
func (s *s{{$.Name}}Client) {{ .HandlerName }} (ctx context.Context, in *model.{{ .HandlerName }}Input) (out *model.{{ .HandlerName }}Output, err error) {
	server, _ := g.Cfg().Get(ctx, "serverUri.xxxServer")
	if _, err := g.Client().{{.Method}}(
		ctx,
		fmt.Sprintf("%s{{.Path}}", server),
		g.Map{
			"id": in.Id,
		},
	); err != nil {
		g.Log().Errorf(ctx, "s{{$.Name}}Client {{ .HandlerName }} Client error %v", err)
		return gerror.NewCode(gcode.CodeInternalError, common_consts.MessageSystemBusy)
	}
	return nil
}

type {{ .HandlerName }}Req struct {

}

type {{ .HandlerName }}Res struct {

}
{{else if eq .Method "POST"}}

{{else if eq .Method "PUT"}}

{{else if eq .Method "DELETE"}}

{{end}}
{{end}}

