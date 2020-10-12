# Project Title 
  MuscleGram/ Video Sharing Service
## Project Overview 
  youtube動画共有サービス
## Motivation
  動画共有サービスです。主にフィットネスに興味ある方向けにおすすめの動画をユーザー間で共有していただくサービスになっています。
## Production environment 
  [Musclegram/サイトURL](http://musclegram.online/)
## Screenshots 
 ![画像](32a3495364dff358bdf08bb933a073d5.jpg)
 ![画像](1e9e610936db3bdb5710739265d7a2c8.jpg)
 ![画像](bb695b8ade237e201be4687b335a54c9.jpg)
 ![画像](dad63671940a179a52cb5fd7d59cbb3f.jpg)

## Development environment Technology used 
- MySQL5.7
- nginx,puma
- Javascript・jQuery
- Ruby 2.5.1, Rails 5.2.4
- Docker,Docker-compose（開発環境）
- AWS/本番環境（EC2, RDS, VPC, EIP, Route53, IAM, S3, Docker）
- Mac Catalina(10.15.5)
- Amazon Linux 2
- VSCode, Vim

## List of Functions
◆ユーザー機能3種類・deviseを使用
- 新規登録、ログイン、ログアウト
- マイページ、登録情報編集

◆Youtube 動画視聴
- youtube Video API使用
- 動画一覧機能

◆検索機能
- youtube Data API 使用 
- 検索フォームからワードを入力するとyoutubeの動画を検索することができます。

◆投稿機能
- 一覧表示、記事詳細表示、投稿、編集、削除機能
- 画像のアップロードはrefile,cocoonを使用

◆ブックマーク機能 いいね機能
- ブックマーク作成と削除
- ユーザマイページにてプレイリスト登録


## Authors 
  Takahiro Satake - [Github](https://github.com/takahirosatake)  - [Musclegram/サイトURL](http://musclegram.online/)
## Function/features to improve 
- 全体的デザインの見直し
- ユーザーフォロー機能とグループチャット機能
- 非同期通信(Ajax)
- テスト環境の実装Rspec・Circle ci 
