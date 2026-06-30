---
description: 各レイヤーのファイルがテンプレートの必須セクションに準拠していることを保証するルール
paths:
  - "thinking-mode/**"
  - "output-mode/**"
  - "receiver-model/**"
  - "usecase/**"
---

# Template Conformance

各レイヤーにファイルを追加・編集する際は、対応するテンプレートの必須セクションを含めること。

## 必須セクション

### thinking-mode

templates/thinking-mode.md に従い、以下のセクションを必ず含める。

- `# {モード名} Mode`（役割・立場の説明）
- `## 目的`
- `## 追加ルール`
- `## 出力スタイル`
- `## 典型問い`
- `## NG`

### output-mode

templates/output-mode.md に従い、以下のセクションを必ず含める。

- `# {モード名} Mode`
- `## 全体的な傾向`
- `## 文体・語尾`
- `## 構成パターン`
- `## 表現の特徴`
- `## 感情・温度感`
- `## 特徴的なパターン`

### receiver-model

templates/receiver-model.md に従い、以下のセクションを必ず含める。

- `# {レシーバー名}`
- `## 概要`
- `## 知識・前提`
- `## 関心・ニーズ`
- `## 状態・コンテキスト`
- `## 調整ルール`
- `## NG`

### usecase

templates/usecase.md に従い、以下のセクションを必ず含める。

- `# {ユースケース名}`
- `## 概要`（目的・背景）
- `## モード指定`（thinking-mode・output-mode・receiver-model）
- `## コンテキスト`（前提・制約・成功条件）
- `## 追加ルール`
- `## 出力構成`
- `## NG`
