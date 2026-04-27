# Python セキュリティ

対象ファイル: `**/*.py`, `**/*.pyi`

## シークレット管理
- APIキー・パスワードをコードに直接書かない（絶対禁止）
- `python-dotenv` を使って環境変数から取得する

```python
# NG
api_key = "sk-proj-xxxxx"

# OK
import os
api_key = os.environ["OPENAI_API_KEY"]  # キーがない場合は KeyError で早期失敗
```

## 静的解析
- `bandit -r src/` でセキュリティ静的解析を定期実行する
