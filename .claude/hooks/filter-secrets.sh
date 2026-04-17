#!/bin/bash

# stdin から JSON を読み込み、prompt フィールドを抽出
prompt=$(cat | jq -r '.prompt')

# APIキーパターンを検知（OpenAI形式: sk-xxx）
if echo "$prompt" | grep -qE "sk-[a-zA-Z0-9]{20,}"; then
    echo '{"decision": "block", "reason": "APIキーが含まれている可能性があります。機密情報を削除してから再度お試しください。"}'
    exit 0
fi

exit 0