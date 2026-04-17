#!/bin/bash

# jq が未インストールの場合はスキップ
if ! command -v jq &> /dev/null; then
    exit 0
fi

# stdin から JSON を読み込み、prompt フィールドを抽出
prompt=$(jq -r '.prompt // empty') || exit 0

# APIキーパターンを検知
block_message='{"decision": "block", "reason": "APIキーが含まれている可能性があります。機密情報を削除してから再度お試しください。"}'

patterns=(
    "sk-[a-zA-Z0-9_-]{20,}"
    "AKIA[A-Z0-9]{16}"
    "ghp_[a-zA-Z0-9]{36}"
    "AIza[0-9A-Za-z_-]{35}"
)

for pattern in "${patterns[@]}"; do
    if printf '%s' "$prompt" | grep -qE "$pattern"; then
        echo "$block_message"
        exit 0
    fi
done

exit 0
