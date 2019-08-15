# アプリの概要
勉強会管理アプリ（仮）です。勉強会を開催したり、参加したりすることができます。

「一人じゃ勉強やる気でないな」  
「同じ目標を持った人と仲良くなりたいな」  
そんな人たちをつなぐサービスです。

# 開発環境
Ruby 2.6.3  
Rails 5.2.3

# 機能一覧
## 実装済
* ログイン機能  
* facebookログイン機能  
* ユーザの登録、詳細表示、編集、削除機能  
* 勉強会の登録、詳細表示、編集、削除機能  
* 勉強会のイメージ画像アップロード機能  
* 勉強会を一覧表示する機能  
* ページネーション機能  
* 勉強会を検索する機能（タイトルのキーワード検索のみ）  
* 勉強会をソートする機能  
* 勉強会の申し込み、キャンセル機能  
* 気になる勉強会をストック、ストック解除する機能  
* 勉強会管理機能  
開催した勉強会、参加した勉強会、ストックした勉強会を表示
* 勉強会に対するコメント機能  
* ユーザフォロー機能  
フォローしたユーザが開催する勉強会を参照することができる機能
  
## 実装予定
* ユーザのプロフィール画像アップロード機能  
* 勉強会に参加するユーザ同士のチャット機能  
* 勉強会を検索する機能（カテゴリ、タグ、日時、場所を利用した検索機能）
* メール通知機能（任意でオンオフ可能）  
勉強会への参加、キャンセルがあった場合に開催者へメール  
勉強会参加者へ前日にリマインドメール  
指定したカテゴリ・タグの勉強会が登録されたらメール
* キャンセル待ち機能  
参加したい勉強会が満席の場合、キャンセル待ちをすることでキャンセルが発生した際に勉強会に参加できる機能
* レコメンド機能  
過去の参加した勉強会やストックしてある勉強会からオススメの勉強会を表示する機能
* 管理者権限  
管理者権限を持ったユーザは勉強会に関する全ての情報にアクセスできる機能  
その他、カテゴリやタグの追加もできる

# フレームワーク、技術、環境
## 実装済
* CI  
circleCIを用いて、GitHubへpushされた後に、rubocopとRSpecによるコードの自動テストを実行
* AWS  
EC2,S3を用いた本番環境の構築

## 実装予定
* CD  
CIで問題がなければ、本番環境(AWS)にデプロイ
* Vue.js  
Vue.jsを用いたリッチなUI/UXの構築
* AWS  
ECS,route53,ALBを用いた本番環境の構築
* コンテナ技術  
dockerを用いた開発環境の構築およびAWSへのデプロイ

# カタログ設計
https://docs.google.com/spreadsheets/d/1Db3BfOfdFIxmkHp6RAAkmCB9PGzONFtUvLjyrLuYpG0/edit?usp=sharing

# テーブル定義書
https://docs.google.com/spreadsheets/d/1iOPZgwKPlRvrNozj6JQp3Bimx7UwiQo_O1FAwTi5qmM/edit?usp=sharing

# ER図
https://drive.google.com/file/d/155DzINLIenc4p_3Fe5Ps0IiXtScDzi1w/view?usp=sharing

# 画面遷移図
https://docs.google.com/drawings/d/1tm1D59V1aG0bTsivnAOUnCMYl_XlwU420lQGER8PO54/edit?usp=sharing

# ワイヤーフレーム
https://docs.google.com/presentation/d/13QMMdMB9RycHXup1--BelNRvOYHaaNKXj--krSIolWo/edit?usp=sharing

# 使用Gem
* device
* kaminari
* acts-as-taggable-on
* ransack
* rails_admin
* materialize-sass
