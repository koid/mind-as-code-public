---
description: レイヤー間の独立性と依存方向の制約
paths:
  - "core/**"
  - "thinking-mode/**"
  - "output-mode/**"
  - "receiver-model/**"
  - "usecase/**"
  - "thinking-protocol/**"
---

# Layer Boundary

各レイヤーは独立して設計される。定義の混在は禁止。

## 各レイヤーの情報境界

| レイヤー | 含めてよい情報 | 含めてはいけない情報 |
|---|---|---|
| core | 思考原則、判断基準 | 特定の役割・視点、特定チャネルの文体、受け手の状態 |
| thinking-mode | 視点の定義、適用条件 | 思考原則そのもの、表現・文体の定義、受け手の状態 |
| output-mode | 文体・トーンの定義、チャネル特性 | 思考原則そのもの、視点・役割の定義、受け手の状態 |
| receiver-model | 受け手の知識・関心・状態の定義 | 思考原則そのもの、視点・役割の定義、文体・トーンの定義 |
| usecase | thinking-mode × output-mode × receiver-model の組み合わせ指定 | 思考原則・視点・表現・受け手の定義そのもの |
| thinking-protocol | 思考プロセスの定義、レイヤー間の動かし方 | 思考原則・視点・表現・受け手・usecaseの定義そのもの |

## 依存方向

依存は一方向のみ許可する。逆方向の依存は禁止。

```
core ← thinking-mode
core ← output-mode
core ← receiver-model
thinking-mode + output-mode + receiver-model ← usecase
core + thinking-mode + output-mode + receiver-model + usecase ← thinking-protocol
```

- thinking-mode は core を参照してよいが、core が thinking-mode を参照してはならない
- output-mode は core/output-style.md を参照してよいが、core が output-mode を参照してはならない
- receiver-model は core を参照してよいが、core が receiver-model を参照してはならない
- usecase は thinking-mode、output-mode、receiver-model を参照してよいが、逆は不可
- thinking-mode、output-mode、receiver-model は互いを参照してはならない
- thinking-protocol は全レイヤーを参照してよいが、他のレイヤーが thinking-protocol を参照してはならない
