# テスト環境整備

既存プロジェクトにテスト環境を導入します。

## 手順

### 1. プロジェクト構成の分析

以下を確認する：
- 使用言語・フレームワーク（TypeScript/Next.js/Remix/Python など）
- `package.json` または `requirements.txt` の内容
- 既存のテストファイルの有無（`*.test.ts`, `*.spec.ts`, `test_*.py` など）
- 主要なファイル・ディレクトリ構成

### 2. 分析結果の報告

以下をユーザーに報告する：
- 検出した技術スタック
- 現状のテスト状況（ゼロ／一部あり）
- 推奨するテストフレームワーク
- 導入するテストの種類と優先順位

### 3. ユーザーへの確認

「以下の構成でテスト環境を整えます。よいですか？」と確認を取る。

**TypeScript / Next.js / Remix プロジェクトの場合：**
- Unit テスト：Vitest
- E2E テスト：Playwright（既に導入済みの場合はスキップ）

**Python プロジェクトの場合：**
- Unit / Integration テスト：pytest + pytest-cov
- E2E テスト：Playwright（必要な場合）

### 4. テストフレームワークの導入

承認を得てからインストールを実行する。

**TypeScript の場合：**
```bash
npm install -D vitest @vitest/coverage-v8
npx playwright install
```

**Python の場合：**
```bash
pip install pytest pytest-cov
```

### 5. 設定ファイルの作成

**TypeScript の場合：**
- `vitest.config.ts` を作成（カバレッジ 80% 以上の設定を含む）
- `package.json` の scripts に `"test": "vitest"` `"test:coverage": "vitest --coverage"` を追加
- `playwright.config.ts` が存在しない場合は作成

**Python の場合：**
- `pytest.ini` または `pyproject.toml` に pytest 設定を追加
- カバレッジ 80% 以上の設定を含める

### 6. サンプルテストの作成

プロジェクトの主要ロジック（計算・API・ユーティリティ）に対してサンプルテストを作成する。

**方針：**
- まず最も重要なビジネスロジック（例：金額計算・集計処理）を対象にする
- 正常系・異常系・境界値の3パターンを含める
- テスト名は「何をテストしているか」が明確になるように書く

### 7. テスト実行の確認

作成したテストを実行して動作することを確認する。

```bash
npm test          # TypeScript
pytest            # Python
```

実行結果をユーザーに報告する。

### 8. 完了報告

以下をまとめて報告する：
- 導入したフレームワーク
- 作成したファイル一覧
- 現在のカバレッジ
- 今後テストを追加すべき箇所の推奨リスト
