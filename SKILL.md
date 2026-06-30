---
name: mind-as-code
description: 思考フレームワークに基づく対話・レビュー・執筆スキル。「私の視点で」「私の考え方で」をプロンプトに含めると適用される。
---

# Skills

Mind as Code の思考フレームワークに基づく対話・レビュースキル。
「私の視点で」「私の考え方で」をプロンプトに含めると、このフレームワークが適用される。

## 参照順序

[thinking-protocol/](thinking-protocol/) に基づく2速のプロセスで進める。

1. [usecase/](usecase/) と [thinking-mode/](thinking-mode/) から該当するものを探す
2. **該当あり（Fast Path）** → usecaseに従って実行する。エスカレーション・トリガー発火時は Slow Path へ切り替え
3. **該当なし（Slow Path）** → 状況分析 → thinking-mode / output-mode / receiver-model を選択 → [core/](core/) の原則を適用 → 合成

usecase や thinking-mode を飛ばして core + output-mode だけで作業しないこと。

## 対話スキル

### 1on1（thinking-mode: one-on-one）

| スキル | 概要 |
|---|---|
| [キャリア相談](usecase/one-on-one/career-advice.md) | メンバーのキャリア方向性を一緒に考える |
| [目標設定](usecase/one-on-one/goal-setting.md) | 成長につながる目標を設計する |

### 経営判断（thinking-mode: executive）

| スキル | 概要 |
|---|---|
| [組織設計](usecase/executive/organization-design.md) | 組織構造・責務分掌の意思決定 |
| [優先順位設定](usecase/executive/priority-setting.md) | リソース配分と実行順序の判断 |
| [技術投資判断](usecase/executive/technology-investment.md) | 技術投資の評価と意思決定 |

### プロダクト（thinking-mode: product）

| スキル | 概要 |
|---|---|
| [機能優先順位づけ](usecase/product/feature-prioritization.md) | 機能の優先順位を事業価値で判断する |
| [オペレーション設計](usecase/product/operational-scalability.md) | スケーラビリティを考慮した運用設計 |
| [ロードマップ策定](usecase/product/roadmap-planning.md) | プロダクトロードマップの計画 |

## レビュースキル

### 技術レビュー（thinking-mode: tech-review）

| スキル | 概要 |
|---|---|
| [アーキテクチャレビュー](usecase/tech-review/architecture-review.md) | 既存アーキテクチャの評価 |
| [技術的ポストモーテム](usecase/tech-review/incident-technical-postmortem.md) | 技術的根本原因の特定と設計的再発防止 |
| [技術選定](usecase/tech-review/technology-selection.md) | 技術選択の評価と判断 |

## 執筆スキル

### ブログ（output-mode: blog）

| スキル | 概要 |
|---|---|
| [テックブログ](usecase/blog/tech-blog.md) | エンジニア視点の技術ブログ執筆 |

## カスタマイズ

スキルは thinking-mode × output-mode × receiver-model の組み合わせで構成される。
プリセットにない組み合わせも、各レイヤーを指定することで利用可能。

- **視点を変える**: [thinking-mode/](thinking-mode/) から選択
- **伝え方を変える**: [output-mode/](output-mode/) から選択
- **受け手に合わせる**: [receiver-model/](receiver-model/) から選択
