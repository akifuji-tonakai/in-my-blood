# In My Blood
好きな動画のYoutubeリンクを投稿して、自己紹介をしよう
[![Image from Gyazo](https://i.gyazo.com/b38048e89ae16c34ca5b0c782aacf682.jpg)](https://gyazo.com/b38048e89ae16c34ca5b0c782aacf682)

# 課題解決
|
|


# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

- has_many :tags

## tags テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| tag_name   | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :urls

## urls テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| youtubepath | string     | null: false                    |
| tag         | references | null: false, foreign_key: true |

- belongs_to :tag
