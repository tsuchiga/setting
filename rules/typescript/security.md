# TypeScript セキュリティ

対象ファイル: `**/*.ts`, `**/*.tsx`, `**/*.js`, `**/*.jsx`

## シークレット管理
- APIキー・パスワード・トークンをコードに直接書かない（絶対禁止）
- 機密情報は必ず環境変数から取得する

```typescript
// NG
const apiKey = "sk-proj-xxxxx";

// OK
const apiKey = process.env.OPENAI_API_KEY;
if (!apiKey) throw new Error("OPENAI_API_KEY is not set");
```

## 入力バリデーション
- ユーザー入力は必ずバリデーションする
- SQL インジェクション対策：パラメータ化クエリを使う
- XSS 対策：HTML を出力する際はサニタイズする
- CSRF 対策を実装する
