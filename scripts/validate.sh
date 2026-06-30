#!/bin/bash
# Mind as Code - Verify Layer
# .claude/rules/ に定義されたルールを自動検証するスクリプト
#
# 検証項目:
#   1. Reference Integrity  - usecaseが参照するモードが実在するか
#   2. Template Conformance - 各レイヤーが必須セクションを満たしているか
#   3. Layer Boundary       - レイヤー間の情報境界に違反がないか
#   4. Annotation Tags      - core配下で許可されていないannotationタグが使われていないか

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ERRORS=0
WARNINGS=0

red()    { printf "\033[31m%s\033[0m\n" "$1"; }
yellow() { printf "\033[33m%s\033[0m\n" "$1"; }
green()  { printf "\033[32m%s\033[0m\n" "$1"; }

error()   { red   "  ERROR: $1"; ERRORS=$((ERRORS + 1)); }
warning() { yellow "  WARN:  $1"; WARNINGS=$((WARNINGS + 1)); }

# ==================================================
# 1. Reference Integrity
# ==================================================
echo "=== Reference Integrity ==="

for usecase_file in "$ROOT_DIR"/usecase/**/*.md; do
  [[ "$(basename "$usecase_file")" == "README.md" ]] && continue

  # thinking-mode の参照チェック（カンマ区切りの合成モードに対応）
  tm_raw=$(grep -E '^- thinking-mode[^：]*：' "$usecase_file" 2>/dev/null | sed 's/^- thinking-mode[^：]*：//' | xargs)
  if [[ -n "$tm_raw" && "$tm_raw" != "状況に応じて選択" ]]; then
    # カンマで分割し、各モード名を検証（補助の注釈を除去）
    IFS=',' read -ra tm_parts <<< "$tm_raw"
    for tm_part in "${tm_parts[@]}"; do
      tm_name=$(echo "$tm_part" | sed 's/（.*）//' | xargs)
      if [[ -n "$tm_name" && ! -f "$ROOT_DIR/thinking-mode/${tm_name}.md" ]]; then
        error "$(basename "$usecase_file"): thinking-mode '${tm_name}' が thinking-mode/ に存在しません"
      fi
    done
  fi

  # output-mode の参照チェック
  om=$(grep -E '^- output-mode：' "$usecase_file" 2>/dev/null | sed 's/^- output-mode：//' | xargs)
  if [[ -n "$om" && "$om" != "状況に応じて選択" ]]; then
    if [[ ! -f "$ROOT_DIR/output-mode/${om}.md" ]]; then
      error "$(basename "$usecase_file"): output-mode '${om}' が output-mode/ に存在しません"
    fi
  fi

  # receiver-model の参照チェック
  rm_val=$(grep -E '^- receiver-model：' "$usecase_file" 2>/dev/null | sed 's/^- receiver-model：//' | xargs)
  if [[ -n "$rm_val" && "$rm_val" != "状況に応じて選択" && "$rm_val" != "省略" ]]; then
    if [[ ! -f "$ROOT_DIR/receiver-model/${rm_val}.md" ]]; then
      error "$(basename "$usecase_file"): receiver-model '${rm_val}' が receiver-model/ に存在しません"
    fi
  fi
done

echo ""

# ==================================================
# 2. Template Conformance
# ==================================================
echo "=== Template Conformance ==="

check_sections() {
  local file="$1"
  shift
  local layer="$1"
  shift
  local basename
  basename="$(basename "$file")"

  for section in "$@"; do
    if ! grep -qF "$section" "$file"; then
      error "${layer}/${basename}: 必須セクション '${section}' がありません"
    fi
  done
}

# thinking-mode
for f in "$ROOT_DIR"/thinking-mode/*.md; do
  [[ "$(basename "$f")" == "README.md" ]] && continue
  check_sections "$f" "thinking-mode" "## 目的" "## 追加ルール" "## 出力スタイル" "## 典型問い" "## NG"
done

# output-mode
for f in "$ROOT_DIR"/output-mode/*.md; do
  bn="$(basename "$f")"
  [[ "$bn" == "README.md" || "$bn" == "base.md" ]] && continue
  check_sections "$f" "output-mode" "## 全体的な傾向" "## 文体・語尾" "## 構成パターン" "## 表現の特徴" "## 感情・温度感" "## 特徴的なパターン"
done

# receiver-model
for f in "$ROOT_DIR"/receiver-model/*.md; do
  [[ "$(basename "$f")" == "README.md" ]] && continue
  check_sections "$f" "receiver-model" "## 概要" "## 知識・前提" "## 関心・ニーズ" "## 状態・コンテキスト" "## 調整ルール" "## NG"
done

# usecase
for f in "$ROOT_DIR"/usecase/**/*.md; do
  [[ "$(basename "$f")" == "README.md" ]] && continue
  check_sections "$f" "usecase" "## 概要" "## モード指定" "## コンテキスト" "## 追加ルール" "## 出力構成" "## NG"
done

echo ""

# ==================================================
# 3. Layer Boundary
# ==================================================
echo "=== Layer Boundary ==="

# --- 3a. 逆方向の依存チェック（core → 外部レイヤー）---
for f in "$ROOT_DIR"/core/*.md; do
  [[ "$(basename "$f")" == "README.md" ]] && continue
  if grep -qE '(thinking-mode|output-mode|receiver-model|usecase)' "$f"; then
    error "core/$(basename "$f"): 外部レイヤーへの参照が含まれています（依存方向違反）"
  fi
done

# --- 3b. 横方向の依存チェック（同層間の相互参照禁止）---

# thinking-mode → output-mode の語彙混入
for f in "$ROOT_DIR"/thinking-mode/*.md; do
  [[ "$(basename "$f")" == "README.md" ]] && continue
  if grep -qE '(文体|語尾|トーン|敬体|常体)' "$f"; then
    warning "thinking-mode/$(basename "$f"): output-mode の語彙（文体/語尾/トーン等）が含まれています"
  fi
done

# thinking-mode → receiver-model の語彙混入
for f in "$ROOT_DIR"/thinking-mode/*.md; do
  [[ "$(basename "$f")" == "README.md" ]] && continue
  if grep -qE '(受け手の状態|受け手が|receiver-model)' "$f"; then
    warning "thinking-mode/$(basename "$f"): receiver-model の語彙（受け手の状態等）が含まれています"
  fi
done

# output-mode → thinking-mode/core の語彙混入
for f in "$ROOT_DIR"/output-mode/*.md; do
  bn="$(basename "$f")"
  [[ "$bn" == "README.md" || "$bn" == "base.md" ]] && continue
  if grep -qE '(判断基準|意思決定原則|優先順位ルール)' "$f"; then
    warning "output-mode/${bn}: thinking-mode/core の語彙（判断基準/意思決定原則等）が含まれています"
  fi
done

# output-mode → receiver-model の語彙混入
for f in "$ROOT_DIR"/output-mode/*.md; do
  bn="$(basename "$f")"
  [[ "$bn" == "README.md" || "$bn" == "base.md" ]] && continue
  if grep -qE '(受け手の状態|受け手が|receiver-model)' "$f"; then
    warning "output-mode/${bn}: receiver-model の語彙（受け手の状態等）が含まれています"
  fi
done

# receiver-model → output-mode の語彙混入
for f in "$ROOT_DIR"/receiver-model/*.md; do
  [[ "$(basename "$f")" == "README.md" ]] && continue
  if grep -qE '(文体|語尾|敬体|常体)' "$f"; then
    warning "receiver-model/$(basename "$f"): output-mode の語彙（文体/語尾等）が含まれています"
  fi
done

# receiver-model → thinking-mode の語彙混入
for f in "$ROOT_DIR"/receiver-model/*.md; do
  [[ "$(basename "$f")" == "README.md" ]] && continue
  if grep -qE '(thinking-mode|視点の定義)' "$f"; then
    warning "receiver-model/$(basename "$f"): thinking-mode の語彙が含まれています"
  fi
done

echo ""

# ==================================================
# 4. Annotation Tags
# ==================================================
echo "=== Annotation Tags ==="

# core/ 配下のリスト項目で [補正] 以外の annotation タグを ERROR とする
# 検出パターン: 行頭の `- ` または `N. ` の直後に `[XXX] `（末尾スペース必須）
# Markdownリンク（`[name](path)`）は `]` の後が `(` なので除外される
for f in "$ROOT_DIR"/core/*.md; do
  bn="$(basename "$f")"
  while IFS= read -r match; do
    [[ -z "$match" ]] && continue
    error "core/${bn}: 許可されていない annotation tag: ${match}"
  done < <(grep -nE '^[[:space:]]*(- |[0-9]+\. )\[[^]]+\] ' "$f" 2>/dev/null | grep -vE '\[補正\] ' || true)
done

echo ""

# ==================================================
# Summary
# ==================================================
echo "=== Summary ==="
if [[ $ERRORS -eq 0 && $WARNINGS -eq 0 ]]; then
  green "All checks passed."
elif [[ $ERRORS -eq 0 ]]; then
  yellow "${WARNINGS} warning(s), 0 error(s)"
else
  red "${ERRORS} error(s), ${WARNINGS} warning(s)"
  exit 1
fi
