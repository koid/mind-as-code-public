# Mind as Code

人の思考・意思決定を構造化し、再利用可能にするプロジェクト。

## レイヤー構成

| レイヤー | 役割 | 性質 |
|---|---|---|
| core/ | 思考原則 | 安定（意図的な更新のみ） |
| thinking-mode/ | 役割（視点） | 状況に応じて選択 |
| output-mode/ | 表現（伝え方） | チャネルに応じて選択 |
| receiver-model/ | 受け手の状態 | 相手に応じて選択 |
| usecase/ | 実行パターン | thinking-mode × output-mode × receiver-model の組み合わせ |
| thinking-protocol/ | 思考プロセス（横断） | 各レイヤーをどう動かすか |

## レイヤー間ルール

- 各レイヤーは独立。定義の混在禁止
- 依存方向: core ← thinking-mode / output-mode / receiver-model ← usecase（逆方向・横方向禁止）
- thinking-protocol は全レイヤーを参照するが、他のレイヤーからは参照されない
- thinking-mode、output-mode、receiver-model は互いを参照しない

## コンテンツ境界

- 含めてよい: 思考原則、判断基準、視点、表現スタイル
- 含めてはいけない: 組織固有情報、個人評価、具体的な意思決定の結果

## 追加・編集ワークフロー

- thinking-mode 追加: templates/thinking-mode.md に従う
- output-mode 追加: templates/output-mode.md に従う
- receiver-model 追加: templates/receiver-model.md に従う
- usecase 追加: templates/usecase.md に従う（または /add-usecase コマンド）
- 見出しレベル: `#` にモード名（例: `# Executive Mode`）、`##` にセクション名

## その他

- docs/concept.md: プロジェクトの Why / What
- docs/design-principles.md: 設計原則の詳細

## エコーチェンバー対策（Anti Echo Chamber Directive）

判断の提案・評価時には、`core/echo-chamber-risk.md` を起動する。
特に、`thinking-protocol/tools.md` のエコーチェンバー・チェック・反証・非反証領域を、必要に応じて自律的に提示すること。

ユーザの既存原理に都合よくフィットする応答だけを生成しないこと。
反論・別解釈・失敗モード・反証条件を能動的に提示する。
