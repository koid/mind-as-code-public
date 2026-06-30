# Thinking Protocol — 思考プロトコル

各レイヤーの内容（何を考えるか）ではなく、レイヤーをどう動かすか（思考のプロセス）を定義する横断的な層。

## 位置づけ

Mind as Code の他のレイヤーが思考の「語彙」を提供するのに対し、thinking-protocol は思考の「文法」を提供する。core、thinking-mode、output-mode、receiver-model、usecase の全てを参照するが、他のレイヤーからは参照されない。

thinking-protocol は、Fast Path / Slow Path の切り替えだけでなく、
Observe → Orient → Decide → Act のループをどう回すかという運転原理も担う。
Fast Path / Slow Path は思考速度の違いであり、OODA はその両方を貫く基本ループである。

```
thinking-protocol（横断）── 各レイヤーをどう動かすかのプロセス
  ├── core（原則）
  ├── thinking-mode（視点）
  ├── output-mode（表現）
  ├── receiver-model（受け手）
  └── usecase（プリセット）
```

## 構成

| ファイル | 概要 |
|---|---|
| [process.md](process.md) | 思考プロセス — Fast Path / Slow Path / エスカレーション・トリガー |
| [tools.md](tools.md) | 思考ツール — 問い返しフレーム・抽象度制御・モード合成・評価・振り返り・更新ルール |

## 使い方

### 1. 状況に遭遇したら、まずパスを選ぶ（process.md）

- 既知のusecaseにマッチする → Fast Path へ
- マッチしない、または新規・複雑・高リスク → Slow Path へ
- 判断に迷ったら エスカレーション・トリガー を確認する

### 2. 思考中に使うツール（tools.md）

| ツール | いつ使うか |
|---|---|
| 問い返しフレーム | 思考の精度を高めたいとき。特にSlow Path Phase 1（状況分析） |
| 抽象度の制御 | 議論の抽象度がずれている、または層を飛ばしていると感じたとき |
| モードの合成ルール | 複数のthinking-modeが該当するとき（Slow Path Phase 2 モード選択） |

### 3. 出力後のフィードバックループ（tools.md）

1. 評価基準 — 出力を評価基準で判定する
2. 振り返り — 思考プロセスを振り返る
3. 更新ルール — 気づきをシステム更新に反映する

全ての出力でループを回す必要はない。Slow Pathを経た判断や「何か引っかかる」感覚があった時に実施する。
