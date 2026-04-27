# Python テスト

対象ファイル: `**/*.py`, `**/*.pyi`

## フレームワーク
- **pytest** を使う

## カバレッジ確認
```bash
pytest --cov=src --cov-report=term-missing
```
- コードカバレッジ **80% 以上** を維持する

## テスト分類
```python
@pytest.mark.unit        # 関数・クラス単体テスト
@pytest.mark.integration # API・DB連携テスト
```

## TDD ワークフロー
1. テストを先に書く（RED）
2. テストが通るように実装する（GREEN）
3. リファクタリングしてカバレッジを確認する
