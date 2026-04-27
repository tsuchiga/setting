#!/bin/bash
# Mac用インストールスクリプト

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "Claude Code 設定をインストールします..."

mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/rules/common"
mkdir -p "$CLAUDE_DIR/rules/typescript"
mkdir -p "$CLAUDE_DIR/rules/python"
mkdir -p "$CLAUDE_DIR/hooks"
mkdir -p "$CLAUDE_DIR/instincts"

cp "$REPO_DIR/commands/"*.md "$CLAUDE_DIR/commands/"
cp "$REPO_DIR/rules/common/"*.md "$CLAUDE_DIR/rules/common/"
cp "$REPO_DIR/rules/typescript/"*.md "$CLAUDE_DIR/rules/typescript/"
cp "$REPO_DIR/rules/python/"*.md "$CLAUDE_DIR/rules/python/"
cp "$REPO_DIR/hooks/auto-format.sh" "$CLAUDE_DIR/hooks/"
chmod +x "$CLAUDE_DIR/hooks/auto-format.sh"
cp "$REPO_DIR/settings-mac.json" "$CLAUDE_DIR/settings.json"
cp "$REPO_DIR/CLAUDE.md" "$HOME/CLAUDE.md"

echo ""
echo "✅ インストール完了"
echo ""
echo "⚠️  【手動対応が必要】settings.local.json を配置してください"
echo "   Windows PC から AirDrop で受け取ったファイルを以下に配置："
echo "   $CLAUDE_DIR/settings.local.json"
echo ""
echo "   settings.local.json には以下が含まれています："
echo "   - Supabase アクセストークン"
echo "   - その他の個人用権限設定"
