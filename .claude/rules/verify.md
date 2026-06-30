---
description: Verify層 — 自動検証の仕組み
paths:
  - "core/**"
  - "thinking-mode/**"
  - "output-mode/**"
  - "receiver-model/**"
  - "usecase/**"
  - "thinking-protocol/**"
---

# Verify

Mind as Code の整合性を自動検証する仕組み。

## 検証スクリプト

`scripts/validate.sh` が以下のルールを自動検証する。

| チェック | 対応ルール | 内容 |
|---|---|---|
| Reference Integrity | reference-integrity.md | usecaseが参照するモードが実在するか |
| Template Conformance | template-conformance.md | 各レイヤーが必須セクションを満たしているか |
| Layer Boundary | layer-boundary.md | レイヤー間の情報境界に違反がないか |
| Annotation Tags | annotation-tags.md | core配下で許可されていないannotationタグが使われていないか |

## 実行タイミング

以下の操作を行った際は `scripts/validate.sh` を実行し、エラーがないことを確認する。

- thinking-mode / output-mode / receiver-model / usecase / thinking-protocol のファイルを追加・編集・削除した場合
- core のファイルを編集した場合

## エラーとワーニングの扱い

- **ERROR**: 必ず修正する。コミット前に解消すること
- **WARN**: 意図的な場合は許容するが、理由を確認する
