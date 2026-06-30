#!/bin/bash
# Mind as Code - Skill Package Builder
# Claude web/desktop 向けのスキルパッケージ（zip）を作成する
#
# 含めるもの:
#   - SKILL.md（エントリポイント）
#   - core/ 全mdファイル
#   - thinking-mode/ 全mdファイル
#   - output-mode/ 全mdファイル
#   - receiver-model/ 全mdファイル
#   - usecase/ 全mdファイル
#   - thinking-protocol/ 全mdファイル
#
# 含めないもの:
#   - docs/, templates/, scripts/, .claude/

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUTPUT_DIR="$ROOT_DIR/dist"
PACKAGE_NAME="mind-as-code-skill"

# 出力ディレクトリの準備
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# 一時ディレクトリで構成
TEMP_DIR=$(mktemp -d)
PACKAGE_DIR="$TEMP_DIR/$PACKAGE_NAME"
mkdir -p "$PACKAGE_DIR"

# SKILL.md をコピー
cp "$ROOT_DIR/SKILL.md" "$PACKAGE_DIR/"

# 各レイヤーをコピー
for layer in core thinking-mode output-mode receiver-model usecase thinking-protocol; do
  if [[ -d "$ROOT_DIR/$layer" ]]; then
    mkdir -p "$PACKAGE_DIR/$layer"
    find "$ROOT_DIR/$layer" -name '*.md' -print0 | while IFS= read -r -d '' file; do
      # ディレクトリ構造を維持してコピー
      relative="${file#$ROOT_DIR/$layer/}"
      target_dir="$PACKAGE_DIR/$layer/$(dirname "$relative")"
      mkdir -p "$target_dir"
      cp "$file" "$target_dir/"
    done
  fi
done

# zip 作成
cd "$TEMP_DIR"
zip -r "$OUTPUT_DIR/$PACKAGE_NAME.zip" "$PACKAGE_NAME" > /dev/null

# クリーンアップ
rm -rf "$TEMP_DIR"

# 結果表示
FILE_COUNT=$(unzip -l "$OUTPUT_DIR/$PACKAGE_NAME.zip" | grep '\.md$' | wc -l | tr -d ' ')
FILE_SIZE=$(du -h "$OUTPUT_DIR/$PACKAGE_NAME.zip" | cut -f1 | tr -d ' ')

echo "Package created: dist/$PACKAGE_NAME.zip"
echo "  Files: ${FILE_COUNT} markdown files"
echo "  Size:  ${FILE_SIZE}"
