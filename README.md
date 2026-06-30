# Mind as Code

人の思考や意思決定を分解し、再利用可能な形で扱う。
思考を「コードのように」構造化・再利用・組み合わせ可能にする。

> このリポジトリは、個人で運用している mind-as-code システムから、公開可能な範囲だけを切り出したものです。
>
> 個人的なメモ、会社固有の情報、個人情報、機密性のある運用詳細は含めていません。
> 構造や例は、参考・応用のために公開しています。非公開で運用している元リポジトリの完全なコピーではありません。

## 構成

| レイヤー | 役割 | 性質 |
|---|---|---|
| [core](core/) | 思考原則 | 安定（意図的な更新のみ） |
| [thinking-mode](thinking-mode/) | 役割（視点） | 状況に応じて選択 |
| [output-mode](output-mode/) | 表現（伝え方） | チャネルに応じて選択 |
| [receiver-model](receiver-model/) | 受け手の状態 | 相手に応じて選択 |
| [usecase](usecase/) | 実行パターン | thinking-mode × output-mode × receiver-model の組み合わせ |
| [thinking-protocol](thinking-protocol/) | 思考プロセス（横断） | 各レイヤーをどう動かすか |

思考・役割・表現・受け手は独立して設計される。

- 思考（core）は最も安定した層であり、軽々しくは変えない
- 役割（thinking-mode）で視点を変える
- 表現（output-mode）で伝え方を変える
- 受け手（receiver-model）で相手に応じた調整をする

同一の思考でも、視点・表現・受け手の組み合わせにより異なる状況に適用できる。
thinking-protocol はこれらのレイヤーを横断し、状況に応じた思考プロセス（Fast Path / Slow Path）を定義する。

依存方向・core 内部の構造・データフローの図解は [docs/architecture.md](docs/architecture.md) を参照。

## 使い方

状況に応じて thinking-mode、output-mode、receiver-model を組み合わせる。
よく使う組み合わせは [usecase](usecase/) にプリセットとして定義されている。

## その他

| ディレクトリ | 概要 |
|---|---|
| [docs](docs/) | コンセプト・設計原則 |
| [templates](templates/) | 新しいモード・ユースケース追加用テンプレート |

## スタンス

これは「正解」を提供するものではない。
どう考えるか、どう判断するかを外部化し、改善可能にするための仕組みである。

## License

- コード（`scripts/` 配下等）: [MIT License](LICENSE-CODE)
- コンテンツ（ドキュメント・例示の Markdown）: [Creative Commons Attribution 4.0 International (CC BY 4.0)](LICENSE-CONTENT)
