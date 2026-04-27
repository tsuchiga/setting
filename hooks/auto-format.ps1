# PostToolUse: ファイル編集後に自動フォーマットを実行するフック

$input_json = $input | Out-String
try {
    $data = $input_json | ConvertFrom-Json
} catch {
    exit 0
}

$file_path = $data.tool_input.file_path
if (-not $file_path) { exit 0 }

$ext = [System.IO.Path]::GetExtension($file_path).ToLower()

switch -Regex ($ext) {
    '\.(ts|tsx|js|jsx)$' {
        # prettier が入っていれば実行
        if (Get-Command prettier -ErrorAction SilentlyContinue) {
            prettier --write $file_path 2>$null
        }
        # eslint が入っていれば実行（--fix）
        if (Get-Command eslint -ErrorAction SilentlyContinue) {
            eslint --fix $file_path 2>$null
        }
    }
    '\.py$' {
        # black が入っていれば実行
        if (Get-Command black -ErrorAction SilentlyContinue) {
            black $file_path 2>$null
        }
    }
}

exit 0
