#!/bin/bash
# Mac用インストールスクリプト

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "Claude Code 設定をインストールします..."

# ディレクトリ作成
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/rules/common"
mkdir -p "$CLAUDE_DIR/rules/typescript"
mkdir -p "$CLAUDE_DIR/rules/python"
mkdir -p "$CLAUDE_DIR/hooks"
mkdir -p "$CLAUDE_DIR/instincts"

# コマンド・ルール・フックをコピー
cp "$REPO_DIR/commands/"*.md "$CLAUDE_DIR/commands/"
cp "$REPO_DIR/rules/common/"*.md "$CLAUDE_DIR/rules/common/"
cp "$REPO_DIR/rules/typescript/"*.md "$CLAUDE_DIR/rules/typescript/"
cp "$REPO_DIR/rules/python/"*.md "$CLAUDE_DIR/rules/python/"
cp "$REPO_DIR/hooks/auto-format.sh" "$CLAUDE_DIR/hooks/"
chmod +x "$CLAUDE_DIR/hooks/auto-format.sh"

# Mac用 settings.json をコピー（トークンなし）
cp "$REPO_DIR/settings-mac.json" "$CLAUDE_DIR/settings.json"

# CLAUDE.md をホームディレクトリに配置
cp "$REPO_DIR/CLAUDE.md" "$HOME/CLAUDE.md"

# Mac用 settings.local.json を自動生成（Windows専用のdirコマンドを除いた内容）
cat > "$CLAUDE_DIR/settings.local.json" <<'EOF'
{
  "permissions": {
    "allow": [
      "mcp__supabase__list_organizations",
      "mcp__supabase__list_projects",
      "Bash(shopify version:*)",
      "Bash(gcloud --version:*)",
      "Bash(gcloud config get-value:*)",
      "Bash(gcloud run services list:*)",
      "Bash(gcloud run deploy:*)",
      "Bash(gcloud builds submit:*)",
      "Bash(gcloud run services describe:*)",
      "Bash(gcloud run services get-iam-policy:*)",
      "Bash(gcloud run services add-iam-policy-binding:*)"
    ]
  }
}
EOF

echo ""
echo "✅ 自動設定が完了しました"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "⚠️  【手動対応が必要】Supabase トークンの設定"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Windows PC から AirDrop で以下のファイルを受け取り、"
echo "中身を参考に Supabase の mcpServers 設定を追加してください："
echo ""
echo "  Windows側のファイル: C:\\Users\\TSUCHIGA\\.claude\\settings.json"
echo "  Mac側の配置先:       $CLAUDE_DIR/settings.json"
echo ""
echo "追加する内容（settings.json の mcpServers に追記）："
echo ""
echo '  "supabase": {'
echo '    "type": "stdio",'
echo '    "command": "npx",'
echo '    "args": ["-y", "@supabase/mcp-server-supabase@latest", "--project-ref", "<PROJECT_REF>"],'
echo '    "env": {'
echo '      "SUPABASE_ACCESS_TOKEN": "<YOUR_TOKEN>"'
echo '    }'
echo '  }'
echo ""
echo "トークンは Windows 側の settings.json を確認してください。"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
