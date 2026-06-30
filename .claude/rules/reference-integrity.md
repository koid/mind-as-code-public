---
description: usecaseが参照するモード・モデルがリポジトリ内に実在することを保証するルール
paths:
  - "usecase/**"
---

# Reference Integrity

usecaseが指定するthinking-mode、output-mode、receiver-modelは、リポジトリ内に実在するファイルでなければならない。

## ルール

- usecaseの「モード指定」セクションで指定する各モードは、対応するディレクトリ内に同名のファイルが存在すること
- 存在しないモード・モデルへの参照は禁止
- モード・モデルを削除する際は、それを参照しているusecaseがないことを確認すること

## 確認手順

usecaseを追加・編集する際は、以下を確認する。

1. `thinking-mode:` に指定した値が `thinking-mode/` 配下にファイルとして存在するか
2. `output-mode:` に指定した値が `output-mode/` 配下にファイルとして存在するか
3. `receiver-model:` に指定した値が `receiver-model/` 配下にファイルとして存在するか（省略可の場合を除く）

## 逆方向の確認

モード・モデルを削除またはリネームする際は、以下を確認する。

1. `usecase/` 配下のファイルで、削除・リネーム対象を参照しているものがないか
2. 参照がある場合は、先にusecaseの参照を更新すること
