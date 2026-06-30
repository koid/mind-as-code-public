新しいユースケースを追加する。

## 入力

ユーザからの入力: $ARGUMENTS

## 手順

### 1. 要件の確認

$ARGUMENTS からユースケースの意図を把握する。
不足している場合は以下を確認する：

- ユースケース名（日本語）
- 適用する thinking-mode（thinking-mode/ 配下から選択）
- 適用する output-mode（output-mode/ 配下から選択、または「指定なし」）
- どのような場面で使うか

### 2. 関連ファイルの読み込み

以下を読み込み、ユースケースの内容に反映する：

- 指定された thinking-mode のファイル（例: thinking-mode/executive.md）
- 関連する core/ のファイル（ユースケースの主題に対応するもの）
- templates/usecase.md（出力フォーマット）

### 3. ユースケースファイルの作成

- 配置先: usecase/{thinking-mode名}/{ユースケース名}.md
- フォーマット: templates/usecase.md に従う
- 内容: thinking-mode の追加ルール・NG と core/ の原則を組み合わせ、ユースケース固有のルールに落とし込む

### 4. README の更新

usecase/README.md の該当セクションにファイルへのリンクを追加する。
該当する thinking-mode のセクションがなければ新設する。

### 5. コミット

作成・更新したファイルをコミットする。
