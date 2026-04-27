#!/bin/bash
# PostToolUse: ファイル編集後に自動フォーマットを実行するフック

input_json=$(cat)
file_path=$(echo "$input_json" | python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_input',{}).get('file_path',''))" 2>/dev/null)

if [ -z "$file_path" ]; then exit 0; fi

ext="${file_path##*.}"

case "$ext" in
  ts|tsx|js|jsx)
    if command -v prettier &>/dev/null; then
      prettier --write "$file_path" 2>/dev/null
    fi
    if command -v eslint &>/dev/null; then
      eslint --fix "$file_path" 2>/dev/null
    fi
    ;;
  py)
    if command -v black &>/dev/null; then
      black "$file_path" 2>/dev/null
    fi
    ;;
esac

exit 0
