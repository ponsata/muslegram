# Project Title 
  MuscleGram/ Video Sharing Service
## Project Overview 
  Youtube動画共有サービス
## Motivation
  動画共有サービスです。主にフィットネスに興味ある方向けにおすすめの動画をユーザー間で共有していただくサービスになっています。
## why? 
  日本のフィットネス業界は、世界に比べてみても、かなりの後進国にあたります。
  しかしここ数年は、フィットネスインフルエンサーを中心に業界が盛り上がりを見せております。
  そんな中、筋トレをする同年代も増えており、SNS感覚で、効率よく学べる動画共有サービスを作りました。動画媒体は、youtubeの機能をベースにしています。
  動画媒体の発展を気に、自分の知りたいことを検索すれば大抵の動画は出てくる時代です。筋トレやダイエットのやり方、モチベーションをあげる動画なども探せが無数に出てきます。
  自分が体験したことや学びになったことを本サービスを使っていただく方に発信していただき、学びになるプラットフォームをユーザー同士で作っていくという本アプリの目的にあります。
## Point 
  youtubeDataAPIv3を用いたyoutube動画検索機能です。
  お好きなワードを入力するとYoutube Data API にアクセスすることで、サービス内で動画視聴することができます。
  またユーザが検索視聴履歴は、ホーム画面で共有されますので、ユーザーがどんな動画を見ているかを確認することができます。
  ### あなたのおすすめの動画が見つかったら、動画の感想を投稿してみよう！！
## Production environment 
  [Musclegram/サイトURL](https://musclegram.net/)
## Screenshots 
 ![toppage](https://user-images.githubusercontent.com/65805662/99909868-4556e400-2d2e-11eb-8e29-97b8f2178619.jpg)

 ![mypage](https://user-images.githubusercontent.com/65805662/99909870-47b93e00-2d2e-11eb-8694-a71a7bff94b5.jpg)

 ![message](https://user-images.githubusercontent.com/65805662/99909871-48ea6b00-2d2e-11eb-9d1f-c4da3370254a.jpg)

 ![post](https://user-images.githubusercontent.com/65805662/99909872-4a1b9800-2d2e-11eb-9dcc-55c7c5ee2e64.jpg)

## Development environment Technology used 
<img width="973" alt="b6324ded8d57822aea9a4684193351ab" src="https://user-images.githubusercontent.com/65805662/95767262-74ba1000-0cef-11eb-9a98-2d5610578126.png">

- MySQL5.7
- nginx,puma
- Javascript・jQuery
- Ruby 2.5.1
- Rails 5.2.4
- Rspec テスト環境の実装
- Docker,Docker-compose 仮想環境構築
- AWS/インフラ構築（EC2, RDS, VPC, EIP, Route53, IAM, S3, Docker ACM）
- Mac Catalina(10.15.5)
- Amazon Linux 2
- VSCode, Vim
## List of Functions
◆ユーザー機能3種類・deviseを使用
- ゲストログイン機能
- 新規登録、ログイン、ログアウト
- マイページ、登録情報編集
- ユーザー一覧表示

◆フォロー機能
- 非同期通信
- 相互フォロー機能
- フォロー・フォロワーの一覧表示

◆Youtube 動画視聴
- youtube Video API使用
- 動画一覧機能

◆検索機能
- youtube Data API 使用 
- 検索フォームからワードを入力するとyoutubeの動画を検索することができます。

◆投稿機能
- 一覧表示 投稿、編集、削除機能

◆Llke機能
- Likeボタン
- ライク一覧表示
- 非同期通信

◆プレイリスト機能 
- ブックマーク作成と削除
- ユーザマイページにてプレイリスト視聴

◆コメント機能 
- 動画投稿に紐づくコメントの投稿
- コメント表示・削除機能

◆レスポンシブデザイン対応 

◆Rspec 
- 単体テスト サンプル数50 

## Authors
  Takahiro Satake - [Github](https://github.com/takahirosatake)  - [Musclegram/サイトURL](http://musclegram.net/)
## Function/features to improve 
- テスト数が少ないので、優先して取り組んでおります。
- 投稿タグ付機能 / 投稿検索
- サイト内動画検索機能と該当ワード検索機能
- フロントフレームワークにVue.js / UIライブラリーにVuetifyを導入