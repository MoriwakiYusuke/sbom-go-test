package main

import (
	mylibrary "sbom-go-test/internal" // 作成したライブラリをインポート
)

func main() {
	// mylibraryパッケージのPrintBanner関数を呼び出す
	mylibrary.PrintBanner("SBOM Test")

}
