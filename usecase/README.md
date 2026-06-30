# Usecase — 実行パターン

目的に対する最適な組み合わせのプリセットを定義するレイヤー。
thinking-mode、output-mode、receiver-model の組み合わせにより、具体的なシナリオでの意思決定を再現する。

## 位置づけ

usecase は thinking-mode × output-mode × receiver-model の組み合わせである。
各ユースケースはデフォルトの thinking-mode、output-mode、receiver-model を持つが、必要に応じて変更可能。
receiver-model は省略可能。省略時は受け手の状態を特定しない。

## 構成

### 1on1 シナリオ（thinking-mode: one-on-one）

| ファイル | 概要 |
|---|---|
| [one-on-one/career-advice.md](one-on-one/career-advice.md) | キャリア相談 |
| [one-on-one/goal-setting.md](one-on-one/goal-setting.md) | 目標設定 |

### 経営シナリオ（thinking-mode: executive）

| ファイル | 概要 |
|---|---|
| [executive/organization-design.md](executive/organization-design.md) | 組織設計 |
| [executive/priority-setting.md](executive/priority-setting.md) | 優先順位設定 |
| [executive/technology-investment.md](executive/technology-investment.md) | 技術投資判断 |

### プロダクトシナリオ（thinking-mode: product）

| ファイル | 概要 |
|---|---|
| [product/feature-prioritization.md](product/feature-prioritization.md) | 機能優先順位づけ |
| [product/operational-scalability.md](product/operational-scalability.md) | オペレーション設計・スケーラビリティ |
| [product/roadmap-planning.md](product/roadmap-planning.md) | ロードマップ策定 |

### 技術レビューシナリオ（thinking-mode: tech-review）

| ファイル | 概要 |
|---|---|
| [tech-review/architecture-review.md](tech-review/architecture-review.md) | アーキテクチャレビュー |
| [tech-review/incident-technical-postmortem.md](tech-review/incident-technical-postmortem.md) | 技術的ポストモーテム |
| [tech-review/technology-selection.md](tech-review/technology-selection.md) | 技術選定 |

### ブログ執筆シナリオ（output-mode: blog）

| ファイル | 概要 |
|---|---|
| [blog/tech-blog.md](blog/tech-blog.md) | エンジニアとしての技術ブログ執筆 |

## 拡張ルール

新しい実行パターンを追加する場合は、このレイヤーにファイルを追加する。
thinking-mode、output-mode、receiver-model の定義そのものをここに混ぜないこと。
