# TypeScript パターン

対象ファイル: `**/*.ts`, `**/*.tsx`, `**/*.js`, `**/*.jsx`

## API レスポンス形式
```typescript
interface ApiResponse<T> {
  success: boolean;
  data?: T;
  error?: string;
  metadata?: { page?: number; total?: number };
}
```

## カスタムフック（React）
- デバウンスなどのパフォーマンス最適化は `useState` + `useEffect` のカスタムフックにまとめる

## リポジトリパターン
- データアクセス操作は Repository パターンでインターフェースを定義する
- ジェネリクスと DTO で型安全性を確保する
