# SBOM Go Test Project

## 概要

このプロジェクトは、Go言語で開発されたアプリケーションを対象に、複数のSBOM（Software Bill of Materials）生成ツールを試し、その機能や性能を比較・評価することを目的としています。

## 対象アプリケーション: `myapp`

`myapp`は、いくつかのオープンソースライブラリに依存するシンプルなコマンドラインアプリケーションです。

- `github.com/common-nighthawk/go-figure`: ASCIIアートの文字を生成します。
- `github.com/fatih/color`: コンソール出力に色を付けます。

## 使用方法

### 1. 環境構築

Go言語の開発環境が必要です。

### 2. アプリケーションのビルド

`Makefile`を使用してアプリケーションをビルドできます。

```bash
make build
```

### 3. SBOMの生成

このプロジェクトでは、以下のツールでSBOMを生成することを想定しています。

#### a) Syft

[Syft](https://github.com/anchore/syft) は、コンテナイメージやファイルシステムからSBOMを生成するツールです。

```bash
# 例: syftでSPDX形式のSBOMを生成する
syft ./bin/myapp -o spdx-json > sbom-outputs/syft/sbom.spdx.json
```

#### b) govulncheck

[govulncheck](https://go.dev/blog/govulncheck) は、Goプロジェクトの依存関係をスキャンし、既知の脆弱性を報告するツールです。SBOMのエクスポート機能も持ちます。

```bash
# 例: govulncheckでSBOMを生成する
govulncheck -format=spdx-json ./... > sbom-outputs/govulncheck/sbom.spdx.json
```

#### c) go-sbom

[go-sbom](https://github.com/spdx/go-sbom) は、GoのバイナリからSPDX形式のSBOMを生成するツールです。

```bash
# 例: go-sbomでSBOMを生成する
go-sbom sbom-outputs/go-sbom/sbom.spdx.json ./bin/myapp
```

## 評価

`result.json`ファイルに、各ツールで生成されたSBOMの評価結果を記録することを想定しています。

**評価の観点（例）:**

- **依存関係の網羅性:** 直接的・間接的な依存関係をどれだけ正確に検出できるか。
- **情報の詳細度:** ライセンス、バージョン、PURLなどの情報がどれだけ豊富か。
- **実行速度:** SBOM生成にかかる時間。
- **フォーマットの多様性:** SPDX, CycloneDXなど、サポートしているフォーマットの種類。

## 今後の課題

- [ ] 各ツールでのSBOM生成コマンドを`Makefile`に統合する。
- [ ] 評価プロセスを自動化するスクリプトを作成し、`result.json`を生成する。
- [ ] 異なる種類の依存関係（例: CGOを使ったライブラリ）を持つGoアプリケーションを評価対象に追加する。