#!/bin/bash

# jq が未インストールの場合はスキップ
if ! command -v jq &> /dev/null; then
    exit 0
fi

# stdin から JSON を読み込み、prompt フィールドを抽出
prompt=$(jq -r '.prompt // empty')

# APIキーパターンを検知
if printf '%s' "$prompt" | grep -qE "sk-[a-zA-Z0-9_-]{20,}"; then
    echo '{"decision": "block", "reason": "APIキーが含まれている可能性があります。機密情報を削除してから再度お試しください。"}'
    exit 0
fi

if printf '%s' "$prompt" | grep -qE "AKIA[A-Z0-9]{16}"; then
    echo '{"decision": "block", "reason": "APIキーが含まれている可能性があります。機密情報を削除してから再度お試しください。"}'
    exit 0
fi

if printf '%s' "$prompt" | grep -qE "ghp_[a-zA-Z0-9]{36}"; then
    echo '{"decision": "block", "reason": "APIキーが含まれている可能性があります。機密情報を削除してから再度お試しください。"}'
    exit 0
fi

if printf '%s' "$prompt" | grep -qE "AIza[0-9A-Za-z_-]{35}"; then
    echo '{"decision": "block", "reason": "APIキーが含まれている可能性があります。機密情報を削除してから再度お試しください。"}'
    exit 0
fi

exit 0
