## アプリケーション名

**-ながのCAKE-**

## テーマ

 長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイトになります。

## アプリケーション使用方法
```
$ git clone git@github.com:bell-jack-noireon/nagano_cake.git
$ cd nagano_cake
$ bundle install
$ rails db:migrate
$ rails db:seed
$ rails s
```
## テスト用アカウント

**-管理者用-**<br>
メールアドレス: admin@gmail.com<br>
パスワード: 111111<br>
管理者用ログインURL: /admin/sign_in

**-顧客用-**<br>
メールアドレス：public@gmail.com<br>
パスワード: 111111<br>

## 使用言語
- HTML
- CSS
- Ruby
- JavaScript

**フレームワーク**
- Ruby on Rails

## 機能概要
顧客側の機能
 

管理者側の機能
 

## gem一覧

| gem | 目的 |
----  | ----
|devise| ユーザー認証機能の実装 |
|enum_help| 日本語化機能の実装 |
|kaminari| ページネーションの実装 |
|bootstrap| レイアウト機能の実装 |
|font-awesome| アイコンの取得 |

## ER図
![ER図](ER図.jpg)

## 動作環境
- Ruby ver_3.1.2
- Rails ver_6.1.7.4

## 開発者
**ベルジャック・ノイレオン**
- 大塚 駿
- 会田 裕哉
- 古賀 聖矢
- 関上 乃衣
