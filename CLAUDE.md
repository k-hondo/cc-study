# プロジェクト名

cc-study

## 概要

Claude Codeによる、AI駆動開発の学習

## 技術スタック

- Frontend: React 19 + TypeScript 6 + Vite 8
- ビルドツール: Vite（`@vitejs/plugin-react` 使用）
- Lint: ESLint 9（`typescript-eslint` + `eslint-plugin-react-hooks`）

## ディレクトリ構造

src/
├── App.tsx        # ルートコンポーネント
├── main.tsx       # エントリポイント
├── App.css        # コンポーネント固有スタイル
├── index.css      # グローバルスタイル
└── assets/        # 画像・SVG アセット

public/
└── icons.svg      # SVG スプライト（`<use href>` で参照）

## コーディング規約

- TypeScriptのstrictモードを使用してください
- コンポーネントはfunctional componentで記述してください
- 関数名はcamelCase、コンポーネント名はPascalCaseで書いてください

## 禁止事項

- anyの使用は最小限にしてください
- console.logを本番コードに残さないでください
- 既存のテストを削除しないでください

## よく使うコマンド

- npm run dev: 開発サーバー起動（http://localhost:5173）
- npm run build: 型チェック + プロダクションビルド
- npm run lint: Lint 実行
- npm run preview: ビルド結果のプレビュー
