# Architecture

Mind as Code の全体構造、レイヤー間の関係、データフローを定義する。

## 全体構造

```mermaid
graph TB
  subgraph "thinking-protocol（横断プロセス）"
    TP[Fast Path / Slow Path / Feedback Loop]
  end

  subgraph "レイヤー"
    CORE[core — 思考原則]
    TM[thinking-mode — 視点]
    OM[output-mode — 表現]
    RM[receiver-model — 受け手]
    UC[usecase — プリセット]
  end

  TP --> CORE
  TP --> TM
  TP --> OM
  TP --> RM
  TP --> UC
  CORE --> TM
  CORE --> OM
  CORE --> RM
  TM --> UC
  OM --> UC
  RM --> UC
```

## レイヤー間の依存方向

依存は一方向のみ。逆方向・横方向の依存は禁止。

```
core ← thinking-mode
core ← output-mode
core ← receiver-model
thinking-mode + output-mode + receiver-model ← usecase
全レイヤー ← thinking-protocol（参照のみ、他から参照されない）
```

thinking-mode・output-mode・receiver-model は互いを参照しない。

## core 内部の構造

```mermaid
graph TD
  subgraph "Foundation — 基盤"
    D[decision] --- PR[priority-rules] --- CR[conflict-resolution]
  end
  subgraph "Support — 思考支援"
    EX[execution]
    UN[uncertainty]
    TH[time-horizon]
  end
  subgraph "Domain — 適用領域"
    SY[system] --> ST[strategy] --> PD[product]
    PD --> EN[engineering]
    PD --> OR[organization]
    PD --> TA[talent]
  end
  subgraph "Constraint — 横断制約"
    AP[anti-patterns]
  end

  D --> EX
  D --> UN
  PR --> EX
  PR --> TH
  EX --> SY
```

3つの軸:
- **system** — 認識の軸（構造をどう捉えるか）
- **strategy** — 意思決定の軸（どこで戦うか）
- **product** — 価値の軸（何を作るか）

## データフロー（思考プロセス）

```mermaid
graph LR
  S([状況]) --> PATH{Fast / Slow}
  PATH -->|既知| FP[Fast Path<br>usecase選択 → 実行]
  PATH -->|未知・複雑| SP[Slow Path<br>分析 → モード選択 → 原則適用 → 合成]
  FP -->|トリガー発火| SP
  FP --> OUT([出力])
  SP --> OUT
  OUT --> EVAL[Evaluation]
  EVAL --> REF[Reflection]
  REF --> UPD[Update Rule]
  UPD -->|還流| S
```

思考中に横断的に使用するツール:
- inquiry-framework — 思考の精度を高める問い
- abstraction-level — 抽象・構造・具体の行き来
- composition-rule — 複数thinking-modeの合成
