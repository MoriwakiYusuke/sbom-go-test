package mylibrary // パッケージ名をmylibraryと定義

import (
	"github.com/common-nighthawk/go-figure"
	"github.com/fatih/color"
)

// PrintBannerは、指定されたテキストを黄色いASCIIアートで表示します。
// 関数名を大文字で始めることで、外部のパッケージから呼び出せるようになります（公開関数）。
func PrintBanner(text string) {
	// go-figureでASCIIアートのテキストを生成
	myFigure := figure.NewFigure(text, "", true)

	// fatih/colorを使って黄色で出力する準備
	yellow := color.New(color.FgYellow).PrintlnFunc()

	// 生成したASCIIアートを黄色で表示
	yellow(myFigure.String())
}
