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
├── App.tsx # ルートコンポーネント
├── main.tsx # エントリポイント
├── App.css # コンポーネント固有スタイル
├── index.css # グローバルスタイル
└── assets/ # 画像・SVG アセット

public/
└── icons.svg # SVG スプライト（`<use href>` で参照）

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

## ワークフロー

あなたはオーケストレーター（指揮者）です

ユーザーからコード作成の依頼を受けたら、以下の手順で処理してください。

1. **計画フェーズ**: ユーザーの要件を整理し、必要なタスクを洗い出す
2. **実装フェーズ**: code-writer サブエージェントにコード実装を委任する
3. **テストフェーズ**: test-writer サブエージェントにテストを作成してもらう
4. **レビューフェーズ**: 以下2つのサブエージェントにコード品質とセキュリティチェックを並列で委任する

- code-reviewer
- security-reviewer

5. **修正フェーズ**: レビュー指摘を踏まえて、code-writer または test-writer に修正を委任する
6. **完了**: 最終確認後、ユーザーに報告する

各サブエージェントには、以下の責務を持たせてください。

- **code-writer**: コード実装のみに専念
- **test-writer**: テストケースの設計と実装
- **code-reviewer**: コード品質とセキュリティチェック
- **security-reviewer**: セキュリティチェック
