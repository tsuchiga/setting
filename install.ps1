# Windows用インストールスクリプト

$RepoDir = $PSScriptRoot
$ClaudeDir = "$env:USERPROFILE\.claude"

Write-Host "Claude Code 設定をインストールします..."

New-Item -ItemType Directory -Force -Path "$ClaudeDir\commands" | Out-Null
New-Item -ItemType Directory -Force -Path "$ClaudeDir\rules\common" | Out-Null
New-Item -ItemType Directory -Force -Path "$ClaudeDir\rules\typescript" | Out-Null
New-Item -ItemType Directory -Force -Path "$ClaudeDir\rules\python" | Out-Null
New-Item -ItemType Directory -Force -Path "$ClaudeDir\hooks" | Out-Null
New-Item -ItemType Directory -Force -Path "$ClaudeDir\instincts" | Out-Null

Copy-Item "$RepoDir\commands\*.md" "$ClaudeDir\commands\" -Force
Copy-Item "$RepoDir\rules\common\*.md" "$ClaudeDir\rules\common\" -Force
Copy-Item "$RepoDir\rules\typescript\*.md" "$ClaudeDir\rules\typescript\" -Force
Copy-Item "$RepoDir\rules\python\*.md" "$ClaudeDir\rules\python\" -Force
Copy-Item "$RepoDir\hooks\auto-format.ps1" "$ClaudeDir\hooks\" -Force
Copy-Item "$RepoDir\settings.json" "$ClaudeDir\settings.json" -Force
Copy-Item "$RepoDir\CLAUDE.md" "$env:USERPROFILE\CLAUDE.md" -Force

Write-Host ""
Write-Host "✅ インストール完了"
Write-Host ""
Write-Host "⚠️  【手動対応が必要】settings.local.json を確認してください"
Write-Host "   以下のファイルは Git 管理外のため、手動での管理が必要です："
Write-Host "   $ClaudeDir\settings.local.json"
Write-Host ""
Write-Host "   settings.local.json には以下が含まれています："
Write-Host "   - Supabase アクセストークン"
Write-Host "   - その他の個人用権限設定"
